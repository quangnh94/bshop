<?php

namespace backend\controllers;

use common\components\extend\RootController;
use common\components\output\Response;
use common\models\database\CategoriesItems;
use Yii;
use yii\helpers\Url;

class BaseController extends RootController {

    public function init() {
        parent::init();
    }

    public function beforeAction($event) { /* Đăng nhập rồi nhưng quay lại trang đăng nhập */
        if ($event->controller->id == 'auth' && $event->id == 'login' && Yii::$app->user->getId() != null) {
            return $this->redirect(Url::base());
        }
        /* Chưa đăng nhập nhưng lại vào trang khác */
        if (!($event->controller->id == 'auth' && $event->id == 'login') && Yii::$app->user->getId() == null) {
            return $this->redirect(Url::to(['auth/login']));
        }

        if (!\Yii::$app->params['auth']) {
            return true;
        }

        /* Bắt quyền có được cấp hay không */
        if (!in_array($event->controller->id, ["error", "auth", "home"]) && !Yii::$app->user->can($event->controller->id . "_" . $event->id)) {
            print_r('Chú làm éo có quyền mà vào đây');
            die;
        }
        return parent::beforeAction($event);
    }

    public function response(Response $response, $define = 'json') {
        Yii::$app->response->format = $define;
        return $response;
    }

    protected function getMenus() {
        $menu = CategoriesItems::getAll();
        if (!empty($menu)) {
            return $this->buildTree(0, $menu, []);
        } else {
            return [];
        }
    }

    protected function buildTree($parentId, $category, $tree, $level = 0) {
        $level++;
        foreach ($category as $val) {
            if ($val->parent_id == $parentId) {
                $lvl = '';
                for ($i = 0; $i < $level; $i++) {
                    $lvl .= '-- ';
                }
                $val->category_name = $lvl . $val->category_name;
                $tree[] = $val;
                $tree = $this->buildTree($val->id, $category, $tree, $level);
            }
        }
        return $tree;
    }

}

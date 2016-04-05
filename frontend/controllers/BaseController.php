<?php

namespace frontend\controllers;

use common\components\extend\RootController;
use common\components\output\Response;
use common\models\database\CategoriesItems;
use Yii;

class BaseController extends RootController {

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

    public function beforeAction($action) {
        if (Yii::$app->request->isAjax) {
            $this->checkAuth($action);
        }
        return parent::beforeAction($action);
    }

    protected function checkAuth($event) {
        $token = Yii::$app->request->getCsrfToken();
        $header = Yii::$app->request->headers;
        $auth = Yii::$app->params['auth'];
        if (!$auth || !isset($header['csrfToken']) || empty($header['csrfToken'])) {
            
        }
    }

}

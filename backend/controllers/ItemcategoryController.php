<?php

namespace backend\controllers;

use common\components\output\Response;
use common\components\utils\TextUtils;
use common\models\database\CategoriesItems;
use Yii;

class ItemcategoryController extends BaseController {

    public function init() {
        parent::init();
    }

    public function actionIndex() {
        $category = CategoriesItems::getAll();
        return $this->render('add', [
                    'category' => $category
        ]);
    }

    /**
     * AJAX METHOD - not access check - comming soon
     */
    public function actionAddnew() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $category = new CategoriesItems($params);
            $category->alias = TextUtils::removeMarks($category->category_name);
            $category->created_at = time();
            $category->updated_at = time();
            $resp = $category->save();
            if ($resp) {
                return $this->response(new Response(true, "Thêm mới dữ liệu thành công", $category));
            } else {
                return $this->response(new Response(false, "Thêm mới dữ liệu thất bại", $category->errors));
            }
        }
    }

    public function actionChangeactive() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $category = CategoriesItems::get($params['id']);
            $category->active = $category->active == 0 ? 1 : 0;
            $resp = $category->save(false);
            if ($resp) {
                return $this->response(new Response(true, "Thay đổi trạng thái thành công", $category));
            } else {
                return $this->response(new Response(false, "Thay đổi trạng thái thất bại", $category->errors));
            }
        }
    }

    public function actionGetcate() {
        $category = CategoriesItems::getAll();
        if (!empty($category)) {
            return $this->response(new Response(true, "Lấy dữ liệu thành công", $category));
        } else {
            return $this->response(new Response(false, "Lấy dữ liệu thất bại", []));
        }
    }

    public function actionNew() {
        $model = new CategoriesItems();
        print_r($this->getMenus());
        die;
        if ($model->load(Yii::$app->request->post())) {
            
        }
    }

    private function getMenus() {
        $menu = CategoriesItems::getAll();
        if (!empty($menu)) {
            return $this->buildTree(0, $menu, []);
        }
    }

    private function buildTree($parentId, $category, $tree, $level = 0) {
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

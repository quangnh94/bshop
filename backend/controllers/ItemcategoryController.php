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
        $this->staticClient = "itemscate.init();";
        return $this->render('index', [
                    'category' => $this->getMenus()
        ]);
    }

    public function actionNew() {
        $model = new CategoriesItems();
        if ($model->load(Yii::$app->request->post())) {
            $model->alias = TextUtils::removeMarks($model->category_name);
            $model->updated_at = time();
            $model->created_at = time();
            $resp = $model->save();
            if ($resp) {
                Yii::$app->getSession()->setFlash('success', "Thêm mới thành công");
            } else {
                Yii::$app->getSession()->setFlash('error', "Thêm mới thất bại");
            }
        }
        return $this->render('new', [
                    'model' => $model,
                    'category' => $this->getMenus()
        ]);
    }

    public function actionUpdate($id) {
        $model = CategoriesItems::get($id);
        if ($model->load(Yii::$app->request->post())) {
            $model->updated_at = time();
            $resp = $model->save(false);
            if ($resp) {
                Yii::$app->session->setFlash('success', "Sửa thành công");
            } else {
                Yii::$app->session->setFlash('failed', "Sửa thất bại");
            }
        }
        $this->staticClient = 'itemscate.init(\'' . $id . '\')';
        return $this->render('update', [
                    'model' => $model,
                    'category' => $this->getMenus()
        ]);
    }

    /**
     * AJAX METHOD - not access check - comming soon
     */
    private function beforeCheck($models) {
        
    }

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

    public function actionChangelink() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $category = CategoriesItems::get($params['id']);
            $category->alias = TextUtils::removeMarks($params['value']);
            $resp = $category->save(false);
            if ($resp) {
                return $this->response(new Response(true, "Thay đổi trạng thái thành công", $category));
            } else {
                return $this->response(new Response(false, "Thay đổi trạng thái thất bại", $category->errors));
            }
        }
    }

    public function actionRemove() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $del = CategoriesItems::existsChild($params['id']);
            if ($del == false) {
                return $this->response(new Response(false, "Vui lòng xóa hoặc di chuyển danh mục con", []));
            } else {
                $resp = $del->delete();
                if ($resp) {
                    return $this->response(new Response(true, "Xóa thành công", []));
                } else {
                    return $this->response(new Response(false, "Xóa không thành công", $category->errors));
                }
            }
        }
    }

}

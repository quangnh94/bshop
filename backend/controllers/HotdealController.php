<?php

namespace backend\controllers;

use common\components\output\Response;
use common\components\utils\TextUtils;
use common\models\database\Hotdeal;
use Yii;

class HotdealController extends BaseController {

    public function actionIndex() {
        $hotdeal = Hotdeal::getAll();
        $this->staticClient = 'hotdeal.init();';
        return $this->render('index', [
                    'hotdeal' => $hotdeal
        ]);
    }

    public function actionAdd() {
        $model = new Hotdeal();
        if ($model->load(Yii::$app->request->post())) {
            $model->created_at = time();
            $model->updated_at = time();
            $resp = $model->save();
            if ($resp) {
                \Yii::$app->getSession()->setFlash('success', "Thêm mới thành công");
            } else {
                \Yii::$app->getSession()->setFlash('error', "Thêm mới không thành công");
            }
            return $this->refresh();
        }
        return $this->render('add', [
                    'model' => $model
        ]);
    }

    public function actionUpdate($id) {
        $model = Hotdeal::getOne($id);
        if ($model->load(Yii::$app->request->post())) {
            $model->created_at = time();
            $model->updated_at = time();
            $resp = $model->save();
            if ($resp) {
                \Yii::$app->getSession()->setFlash('success', "Sửa thành công");
            } else {
                \Yii::$app->getSession()->setFlash('error', "Sửa không thành công");
            }
        }
        return $this->render('update', [
                    'model' => $model
        ]);
    }

    /**
     * AJAX HOTDEAL
     */
    public function actionGet() {
        $params = \Yii::$app->request->post();
        if (!empty($params)) {
            $box = Hotdeal::getDealWithItem(false, $params['id']);
            if (!empty($box)) {
                return $this->response(new Response(true, "Lấy dữ liệu thành công", $box));
            } else {
                return $this->response(new Response(false, "Lỗi hệ thống , lấy dữ liệu thất bại", []));
            }
        }
    }

    public function actionRemove() {
        $params = \Yii::$app->request->post();
        if (!empty($params)) {
            $box = Hotdeal::getOne($params['id']);
            if (!empty($box)) {
                $result = $box->delete();
                if ($result) {
                    return $this->response(new Response(true, "Xóa dữ liệu thành công", []));
                } else {
                    return $this->response(new Response(false, "Xóa dữ liệu thất bại , lỗi hệ thống , vui lòng thử lại", []));
                }
            }
        }
    }

    public function actionSearchbox() {
        $params = \Yii::$app->request->post();
        if (!empty($params)) {
            if (!empty($params['item_ids'])) {
                $items = Hotdeal::getDealWithItem(true, $params['item_ids']);
            }
            if (!empty($params['item_name']) && $params['item_name'] != '') {
                $items_name = Hotdeal::getDealWithName($params['item_name']);
            }
        }
    }

}

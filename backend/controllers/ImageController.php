<?php

namespace backend\controllers;

use common\components\output\Response;
use common\models\database\Images;
use Yii;

class ImageController extends BaseController {

    public function actionIndex() {
        
    }

    /**
     * Lấy 1 đối tượng images trong bảng images
     */
    public function actionGet() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $images = Images::tokenGet($params['token']);
            if (!empty($images))
                return $this->response(new Response(true, "Lấy dữ liệu thành công", $images));
            else
                return $this->response(new Response(false, "Lấy dữ liệu không thành công", []));
        }
    }

    /**
     * Xóa ảnh
     */
    public function actionRemove() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $rootPath = $_SERVER['DOCUMENT_ROOT'] . '/bshop/frontend/web/uploads/';
            $images = Images::getImage($params['id']);
            $fileName = $rootPath . $images->images_router;
            $r = $images->delete();
            if ($r) {
                unlink($fileName);
                return $this->response(new Response(true, "Xóa ảnh thành công", []));
            } else {
                return $this->response(new Response(true, "Xóa ảnh không thành công", []));
            }
        }
    }

    /**
     * Upload ảnh 
     */
    public function actionUpload() {
        $params = Yii::$app->request->post();
        if (!empty($params) && !empty($_FILES)) {
            $fileName = time() . $_FILES['file']['name'];
            $upload = move_uploaded_file($_FILES['file']['tmp_name'], Yii::getAlias('@frontend') . '/web/uploads/' . $fileName);
            if ($upload) {
                $images = new Images();
                $images->token = $params['token'];
                $images->type_object = Images::ITEMS_TYPE;
                $images->user_id = \Yii::$app->user->getId();
                $images->images_router = $fileName;
                $result = $images->save(false);
                if ($result) {
                    return $this->response(new Response(true, "Tải ảnh lên thành công", $images));
                } else
                    return $this->response(new Response(false, "Tải ảnh lên không thành công", []));
            }
        }
    }

}

<?php

namespace backend\controllers;

use common\components\utils\TextUtils;
use common\models\database\Items;
use Yii;
use yii\web\Cookie;
use yii\web\Response;

class ItemsController extends BaseController {

    public function actionIndex() {
        return $this->render('index');
    }

    public function actionAdd() {
        $model = new Items();
        if ($model->load(Yii::$app->request->post())) {
            $model->alias = TextUtils::removeMarks($model->item_name);
            $model->user_id = \Yii::$app->user->getId();
            $result = $model->save(false);
            if ($result) {
                $images = Yii::$app->request->cookies->getValue('file');
                foreach ($images as $image) {
                    move_uploaded_file($image['tmp_name'], './uploads/' . time() . $image['name']);
                }
                \Yii::$app->session->setFlash('success', 'Thêm mới sản phẩm thành công');
                return $this->refresh();
            } else {
                \Yii::$app->session->setFlash('error', 'Thêm mới sản phẩm thất bại');
            }
        }
        $this->staticClient = 'items.init();';
        return $this->render('add', [
                    'model' => $model
        ]);
    }

    public function actionUpload() {
        if (!empty($_FILES)) {
            $cookpost = Yii::$app->response->cookies;
            $cookpost->add(new Cookie([
                'name' => 'file',
                'value' => $_FILES,
            ]));
            return $this->response(new Response(true, 'Upload ảnh thành công', []));
        }
    }

}

<?php

namespace backend\controllers;

use common\components\output\Response;
use common\components\utils\TextUtils;
use common\models\database\Images;
use common\models\database\Items;
use Yii;

class ItemsController extends BaseController {

    public function actionIndex() {
        return $this->render('index');
    }

    public $token = null;

    public function actionAdd() {
        $model = new Items();

        if ($model->load(Yii::$app->request->post())) {
            $model->alias = TextUtils::removeMarks($model->item_name);
            $model->user_id = \Yii::$app->user->getId();
            $model->token = $this->token;
            $result = $model->save(false);
            if ($result) {
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
            $this->token = base64_encode(TextUtils::generateRandomString(30));
            $fileName = time() . $_FILES['file']['name'];
            $upload = move_uploaded_file($_FILES['file']['tmp_name'], Yii::getAlias('@frontend') . '/web/uploads/' . $fileName);
            if ($upload) {
                $images = new Images();
                $images->token = $this->token;
                $images->type_object = Images::ITEMS_TYPE;
                $images->user_id = \Yii::$app->user->getId();
                $images->images_router = $fileName;
                $result = $images->save(false);
                if ($result) {
                    return $this->response(new Response(true, "Tải ảnh lên thành công", ['router' => $images->images_router]));
                } else
                    return $this->response(new Response(false, "Tải ản lên không thành công", []));
            }
        }
    }

}

<?php

namespace backend\controllers;

use common\components\output\Response;
use common\components\utils\TextUtils;
use common\models\database\Images;
use common\models\database\Items;
use Yii;
use yii\data\ActiveDataProvider;

class ItemsController extends BaseController {

    public function init() {
        parent::init();
    }

    public function actionIndex() {
        $provider = new ActiveDataProvider([
            'query' => Items::find(),
            'pagination' => [
                'pageSize' => 100,
            ],
            'sort' => [
                'defaultOrder' => [
                    'created_at' => SORT_DESC
                ]
            ],
        ]);
        return $this->render('index', [
                    'provider' => $provider
        ]);
    }

    public function actionAdd() {
        $model = new Items();
        $model->token = Yii::$app->session->get('secret-key');
        if ($model->load(Yii::$app->request->post())) {
            $model->alias = TextUtils::removeMarks($model->item_name);
            $model->user_id = \Yii::$app->user->getId();
            $model->sell_price = str_replace('.', '', $model->sell_price);
            $model->root_price = str_replace('.', '', $model->root_price);
            $result = $model->save(false);
            if ($result) {
                \Yii::$app->session->setFlash('success', 'Thêm mới sản phẩm thành công');
                \Yii::$app->session->remove('secret-key');
                return $this->refresh();
            } else {
                \Yii::$app->session->setFlash('error', 'Thêm mới sản phẩm thất bại');
            }
        } else {
            Yii::$app->session->set('secret-key', base64_encode(TextUtils::generateRandomString(30)));
        }
        $this->staticClient = 'items.init(); image.init();';
        return $this->render('add', [
                    'model' => $model
        ]);
    }

    public function actionUpdate($id) {
        $model = Items::getItem($id);
        if ($model->load(Yii::$app->request->post())) {
            $model->updated_at = time();
            $model->sell_price = str_replace('.', '', $model->sell_price);
            $model->root_price = str_replace('.', '', $model->root_price);
            $model->alias = TextUtils::removeMarks($model->item_name);
            $model->save(false);
        }
        $this->staticClient = 'items.init(); image.render(\'' . $model->token . '\');';
        return $this->render('update', [
                    'model' => $model
        ]);
    }

    /**
     * AJAX METHOD - not vetifined access - coming soon
     * @return type
     */
    public function actionUpload() {
        if (!empty($_FILES)) {
            $tmp = $_FILES['file']['tmp_name'];
            $fileName = time() . $_FILES['file']['name'];
            $upload = move_uploaded_file($tmp, Yii::getAlias('@frontend') . '/web/uploads/' . $fileName);
            if ($upload) {
                $images = new Images();
                $images->token = Yii::$app->session->get('secret-key');
                $images->type_object = Images::ITEMS_TYPE;
                $images->user_id = \Yii::$app->user->getId();
                $images->images_router = $fileName;
                $result = $images->save(false);
                if ($result) {
                    return $this->response(new Response(true, "Tải ảnh lên thành công", $images));
                } else
                    return $this->response(new Response(false, "Tải ản lên không thành công", []));
            }
        }
    }

    public function actionRemove() {
        $params = \Yii::$app->request->post();
    }

}

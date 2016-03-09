<?php

namespace backend\controllers;

use common\models\database\Hotdeal;
use common\models\database\Items;
use Yii;

class HotdealController extends BaseController {

    public function actionIndex() {
        $hotdeal = Hotdeal::getAllWithItem();
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
            return $this->refresh();
        }
        return $this->render('add', [
                    'model' => $model
        ]);
    }

    public function actionUpdate($id) {
        
    }

}

<?php

namespace backend\controllers;

use backend\models\ItemsForm;

class ItemsController extends BaseController {

    public function actionIndex() {
        return $this->render('index');
    }

    public function actionAdd() {
        $model = new ItemsForm();
        return $this->render('add', [
                    'model' => $model
        ]);
    }

    public function actionUpdate() {
        
    }

}

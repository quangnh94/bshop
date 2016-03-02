<?php

namespace backend\controllers;

use common\components\output\Response;
use common\components\utils\TextUtils;
use common\models\database\Images;
use common\models\database\Items;
use Yii;
use yii\data\ActiveDataProvider;

class ItemcategoryController extends BaseController {

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

}

<?php

namespace backend\controllers;

use common\components\output\Response;
use common\components\utils\TextUtils;
use common\models\database\Hotdeal;
use Yii;

class ConfigController extends BaseController {

    public function actionIndex() {
        return $this->render('index');
    }

}

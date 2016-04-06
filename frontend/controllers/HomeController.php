<?php

namespace frontend\controllers;

use common\models\database\Hotdeal;
use common\models\database\Items;

class HomeController extends BaseController {

    public function actionIndex() {
        $box = Hotdeal::resolveBox();
        return $this->render('index', [
                    'hotdeal' => $box
        ]);
    }

}

<?php

namespace frontend\controllers;

use common\models\database\Hotdeal;

class HomeController extends BaseController {

    public function actionIndex() {
        $box = Hotdeal::resolveBox();
        return $this->render('index', [
                    'hotdeal' => $box
        ]);
    }

}

<?php

namespace frontend\controllers;

use common\models\database\Hotdeal;

class DetailController extends BaseController {

    public function actionIndex() {
        $box = Hotdeal::resolveBox();
        return $this->render('index', [
                    'hotdeal' => $box
        ]);
    }

}

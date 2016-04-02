<?php

namespace frontend\controllers;

use common\models\database\Items;

class DetailController extends BaseController {

    public function actionView($id) {
        $item = Items::getItems($id, true);
        return $this->render('view', [
                    'item' => $item
        ]);
    }

}

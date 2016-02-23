<?php

namespace backend\controllers;

class HomeController extends BaseController {

    public function actionIndex() {
        return $this->render('index');
    }

}

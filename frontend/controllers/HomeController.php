<?php

namespace frontend\controllers;

class HomeController extends BaseController {

    public function actionIndex() {
        
        return $this->render('index');
    }

}

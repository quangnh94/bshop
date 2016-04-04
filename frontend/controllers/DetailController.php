<?php

namespace frontend\controllers;

use common\components\output\Response;
use common\models\database\Items;
use common\models\database\ItemsProperties;
use Yii;

class DetailController extends BaseController {

    public function actionView($id) {
        $item = Items::getItems($id, true);

        $ids_getPop = [];
        if (!empty($item->prop)) {
            foreach ($item->prop as $value) {
                $ids_getPop[$value->id] = $value->id;
            }
        }

        $this->var['init'] = "item.loadProp('" . json_encode($ids_getPop) . "')";
        return $this->render('view', [
                    'item' => $item
        ]);
    }

    public function actionGetpop() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $prop = ItemsProperties::getPopValue($params);
            if (!empty($prop)) {
                return $this->response(new Response(true, "Lấy dữ liệu thành công", $prop));
            } else {
                return $this->response(new Response(true, "Lấy dữ liệu không thành công", []));
            }
        }
    }

}

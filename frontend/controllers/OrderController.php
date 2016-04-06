<?php

namespace frontend\controllers;

use common\components\output\Response;
use common\models\database\Items;
use common\models\database\Order;
use Yii;

class OrderController extends BaseController {

    public function actionAddcart() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $item = Items::getItems($params['id'], true);
            if (isset($params['color']) && isset($params['size'])) {
                $properties['color'] = $params['color'];
                $properties['size'] = $params['size'];
            }
            $item->prop = json_encode($properties);
            $item->quantity = $params['quantity'];
            $orderItem = Order::buildItem($item);
            $cart = Order::addCart($orderItem);
            return $this->response(new Response($success, $message, $data));
        }
    }

}

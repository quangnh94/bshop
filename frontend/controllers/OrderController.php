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
            if (empty($cart)) {
                return $this->response(new Response(false, "Hiện tại giỏ hàng không có sản phẩm", []));
            }
            return $this->response(new Response(true, "Cho sản phẩm vào giỏ hàng thành công", $cart));
        }
    }

    public function actionViewcart() {
        if (!empty(\Yii::$app->session->get('cart'))) {
            return $this->response(new Response(true, "Lấy sản phẩm thành công", \Yii::$app->session->get('cart')));
        } else {
            return $this->response(new Response(true, "Giỏ hàng trống", []));
        }
    }

}

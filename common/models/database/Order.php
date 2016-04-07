<?php

namespace common\models\database;

use Yii;

/**
 * This is the model class for table "order".
 *
 * @property integer $order_id
 * @property string $buyer_email
 * @property string $buyer_name
 * @property string $buyer_phone
 * @property string $buyer_address
 * @property string $receive_email
 * @property string $receive_name
 * @property string $receive_phone
 * @property string $receive_address
 * @property string $recive_district
 * @property integer $remove_trade
 * @property integer $payment_type
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $remove
 */
class Order extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'order';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['buyer_email', 'buyer_name', 'buyer_phone', 'buyer_address', 'receive_email', 'receive_name', 'receive_phone', 'receive_address', 'recive_district', 'remove_trade', 'payment_type', 'created_at', 'updated_at'], 'required'],
            [['remove_trade', 'payment_type', 'created_at', 'updated_at', 'remove'], 'integer'],
            [['buyer_email', 'buyer_name', 'buyer_address', 'receive_email', 'receive_name', 'receive_address', 'recive_district'], 'string', 'max' => 250],
            [['buyer_phone', 'receive_phone'], 'string', 'max' => 11]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'order_id' => 'Order ID',
            'buyer_email' => 'Buyer Email',
            'buyer_name' => 'Buyer Name',
            'buyer_phone' => 'Buyer Phone',
            'buyer_address' => 'Buyer Address',
            'receive_email' => 'Receive Email',
            'receive_name' => 'Receive Name',
            'receive_phone' => 'Receive Phone',
            'receive_address' => 'Receive Address',
            'recive_district' => 'Recive District',
            'remove_trade' => 'Remove Trade',
            'payment_type' => 'Payment Type',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'remove' => 'Remove',
        ];
    }

    public static function getCart($cart = null, $remove = false) {
        if (!empty($cart)) {
            \Yii::$app->session->set('cart', $cart);
        }
        if ($remove) {
            \Yii::$app->session->set('cart', '');
        }
        $cart = Yii::$app->session->get('cart');
        return $cart;
    }

    public static function addCart(OrderItems $items) {
        $cart = self::getCart();
        if (!empty($cart)) {
            if (array_key_exists($items->item_id, $cart)) {
                if ($items->quantity > 0) {
                    $items->quantity += $cart[$items->item_id]->quantity;
                } else {
                    $cart[$items->item_id]->quantity += 1;
                }
            }
            $cart[$items->item_id] = $items;
        } else {
            $cart[$items->item_id] = $items;
        }
        return self::getCart($cart);
    }

    public static function buildItem(Items $item) {
        $orderItem = new OrderItems();
        $orderItem->name = $item->item_name;
        $orderItem->root_price = $item->root_price != 0 || $item->root_price != '' ? $item->root_price : 0;
        $orderItem->sell_price = $item->sell_price;
        $orderItem->property = $item->prop;
        $orderItem->item_id = $item->id;
        $orderItem->quantity = $item->quantity != 0 ? $item->quantity : 0;
        if (!empty($item->images)) {
            $orderItem->images = isset($item->images[0]) ? $item->images[0] : '';
        }
        return $orderItem;
    }

}

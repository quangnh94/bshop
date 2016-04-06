<?php

namespace common\models\database;

use Yii;

/**
 * This is the model class for table "order_items".
 *
 * @property integer $order_id
 * @property integer $item_id
 * @property string $name
 * @property double $root_price
 * @property double $sell_price
 * @property integer $quantity
 * @property string $property
 * @property string $note
 */
class OrderItems extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'order_items';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['order_id', 'item_id', 'name', 'root_price', 'sell_price', 'quantity', 'property'], 'required'],
            [['order_id', 'item_id', 'quantity'], 'integer'],
            [['root_price', 'sell_price'], 'number'],
            [['property', 'note'], 'string'],
            [['name'], 'string', 'max' => 250]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'order_id' => 'Order ID',
            'item_id' => 'Item ID',
            'name' => 'Name',
            'root_price' => 'Root Price',
            'sell_price' => 'Sell Price',
            'quantity' => 'Quantity',
            'property' => 'Property',
        ];
    }

    public function attributes() {
        return array_merge(
                parent::attributes(), ['images']
        );
    }

}

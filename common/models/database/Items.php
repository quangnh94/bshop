<?php

namespace common\models\database;

use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "items".
 *
 * @property integer $id
 * @property string $item_name
 * @property string $description
 * @property string $content
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $alias
 * @property integer $active
 * @property integer $category_id
 * @property double $root_price
 * @property double $sell_price
 * @property integer $quantity
 * @property integer $sold_quantity
 * @property string $user_id
 * @property string $token
 */
class Items extends ActiveRecord {

    public function behaviors() {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'items';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['item_name', 'description', 'created_at', 'updated_at', 'alias', 'category_id', 'root_price', 'sell_price', 'quantity', 'sold_quantity'], 'required'],
            [['content', 'user_id', 'token'], 'string'],
            [['created_at', 'updated_at', 'active', 'category_id', 'quantity', 'sold_quantity'], 'integer'],
            [['root_price', 'sell_price'], 'number'],
            [['item_name', 'description'], 'string', 'max' => 350],
            [['alias'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'item_name' => 'Tên sản phẩm',
            'description' => 'Mô tả',
            'content' => 'Nội dung',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'alias' => 'Alias',
            'active' => 'Trạng thái sản phẩm',
            'category_id' => 'Nhóm sản phẩm',
            'root_price' => 'Giá gốc',
            'sell_price' => 'Giá bán',
            'quantity' => 'Số lượng',
            'sold_quantity' => 'Sold Quantity',
            'user_id' => 'User ID',
        ];
    }

}

<?php

namespace common\models\database;

use Yii;

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
 * @property integer $user_id
 */
class Items extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'items';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['item_name', 'description', 'content', 'created_at', 'updated_at', 'alias', 'category_id', 'root_price', 'sell_price', 'quantity', 'sold_quantity'], 'required'],
            [['content'], 'string'],
            [['created_at', 'updated_at', 'active', 'category_id', 'quantity', 'sold_quantity', 'user_id'], 'integer'],
            [['root_price', 'sell_price'], 'number'],
            [['item_name', 'description'], 'string', 'max' => 350],
            [['alias'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'item_name' => 'Item Name',
            'description' => 'Description',
            'content' => 'Content',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'alias' => 'Alias',
            'active' => 'Active',
            'category_id' => 'Category ID',
            'root_price' => 'Root Price',
            'sell_price' => 'Sell Price',
            'quantity' => 'Quantity',
            'sold_quantity' => 'Sold Quantity',
            'user_id' => 'User ID',
        ];
    }
}

<?php

namespace backend\models;

use yii\base\Model;

class ItemsForm extends Model {

    public $id;
    public $item_name;
    public $description;
    public $content;
    public $created_at;
    public $updated_at;
    public $alias;
    public $active;
    public $category_id;
    public $root_price;
    public $sell_price;
    public $quantity;
    public $sold_quantity;
    public $user_id;
    public $images;

    public function rules() {
        return [
            [['item_name', 'description', 'content', 'created_at', 'updated_at', 'alias', 'category_id', 'sell_price', 'quantity', 'sold_quantity'], 'required'],
            [['content'], 'string'],
            [['created_at', 'updated_at', 'active', 'category_id', 'quantity', 'sold_quantity', 'user_id'], 'integer'],
            [['root_price', 'sell_price'], 'double'],
            [['item_name', 'description'], 'string', 'max' => 350],
            [['alias'], 'string', 'max' => 500],
        ];
    }

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

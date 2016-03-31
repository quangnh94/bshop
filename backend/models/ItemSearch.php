<?php

namespace backend\models;

use yii\base\Model;

class ItemSearch extends Model {

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
    public $token;
    
    
}

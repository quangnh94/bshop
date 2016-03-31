<?php

namespace backend\models;

use common\models\database\Items;
use yii\base\Model;
use yii\data\ActiveDataProvider;

class ItemSearch extends Model {

    const ACTIVE = 1;
    const UNACTIVE = 0;

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
    public $size = 50;

    public function filter() {
        $query = Items::find();
        if ($this->item_name != null && $this->item_name != '') {
            $query->andWhere(["LIKE", "item_name", $this->item_name]);
        }

        if (!empty($this->active) && $this->active != '') {
            $query->andWhere(["=", "active", $this->active == self::ACTIVE ? 1 : 0]);
        }

        return new ActiveDataProvider([
            'query' => $query,
            'pagination' => [
                'pageSize' => $this->size
            ],
            'sort' => [
                'defaultOrder' => [
                    'created_at' => SORT_DESC
                ],
            ],
        ]);
    }

}

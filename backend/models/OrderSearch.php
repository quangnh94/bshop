<?php

namespace backend\models;

use common\models\database\Items;
use yii\base\Model;
use yii\data\ActiveDataProvider;

class OrderSearch extends Model {

    const ACTIVE = 1;
    const UNACTIVE = 0;

    public $order_id;
    public $buyer_email;
    public $buyer_name;
    public $buyer_phone;
    public $buyer_address;
    public $receive_email;
    public $receive_name;
    public $receive_phone;
    public $receive_address;
    public $recive_district;
    public $remove_trade;
    public $payment_type;
    public $created_at;
    public $updated_at;
    public $remove;
    public $size = 50;

    public function filter() {
        $query = Items::find();

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

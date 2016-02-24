<?php

namespace backend\models;

use yii\base\Model;

class ItemsForm extends Model {

    

    public function rules() {
        return [
            [['email', 'password'], 'required', 'message' => '{attribute} không được để trống'],
            ['email', 'email'],
            [['password'], 'string']
        ];
    }

    public function attributeLabels() {
        return [
            'email' => 'Email',
            'password' => 'Mật khẩu',
        ];
    }

}

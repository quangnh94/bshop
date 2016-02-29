<?php

namespace common\models\database;

use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "images".
 *
 * @property integer $id
 * @property string $images_router
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $object_id
 * @property string $type_object
 * @property string $token
 * @property string $user_id
 */
class Images extends ActiveRecord {

    const ITEMS_TYPE = 'items';

    public function behaviors() {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'images';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['images_router', 'created_at', 'updated_at', 'object_id', 'type_object'], 'required'],
            [['created_at', 'updated_at', 'object_id'], 'integer'],
            [['images_router'], 'string', 'max' => 800],
            [['type_object', 'token', 'user_id'], 'string', 'max' => 250]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'images_router' => 'Images Router',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'object_id' => 'Object ID',
            'type_object' => 'Type Object',
        ];
    }

    public static function getImage($id) {
        return self::findOne($id);
    }

    public static function tokenGet($token) {
        return self::findAll(['token' => $token]);
    }

}

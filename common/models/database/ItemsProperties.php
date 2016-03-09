<?php

namespace common\models\database;

use Yii;

/**
 * This is the model class for table "items_properties".
 *
 * @property integer $id
 * @property string $property_name
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $active
 * @property integer $item_id
 * @property integer $parent_id
 * @property string $property_value
 */
class ItemsProperties extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'items_properties';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['property_name', 'created_at', 'updated_at', 'item_id', 'parent_id', 'property_value'], 'required'],
            [['created_at', 'updated_at', 'active', 'item_id', 'parent_id'], 'integer'],
            [['property_name', 'property_value'], 'string', 'max' => 250]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'property_name' => 'Property Name',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'active' => 'Active',
            'item_id' => 'Item ID',
            'parent_id' => 'Parent ID',
            'property_value' => 'Property Value',
        ];
    }

    public static function getAllById($id) {
        return self::findAll(['item_id' => $id]);
    }

    public static function getAllByParent($id) {
        return self::findAll(['parent_id' => $id]);
    }

    public static function removeP($id) {
        $parent = self::findOne(['parent_id' => $id]);
        if (!empty($parent)) {
            return false;
        }
        $data = self::findOne($id);
        return $data->delete();
    }

    public static function get($id) {
        return self::findOne($id);
    }

}

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
 */
class ItemsProperties extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'items_properties';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['property_name', 'created_at', 'updated_at'], 'required'],
            [['created_at', 'updated_at', 'active'], 'integer'],
            [['property_name'], 'string', 'max' => 250]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'property_name' => 'Property Name',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'active' => 'Active',
        ];
    }
}

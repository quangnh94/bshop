<?php

namespace common\models\database;

use Yii;

/**
 * This is the model class for table "items_properties_value".
 *
 * @property integer $id
 * @property string $value_name
 * @property string $value
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $parent_id
 * @property integer $active
 */
class ItemsPropertiesValue extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'items_properties_value';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['value_name', 'value', 'created_at', 'updated_at', 'parent_id', 'active'], 'required'],
            [['created_at', 'updated_at', 'parent_id', 'active'], 'integer'],
            [['value_name', 'value'], 'string', 'max' => 250]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'value_name' => 'Value Name',
            'value' => 'Value',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'parent_id' => 'Parent ID',
            'active' => 'Active',
        ];
    }
}

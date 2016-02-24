<?php

namespace common\models\database;

use Yii;

/**
 * This is the model class for table "images".
 *
 * @property integer $id
 * @property string $images_router
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $object_id
 * @property string $type_object
 */
class Images extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'images';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['images_router', 'created_at', 'updated_at', 'object_id', 'type_object'], 'required'],
            [['created_at', 'updated_at', 'object_id'], 'integer'],
            [['images_router'], 'string', 'max' => 800],
            [['type_object'], 'string', 'max' => 250]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'images_router' => 'Images Router',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'object_id' => 'Object ID',
            'type_object' => 'Type Object',
        ];
    }
}
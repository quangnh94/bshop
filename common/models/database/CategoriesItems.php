<?php

namespace common\models\database;

use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "categories_items".
 *
 * @property integer $id
 * @property string $category_name
 * @property string $alias
 * @property integer $parent_id
 * @property integer $created_at
 * @property integer $updated_at
 * @property integer $active
 */
class CategoriesItems extends ActiveRecord {

    public function behaviors() {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'categories_items';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['category_name', 'alias', 'created_at', 'updated_at'], 'required'],
            [['parent_id', 'created_at', 'updated_at', 'active'], 'integer'],
            [['category_name'], 'string', 'max' => 250],
            [['alias'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'category_name' => 'Category Name',
            'alias' => 'Alias',
            'parent_id' => 'Parent ID',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'active' => 'Active',
        ];
    }

    public static function getAll() {
        return self::find()->orderBy('category_name ASC')->all();
    }

    public static function get($id) {
        return self::findOne($id);
    }

}

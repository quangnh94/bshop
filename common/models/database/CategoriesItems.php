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
            [['alias'], 'string', 'max' => 500],
            [['alias'], 'unique']
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

    public static function existsChild($id) {
        $child = self::findOne(['parent_id' => $id]);
        if (!empty($child)) {
            return false;
        } else {
            return self::get($id);
        }
    }

    public static function createPath($category_id, $path = []) {
        $category = self::findOne($category_id);
        $path[] = $category->id;
        if ($category == null || $category->parent_id == null || $category->parent_id == 0) {
            return json_encode(array_reverse($path));
        }
        return self::createPath($category->parent_id, $path);
    }

}

<?php

namespace common\models\database;

use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "items".
 *
 * @property integer $id
 * @property string $item_name
 * @property string $description
 * @property string $content
 * @property integer $created_at
 * @property integer $updated_at
 * @property string $alias
 * @property integer $active
 * @property integer $category_id
 * @property double $root_price
 * @property double $sell_price
 * @property integer $quantity
 * @property integer $sold_quantity
 * @property string $user_id
 * @property string $token
 * @property string $path
 */
class Items extends ActiveRecord {

    public function behaviors() {
        return [
            TimestampBehavior::className(),
        ];
    }

    public function init() {
        parent::init();
    }

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'items';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['item_name', 'description', 'content', 'created_at', 'updated_at', 'alias', 'category_id', 'root_price', 'sell_price', 'quantity', 'sold_quantity', 'token', 'path'], 'required'],
            [['content'], 'string'],
            [['created_at', 'updated_at', 'active', 'category_id', 'quantity', 'sold_quantity'], 'integer'],
            [['root_price', 'sell_price'], 'number'],
            [['item_name', 'description'], 'string', 'max' => 350],
            [['alias'], 'string', 'max' => 500],
            [['user_id'], 'string', 'max' => 200],
            [['token', 'path'], 'string', 'max' => 250]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'item_name' => 'Tên sản phẩm',
            'description' => 'Mô tả',
            'content' => 'Nội dung',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'alias' => 'Alias',
            'active' => 'Trạng thái sản phẩm',
            'category_id' => 'Nhóm sản phẩm',
            'root_price' => 'Giá gốc',
            'sell_price' => 'Giá bán',
            'quantity' => 'Số lượng',
            'sold_quantity' => 'Sold Quantity',
            'user_id' => 'User ID',
            'token' => 'Token',
            'path' => 'Path',
        ];
    }

    public static function getItem($id) {
        return self::findOne($id);
    }

    public function attributes() {
        return array_merge(
                parent::attributes(), ['images'], ['prop']
        );
    }

    public static function getItems($ids, $properties = false) {
        $items = Items::find()
                ->select('id, item_name, created_at, updated_at, active, root_price, sell_price, quantity, token, description')
                ->where('id IN (' . $ids . ')')
                ->all();

        $tokens = [];
        foreach ($items as $item) {
            $tokens[] = "'" . $item->token . "'";
        }

        $impToken = implode(',', $tokens);
        $images = Images::find()
                ->select('images_router, token')
                ->where('token IN (' . $impToken . ')')
                ->all();

        foreach ($items as $item) {
            $image = [];
            foreach ($images as $i) {
                if ($item->token == $i->token) {
                    $image[] = $i->images_router;
                }
            }
            $item->images = $image;
        }

        if ($properties) {
            $prop = ItemsProperties::getProp($ids);
            if (isset($items[0]) && count($items) <= 1) {
                $items[0]->prop = $prop;
                return $items[0];
            }
        }
        return $items;
    }

}

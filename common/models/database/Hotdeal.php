<?php

namespace common\models\database;

use Yii;

/**
 * This is the model class for table "hotdeal".
 *
 * @property integer $id
 * @property string $name
 * @property string $items
 * @property integer $active
 * @property integer $created_at
 * @property integer $updated_at
 */
class Hotdeal extends \yii\db\ActiveRecord {

    /**
     * @inheritdoc
     */
    public static function tableName() {
        return 'hotdeal';
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['name', 'items', 'created_at', 'updated_at'], 'required'],
            [['items'], 'string'],
            [['active', 'created_at', 'updated_at'], 'integer'],
            [['name'], 'string', 'max' => 250]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels() {
        return [
            'id' => 'ID',
            'name' => 'Tên hotdeal',
            'items' => 'Sản phẩm của bạn',
            'active' => 'Trạng thái',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    public static function getAllWithItem() {
        $hotdeal = self::find()->orderBy('created_at DESC')->all();
        $itemIds = [];
        foreach ($hotdeal as $val) {
            $itemIds = array_merge(explode(',', $val->items), $itemIds);
        }

        $ids = implode(',', $itemIds);
        $items = Items::find()
                ->select('id, item_name, created_at, updated_at, active, root_price, sell_price, quantity, token')
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

        foreach ($hotdeal as $val) {
            $itemIds = [];
            $itemId = explode(",", $val->items);
            foreach ($itemId as $id) {
                $itemIds[] = $id;
            }

            $listItem = [];
            foreach ($itemIds as $id) {
                foreach ($items as $item) {
                    if ($id == $item->id) {
                        $listItem[] = $item;
                        break;
                    }
                }
            }
            $val->items = $listItem;
        }

        return $hotdeal;
    }

}

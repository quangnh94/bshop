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
 * @property string $alias
 */
class Hotdeal extends \yii\db\ActiveRecord {

    const NEWS_BOX = 'news';
    const LEFT_BOX = 'bestseller';
    const SALE_BOX = 'sale';
    const FEATURE_BOX = 'feature';

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
            [['name', 'items', 'created_at', 'updated_at', 'alias'], 'required'],
            [['items', 'alias'], 'string'],
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
            'alias' => 'Vị trí đặt box'
        ];
    }

    /**
     * Lấy hotdeal có convert items bên trong hotdeal
     * @param type $type
     * @param array $id
     * @return type
     */
    public static function getDealWithItem($type = false, $id = null) {
        $itemIds = [];
        $hotdeal = null;
        if ($type) {
            $hotdeal = self::find()->where(['active' => 1])->orderBy('created_at DESC')->all();
            foreach ($hotdeal as $val) {
                $itemIds = array_merge(explode(',', $val->items), $itemIds);
            }
        } else {
            $hotdeal = self::findOne($id);
            $itemIds = array_merge(explode(',', $hotdeal->items), $itemIds);
        }

        $ids = implode(',', $itemIds);
        $items = Items::find()
                ->select('id, item_name, created_at, updated_at, active, root_price, sell_price, quantity, token')
                ->where('id IN (' . $ids . ')')->andWhere(['active' => 1])
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

        if ($type) {
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
        } else {
            $itemIds = [];
            $itemId = explode(",", $hotdeal->items);
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
            $hotdeal->items = $listItem;
        }


        return $hotdeal;
    }

    /**
     * Lấy hotdeal bình thường không xử lý
     */
    public static function getAll() {
        return self::find()->orderBy('created_at DESC')->all();
    }

    public static function getOne($id) {
        return self::findOne($id);
    }

    /**
     * Xử lý lấy các box bên ngoài trang chủ
     * @return type
     */
    public static function resolveBox() {
        $box = self::getDealWithItem(true);
        $new_box = [];
        foreach ($box as $val) {
            $new_box[$val->alias] = $val;
        }
        return $new_box;
    }

}

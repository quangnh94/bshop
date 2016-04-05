<?php

namespace frontend\controllers;

use common\components\output\Cache;
use common\components\output\Response;
use common\components\utils\TextUtils;
use common\models\database\Items;
use common\models\database\ItemsProperties;
use Yii;

class DetailController extends BaseController {

    public function actionView($id) {
        $item = Cache::beginCache($id);
        if (!$item) {
            $item = Items::getItems($id, true);
            Cache::endCache($item);
        }

        $ids = ["category_id" => $item->category_id, 'item_id' => $item->id];
        $relative = Items::getItems($ids, false, true);

        $ids_getPop = [];
        if (!empty($item->prop)) {
            foreach ($item->prop as $value) {
                $ids_getPop[$value->id] = $value->id;
            }
        }
        $type = TextUtils::checkStatusOfProduct($item->created_at);

        $this->var['init'] = "item.loadProp('" . json_encode($ids_getPop) . "')";
        return $this->render('view', [
                    'item' => $item,
                    'type' => $type,
                    'relative' => $relative
        ]);
    }

    /**
     * AJAX SERVICE
     * @return type
     */
    public function actionGetpop() {
        $params = Yii::$app->request->post();
        if (!empty($params)) {
            $prop = ItemsProperties::getPopValue($params);
            if (!empty($prop)) {
                return $this->response(new Response(true, "Lấy dữ liệu thành công", $prop));
            } else {
                return $this->response(new Response(true, "Lấy dữ liệu không thành công", []));
            }
        }
    }

}

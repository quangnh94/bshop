<?php

namespace backend\controllers;

use backend\models\ItemSearch;
use common\components\output\Response;
use common\components\utils\TextUtils;
use common\models\database\CategoriesItems;
use common\models\database\Images;
use common\models\database\Items;
use common\models\database\ItemsProperties;
use Yii;
use yii\helpers\Url;

class ItemsController extends BaseController {

    public function init() {
        parent::init();
    }

    public function actionIndex() {
        $search = $this->filterParams(ItemSearch::className());
        $this->var['init'] = "search.init('#search-item');";
        $this->staticClient = 'items.init();';
        $this->var['breadcumb'] = [
            Url::to(["items/index"]) => "Quản lý sản phẩm"
        ];
        $this->var['table_name'] = 'Quản lý sản phẩm';
        return $this->render('index', [
                    'provider' => $search->filter(),
        ]);
    }

    public function actionAdd() {
        $model = new Items();
        $model->token = Yii::$app->session->get('secret-key');
        if ($model->load(Yii::$app->request->post())) {
            $model->alias = TextUtils::removeMarks($model->item_name);
            $model->user_id = \Yii::$app->user->getId();
            $model->sell_price = intval(str_replace('.', '', $model->sell_price));
            $model->root_price = !empty($model->root_price) ? intval(str_replace('.', '', $model->root_price)) : 0;
            $model->path = CategoriesItems::createPath($model->category_id);
            $result = $model->save(false);
            if ($result) {
                \Yii::$app->session->setFlash('success', 'Thêm mới sản phẩm thành công');
                \Yii::$app->session->remove('secret-key');
                return $this->refresh();
            } else {
                \Yii::$app->session->setFlash('error', 'Thêm mới sản phẩm thất bại');
            }
        } else {
            Yii::$app->session->set('secret-key', base64_encode(TextUtils::generateRandomString(30)));
        }
        $this->staticClient = 'items.init(); image.init();';
        return $this->render('add', [
                    'model' => $model,
                    'category' => $this->getMenus()
        ]);
    }

    public function actionUpdate($id) {
        $model = Items::getItem($id);
        if ($model->load(Yii::$app->request->post())) {
            $model->updated_at = time();
            $model->sell_price = str_replace('.', '', $model->sell_price);
            $model->root_price = str_replace('.', '', $model->root_price);
            $model->alias = TextUtils::removeMarks($model->item_name);
            $model->path = CategoriesItems::createPath($model->category_id);
            $model->save(false);
        }
        $this->staticClient = 'items.init(); image.render(\'' . $model->token . '\');';
        return $this->render('update', [
                    'model' => $model,
                    'category' => $this->getMenus()
        ]);
    }

    /**
     * AJAX METHOD - not vetifined access - coming soon
     * @return type
     */
    public function actionUpload() {
        if (!empty($_FILES)) {
            $tmp = $_FILES['file']['tmp_name'];
            $fileName = time() . $_FILES['file']['name'];
            $upload = move_uploaded_file($tmp, Yii::getAlias('@frontend') . '/web/uploads/' . $fileName);
            if ($upload) {
                $images = new Images();
                $images->token = Yii::$app->session->get('secret-key');
                $images->type_object = Images::ITEMS_TYPE;
                $images->user_id = \Yii::$app->user->getId();
                $images->images_router = $fileName;
                $result = $images->save(false);
                if ($result) {
                    return $this->response(new Response(true, "Tải ảnh lên thành công", $images));
                } else
                    return $this->response(new Response(false, "Tải ản lên không thành công", []));
            }
        }
    }

    public function actionRemove() {
        $params = \Yii::$app->request->post();
        if (!empty($params)) {
            $item = Items::getItem($params['id']);
            if (!empty($item)) {
                $result = $item->delete();
                if ($result) {
                    return $this->response(new Response(true, "Xóa dữ liệu thành công", []));
                } else {
                    return $this->response(new Response(false, "Xóa dữ liệu không thành công", []));
                }
            }
        }
    }

    /* Thêm thuộc tính sản phẩm */

    public function actionAddprop() {
        $params = \Yii::$app->request->post();
        if (!empty($params)) {
            if (isset($params['id']) && !empty($params['id'])) {
                $prop = ItemsProperties::get($params['id']);
                $prop->property_name = $params['property_name'];
                $prop->active = $params['active'];
            } else {
                $prop = new ItemsProperties($params);
                $prop->created_at = time();
                if (!isset($params['parent_id']))
                    $prop->parent_id = 0;
            }
            $prop->updated_at = time();
            $result = $prop->save(false);
            if ($result) {
                return $this->response(new Response(true, "Thêm mới thuộc tính sản phẩm thành công", $prop));
            } else {
                return $this->response(new Response(false, "Thất bại", []));
            }
        }
    }

    /* Show thuộc tính */

    public function actionGenprop() {
        $params = \Yii::$app->request->post();
        if (!empty($params)) {
            if (!isset($params['type'])) {
                $prop = ItemsProperties::getAllById($params['id']);
            } else {
                $prop = ItemsProperties::getAllByParent($params['id']);
            }
            return $this->response(new Response(true, "Lấy dữ liệu thuộc tính thành công", $prop));
        }
    }

    /* Xóa thuộc tính cha */

    public function actionPremove() {
        $params = \Yii::$app->request->post();
        if (!empty($params)) {
            $remove = ItemsProperties::removeP($params['id']);
            if ($remove == false) {
                return $this->response(new Response(false, "Vui lòng xóa toàn bộ giá trị trước khi thực hiện xóa thuộc tính cha", []));
            } else {
                return $this->response(new Response(true, "Xóa thành công", []));
            }
        }
    }

    public function actionGetp() {
        $params = \Yii::$app->request->post();
        if (!empty($params)) {
            $result = ItemsProperties::get($params['id']);
            if ($result) {
                return $this->response(new Response(true, "Lấy dữ liệu thành công", $result));
            } else {
                return $this->response(new Response(false, "Xóa thành công", []));
            }
        }
    }

}

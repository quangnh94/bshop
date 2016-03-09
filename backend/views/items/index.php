<?php

use common\components\utils\TextUtils;
use common\models\database\Images;
use yii\grid\GridView;
use yii\helpers\Url;

function drawStatus($data) {
    if ($data->active == 1)
        return "<span class='label label-success'>Hoạt động</span>";
    else
        return "<span class='label label-danger'>Tạm khóa</span>";
}

function displayAction($data) {
    return '<div class="btn-group">'
            . '<a href="' . Url::base('http') . '/items/update?id=' . $data->id . '" class="btn btn-primary"><i class="fa fa-cog"></i> Cập nhật</a>'
            . '<a onclick="items.remove(\'' . $data->id . '\')" class="btn btn-danger"><i class = "fa fa-trash"></i> Xóa</a>'
            . '<a onclick="image.load(\'' . $data->token . '\',\'' . Images::ITEMS_TYPE . '\');" class="btn btn-warning"><i class="fa fa-picture-o"></i> Ảnh</a>'
            . '<a onclick="property.show(\'' . $data->id . '\');" class="btn btn-success"><i class="fa fa-cubes"></i> Thuộc tính</a>'
            . '</div>';
}
?>
<?php if (Yii::$app->session->hasFlash('error')): ?>
    <div class="alert alert-danger" role="alert"><?= Yii::$app->session->getFlash('error') ?></div>
<?php endif; ?>

<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body">
                    <?=
                    GridView::widget([
                        'dataProvider' => $provider,
                        'emptyText' => '<span style="color:red">Không tồn tại dữ liệu tương ứng, vui lòng thử lại</span>',
                        'options' => [
                            'class' => 'text-center'
                        ],
                        'summary' => '',
                        'columns' => [
                            [
                                'class' => 'yii\grid\DataColumn',
                                'attribute' => 'item_name',
                                'header' => 'Tên sản phẩm',
                                'headerOptions' => ['class' => 'text-center', 'style' => 'width:314px;'],
                                'format' => 'text',
                                'contentOptions' => ['class' => 'vertical-middle'],
                                'value' => function ($data) {
                            return $data->item_name;
                        },
                            ],
                            [
                                'class' => 'yii\grid\DataColumn',
                                'attribute' => 'sell_price',
                                'header' => 'Giá sản phẩm',
                                'headerOptions' => ['class' => 'text-center'],
                                'format' => 'html',
                                'contentOptions' => ['class' => 'vertical-middle'],
                                'value' => function ($data) {
                            return TextUtils::numberFormat($data->sell_price) . ' đ';
                        },
                            ],
                            [
                                'class' => 'yii\grid\DataColumn',
                                'attribute' => 'status',
                                'headerOptions' => ['class' => 'text-center'],
                                'header' => 'Trạng thái',
                                'contentOptions' => ['class' => 'vertical-middle'],
                                'format' => 'html',
                                'value' => function ($data) {
                            return drawStatus($data);
                        },
                            ],
                            [
                                'class' => 'yii\grid\DataColumn',
                                'attribute' => 'created_at',
                                'headerOptions' => ['class' => 'text-center'],
                                'contentOptions' => ['class' => 'vertical-middle'],
                                'header' => 'Ngày tạo',
                                'format' => 'text',
                                'value' => function ($data) {
                            return Yii::$app->formatter->asDatetime($data->created_at, 'php:H:i:s d-m-Y');
                        },
                            ],
                            [
                                'class' => 'yii\grid\DataColumn',
                                'attribute' => 'created_at',
                                'headerOptions' => ['class' => 'text-center'],
                                'format' => 'html',
                                'content' => 'displayAction',
                                'contentOptions' => ['class' => 'vertical-middle'],
                                'header' => 'Chức năng <a onclick="" href="' . Url::base('http') . '/items/add' . '"><i style="cursor:pointer; margin-left:5px;color:green" class="fa fa-plus"></i></a>',
                            ],
                        ],
                    ])
                    ?>
                </div>
            </div>
        </div>
    </div>
</section>
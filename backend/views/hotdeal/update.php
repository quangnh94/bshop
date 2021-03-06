<?php

use common\models\database\Hotdeal;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<div class="main-access">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data'], 'id' => 'form-item']) ?>
    <div style="width: 680px; margin: auto; margin-top: 10px;">
        <?php if (Yii::$app->getSession()->hasFlash('success')) { ?>
            <div class="alert alert-success" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Cập nhật thành công 
            </div>
        <?php } else if (Yii::$app->getSession()->hasFlash('error')) { ?>
            <div class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span> Cập nhật thất bại
            </div>
        <?php } ?>
        <div class="box box-success" style="border-radius: 0px;">
            <div class="box-header with-border">
                <h3 class="box-title">Thêm Hotdeal Box</h3>
            </div>
            <div class="box-body">
                <?= $form->field($model, 'name')->textInput(['class' => 'form-control', 'placeholder' => 'Tên hotdeal']) ?>
                <div>
                    <div class="float-left" style="width: 80%;">
                        <?= $form->field($model, 'items')->textInput(['class' => 'form-control', 'placeholder' => 'Số lượng sản phẩm trong hotdeal của bạn. Ví dụ : 110,115,158']) ?>
                    </div>
                    <div class="float-right" style="margin-top: 25px;">
                        <label onclick="hotdeal.searchBox()" class="custom-file-upload">
                            <i class="fa fa-search-plus"></i> Tìm sản phẩm
                        </label>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <?= $form->field($model, 'alias')->dropDownList([Hotdeal::FEATURE_BOX => 'Sản phẩm đặc trưng', Hotdeal::LEFT_BOX => 'Sản phẩm bán chạy', Hotdeal::NEWS_BOX => 'Sản phẩm mới', Hotdeal::SALE_BOX => 'Sản phẩm giảm giá']) ?>
                <?= $form->field($model, 'active')->checkbox() ?>
            </div><!-- /.box-body -->
            <div class="box-footer">
                <?= Html::submitButton('Cập nhật', ['class' => 'btn btn-success']) ?>
                <button type="reset" class="btn btn-primary"><i class="fa fa-refresh"></i> Làm mới</button>
            </div>
        </div><!-- /.box -->
    </div>
    <?php ActiveForm::end() ?>
    <div class="both"></div>
</div>

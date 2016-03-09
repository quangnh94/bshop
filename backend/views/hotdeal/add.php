<?php

use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<div class="main-access">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data'], 'id' => 'form-item']) ?>
    <div style="width: 680px; margin: auto; margin-top: 10px;">
        <div class="box box-success" style="border-radius: 0px;">
            <div class="box-header with-border">
                <h3 class="box-title">Thêm Hotdeal Box</h3>
            </div>
            <div class="box-body">
                <?= $form->field($model, 'name')->textInput(['class' => 'form-control', 'placeholder' => 'Tên hotdeal']) ?>
                <?= $form->field($model, 'items')->textInput(['class' => 'form-control', 'placeholder' => 'Số lượng sản phẩm trong hotdeal của bạn. Ví dụ : 110,115,158']) ?>
                <?= $form->field($model, 'active')->checkbox() ?>
            </div><!-- /.box-body -->
            <div class="box-footer">
                <?= Html::submitButton('Thêm mới', ['class' => 'btn btn-success']) ?>
                <button type="reset" class="btn btn-primary"><i class="fa fa-refresh"></i> Làm mới</button>
            </div>
        </div><!-- /.box -->
    </div>
    <?php ActiveForm::end() ?>
    <div class="both"></div>
</div>

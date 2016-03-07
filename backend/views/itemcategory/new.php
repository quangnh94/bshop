<?php

use common\components\utils\TextUtils;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<div class="main-access">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data'], 'id' => 'form-item']) ?>
    <div style="width: 650px; margin: auto">
        <div class="box box-success" style="border-radius: 0px;">
            <div class="box-header with-border">
                <h3 class="box-title">Thêm mới sản phẩm</h3>
            </div>
            <div class="box-body">
                <?= $form->field($model, 'category_name')->textInput(['class' => 'form-control', 'placeholder' => 'Tiêu đề tin']) ?>
                <?= $form->field($model, 'parent_id')->dropDownList(TextUtils::createCategory(ArrayHelper::map($category, 'id', 'category_name'))) ?>
                <?= $form->field($model, 'active')->checkbox() ?>
            </div><!-- /.box-body -->
            <div class="box-footer">
                <?= Html::submitButton('Thêm mới', ['class' => 'btn btn-success']) ?>
                <button type="reset" class="btn btn-primary"><i class="fa fa-refresh"></i> Làm mới</button>
            </div>
        </div><!-- /.box -->
    </div>
    <?php ActiveForm::end() ?>
</div>

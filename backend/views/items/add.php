<?php

use yii\helpers\Url;
use yii\widgets\ActiveForm;
?>
<div style="width: 750px;">
    <div class="box box-success">
        <div class="box-header with-border">
            <h3 class="box-title">Biểu mẫu tin tức</h3>
        </div>
        <div class="box-body">
            <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]) ?>
            <?= $form->field($model, 'item_name')->textInput(['class' => 'form-control', 'placeholder' => 'Tiêu đề tin']) ?>
            <?= $form->field($model, 'description')->textInput(['class' => 'form-control', 'placeholder' => 'Mô tả chi tiết']) ?>
            <?= $form->field($model, 'content')->textarea(['style' => 'height:300px;']) ?>
            <?= $form->field($model, 'category_id')->dropDownList(['a', 'b', 'c']) ?>
            <?= $form->field($model, 'active')->checkbox() ?>
        </div><!-- /.box-body -->
        <div class="box-footer">
            <button type="button" class="btn btn-success"><i class="fa fa-pencil-square-o"></i> Thêm mới</button>
            <button type="reset" class="btn btn-primary"><i class="fa fa-refresh"></i> Làm mới</button>
        </div>
        <?php ActiveForm::end() ?>
    </div><!-- /.box -->
</div>
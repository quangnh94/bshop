<?php

use yii\helpers\Url;
use yii\widgets\ActiveForm;
?>
<div class="main-access">
    <div style="width: 650px;" class="float-left">
        <div class="box box-success" style="border-radius: 0px;">
            <div class="box-header with-border">
                <h3 class="box-title">Thêm mới sản phẩm</h3>
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
                <button type="submit" class="btn btn-success"><i class="fa fa-pencil-square-o"></i> Thêm mới</button>
                <button type="reset" class="btn btn-primary"><i class="fa fa-refresh"></i> Làm mới</button>
            </div>
            <?php ActiveForm::end() ?>
        </div><!-- /.box -->
    </div>
    <div style="width: 370px;" class="float-right">
        <div class="box box-danger" style="border-radius: 0px;">
            <div class="box-header with-border">
                <h3 class="box-title">Upload hình ảnh</h3>
            </div>
            <div class="box-body">
                <label for="file-upload" class="custom-file-upload">
                    <i class="fa fa-cloud-upload"></i> Upload ảnh
                </label>
                <input id="file-upload" type="file" multiple="true"/>
                <div id="box-images-preview">

                </div>  
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
    <div class="both"></div>
</div>

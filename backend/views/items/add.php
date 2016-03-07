<?php

use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<div class="main-access">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data'], 'id' => 'form-item']) ?>
    <div style="width: 650px;" class="float-left">
        <div class="box box-success" style="border-radius: 0px;">
            <div class="box-header with-border">
                <h3 class="box-title">Thêm mới sản phẩm</h3>
            </div>
            <div class="box-body">
                <?= $form->field($model, 'item_name')->textInput(['class' => 'form-control', 'placeholder' => 'Tiêu đề tin']) ?>
                <?= $form->field($model, 'root_price')->textInput(['class' => 'form-control ur_price', 'placeholder' => 'Giá gốc']) ?>
                <?= $form->field($model, 'sell_price')->textInput(['class' => 'form-control ur_price', 'placeholder' => 'Giá bán']) ?>
                <?= $form->field($model, 'quantity')->textInput(['class' => 'form-control', 'placeholder' => 'Số lượng sản phẩm']) ?>
                <?= $form->field($model, 'description')->textInput(['class' => 'form-control', 'placeholder' => 'Mô tả chi tiết']) ?>
                <?= $form->field($model, 'content')->textarea(['style' => 'height:300px;']) ?>
                <?= $form->field($model, 'category_id')->dropDownList(ArrayHelper::map($category, 'id', 'category_name')) ?>
                <?= $form->field($model, 'active')->checkbox() ?>
            </div><!-- /.box-body -->
            <div class="box-footer">
                <?= Html::submitButton('Thêm mới', ['class' => 'btn btn-success']) ?>
                <!--<button type="submit" name="submit" id="submit-data" class="btn btn-success"><i class="fa fa-pencil-square-o"></i> Thêm mới</button>-->
                <button type="reset" class="btn btn-primary"><i class="fa fa-refresh"></i> Làm mới</button>
            </div>
        </div><!-- /.box -->
    </div>
    <?php ActiveForm::end() ?>
    <div style="width: 370px;" class="float-right">
        <div class="box box-danger" style="border-radius: 0px;">
            <div class="box-header with-border">
                <h3 class="box-title">Upload hình ảnh</h3>
            </div>
            <div class="box-body" item-image="check-image">
                <label for="file-upload" class="custom-file-upload">
                    <i class="fa fa-cloud-upload"></i> Upload ảnh
                </label>
                <input id="file-upload" type="file" multiple="true" accept="image/*"/>
                <div class="help-block" id="image-alert" style="display: none"></div>
                <div id="box-images-preview">

                </div> 
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
    <div class="both"></div>
</div>

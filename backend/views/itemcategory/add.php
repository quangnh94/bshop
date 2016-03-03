<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
?>
<div class="main-access">
    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data'], 'id' => 'form-item']) ?>
    <div style="width: 400px;">
        <div class="box box-success" style="border-radius: 0px;">
            <div class="box-header with-border">
                <h3 class="box-title float-left">Danh mục</h3>
                <i onclick="itemscate.add()" class="fa fa-plus float-right" style="color: green; cursor: pointer" title="Thêm mới danh mục"></i>
                <div class="both"></div>
            </div>
            <div class="box-body">
                <?php if (!empty($category)) { ?>
                    <div class="main-lvl-parent">
                        <?php foreach ($category as $val) : ?>
                            <?php if ($val->parent_id == 0) { ?>
                                <div class="alert alert-success alert-beautiful" auth-id='<?= $val->id ?>'>
                                    <span class="float-left"><i class="fa fa-chevron-right" style="margin-right: 5px;" title="Danh mục cha"></i> <?= $val->category_name ?></span>
                                    <div class="float-right">
                                        <?php if ($val->active == 1) { ?>
                                            <i class="fa fa-check-circle" auth-check='ck' onclick="itemscate.changeActive('<?= $val->id ?>')" style="color: greenyellow; cursor: pointer; margin-right: 5px;" title="Đang hoạt động"></i>
                                        <?php } else { ?>
                                            <i class="fa fa-circle-o" auth-check='ck' onclick="itemscate.changeActive('<?= $val->id ?>')" style="cursor: pointer; margin-right: 5px;" title="Tạm khóa"></i>
                                        <?php } ?>
                                        <i class="fa fa-trash" title="Xóa danh mục ! Really ?"></i>
                                    </div>
                                    <div class="both"></div>
                                </div>
                            <?php } ?>
                        <?php endforeach; ?>
                    </div>
                <?php } else { ?>
                    <div class="text-center">Không có danh mục tồn tại !</div>
                <?php } ?>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
    <?php ActiveForm::end() ?>
    <div class="both"></div>
</div>

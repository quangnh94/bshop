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
                                <div class="main-lvl-1">
                                    <?php foreach ($category as $val1) : ?>
                                        <?php if ($val1->parent_id == $val->id) { ?>
                                            <div class="alert alert-info alert-beautiful" auth-id='<?= $val1->id ?>'>
                                                <span class="float-left"><i class="fa fa-chevron-right" style="margin-right: 5px;"></i> <?= $val1->category_name ?></span>
                                                <div class="float-right">
                                                    <?php if ($val1->active == 1) { ?>
                                                        <i class="fa fa-check-circle" auth-check='ck' onclick="itemscate.changeActive('<?= $val1->id ?>')" style="color: greenyellow; cursor: pointer; margin-right: 5px;" title="Đang hoạt động"></i>
                                                    <?php } else { ?>
                                                        <i class="fa fa-circle-o" auth-check='ck' onclick="itemscate.changeActive('<?= $val1->id ?>')" style="cursor: pointer; margin-right: 5px;" title="Tạm khóa"></i>
                                                    <?php } ?>
                                                    <i class="fa fa-trash" title="Xóa danh mục ! Really ?"></i>
                                                </div>
                                                <div class="both"></div>
                                            </div>
                                            <div class="main-lvl-2">
                                                <?php foreach ($category as $val2) : ?>
                                                <?php if ($val2->parent_id == $val1->id) { ?>
                                                    <div class="alert alert-warning alert-beautiful" auth-id='<?= $val2->id ?>'>
                                                        <span class="float-left"><?= $val2->category_name ?></span>
                                                        <div class="float-right">
                                                            <?php if ($val2->active == 1) { ?>
                                                                <i class="fa fa-check-circle" auth-check='ck' onclick="itemscate.changeActive('<?= $val2->id ?>')" style="color: greenyellow; cursor: pointer; margin-right: 5px;" title="Đang hoạt động"></i>
                                                            <?php } else { ?>
                                                                <i class="fa fa-circle-o" auth-check='ck' onclick="itemscate.changeActive('<?= $val2->id ?>')" style="cursor: pointer; margin-right: 5px;" title="Tạm khóa"></i>
                                                            <?php } ?>
                                                            <i class="fa fa-trash" title="Xóa danh mục ! Really ?"></i>
                                                        </div>
                                                        <div class="both"></div>
                                                    </div>
                                                <?php } ?>
                                            <?php endforeach; ?> 
                                           </div>
                                        <?php } ?>
                                    <?php endforeach; ?>
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

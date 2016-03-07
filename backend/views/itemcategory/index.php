<?php

use yii\helpers\Url;
?>
<div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-header">
                <h3 class="box-title">Quản lý danh mục sản phẩm</h3>
                <div class="box-tools">
                    <div class="input-group" style="width: 150px;">
                        <input type="text" name="table_search" class="form-control input-sm pull-right" placeholder="Search">
                        <div class="input-group-btn">
                            <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div><!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
                <table class="table table-bordered">
                    <tbody>
                        <tr>
                            <th>Tên danh mục</th>
                            <th class="text-center">Thời gian tạo</th>
                            <th class="text-center">Đường dẫn</th>
                            <th class="text-center">Trạng thái</th>
                            <th class="text-center">Chức năng <a href="<?= Url::base('http') . '/itemcategory/new' ?>"><i class="fa fa-plus"></i></a></th>
                        </tr>
                        <?php if (!empty($category)): ?>
                            <?php foreach ($category as $val) : ?>
                                <tr data-key="<?= $val->id ?>">
                                    <td class="vertical-middle"><?= $val->category_name ?></td>
                                    <td class="text-center vertical-middle"><?= Yii::$app->formatter->asDatetime($val->created_at, 'php:H:i:s d-m-Y') ?></td>
                                    <td class="text-center"><input type="text" class="form-control" value="<?= $val->alias ?>" auth-category="<?= $val->id ?>" /></td>
                                    <td class="text-center vertical-middle">
                                        <?php if ($val->active == 1) { ?>
                                            <span class="label label-success">Hoạt động</span>
                                        <?php } else { ?>
                                            <span class="label label-danger">Tạm khóa</span>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <div class="btn-group" role="group">
                                            <a href="<?= Url::base('http') . '/itemcategory/update?id=' . $val->id ?>" class="btn btn-primary"><i class="fa fa-pencil"></i> Sửa</a>
                                            <a onclick="itemscate.remove('<?= $val->id ?>')" class="btn btn-danger"><i class="fa fa-trash"></i> Xóa</a>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
</div>
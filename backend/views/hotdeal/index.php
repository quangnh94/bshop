<?php

use common\components\utils\TextUtils;
?>
<div class="main-access">
    <?php if (!empty($hotdeal)): ?>
        <?php $i = 0; ?>
        <?php foreach ($hotdeal as $val): ?>
            <div class="hot-deal-each">
                <div class="box box-<?= $i % 2 == 0 ? 'success' : 'danger' ?>" style="border-radius: 0px;">
                    <div class="box-header with-border">
                        <h2 class="box-title bold-text"><?= $val->name ?></h2>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <?php if (!empty($val->items)) { ?>
                                <?php foreach ($val->items as $item): ?>
                                    <div class="col-sm-3 col-md-3">
                                        <div class="thumbnail">
                                            <img style="width: 100%; height: 250px;" src="<?= Yii::$app->params['frontend'] . $item->images[0] ?>" alt="Ảnh sản phẩm">
                                            <div class="caption">
                                                <h5 class="bold-text" style="display:inline-block; width:180px; white-space: nowrap; overflow:hidden !important; text-overflow: ellipsis;"><?= $item->item_name ?></h5>
                                                <p>Giá gốc : <span class="bold-text"><?= TextUtils::numberFormat($item->root_price) ?> đ</span></p>
                                                <p>Giá bán : <span class="bold-text"><?= TextUtils::numberFormat($item->sell_price) ?> đ</span></p>
                                                <p><a href="#" class="btn btn-danger" role="button"><i class="fa fa-trash"></i> Xóa sản phẩm</a></p>
                                            </div>
                                        </div>
                                    </div>
                                <?php endforeach; ?>
                            <?php } else { ?>
                                <p style="text-align: center; font-weight: bold">Không có sản phẩm tương ứng. Cấu hình hotdeal vui lòng thêm mới sản phẩm</p>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </div>
            <?php $i++; ?>
        <?php endforeach; ?>
    <?php endif; ?>
</div>
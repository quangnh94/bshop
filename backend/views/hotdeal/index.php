<?php

use common\components\utils\TextUtils;
use yii\helpers\Url;
?>
<div class="main-access padding-global-5">
    <a href="<?= Url::base('http') . '/hotdeal/add' ?>" class="btn btn-primary margin-top-10 margin-bottom-10"><i class="fa fa-plus"></i> Thêm mới</a>
    <?php if (!empty($hotdeal)) { ?>
        <select name="hotdeal-choice" class="form-control">
            <option value="0">Chọn hotdeal</option>
            <?php foreach ($hotdeal as $val): ?>
                <option value="<?= $val->id ?>"><?= $val->name ?></option>
            <?php endforeach; ?>
        </select>
    <?php } else { ?>
        <div><span class="text-center">Hiện tại không có hotdeal box, vui lòng thêm hotdeal</span></div>
    <?php } ?>
    <div class="main-hotdeal margin-top-10">
        <p class="padding-global">Để bắt đầu , hãy chọn hotdeal box muốn chỉnh sửa. Hoặc tạo hotdeal box mới.</p>
    </div>
</div>
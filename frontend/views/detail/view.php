<?php

use common\components\helpers\HelperLink;
use common\components\utils\TextUtils;
use yii\helpers\Url;

$this->title = $item->item_name != '' ? $item->item_name : '';
?>
<section class="main-content-section">
    <div class="container">
        <?php if ($this->beginCache('xxxx', ['duration' => 3600])) { ?>
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <!-- BSTORE-BREADCRUMB START -->
                    <div class="bstore-breadcrumb">
                        <a href="index.html">HOMe<span><i class="fa fa-caret-right"></i> </span> </a>
                        <span> <i class="fa fa-caret-right"> </i> </span>
                        <a href="shop-gird.html"> women </a>
                        <span> Faded Short Sleeves T-shirt </span>
                    </div>
                    <!-- BSTORE-BREADCRUMB END -->
                </div>
            </div>
            <?php $this->endCache(); ?>
        <?php } ?>
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                <!-- SINGLE-PRODUCT-DESCRIPTION START -->
                <div class="row">
                    <div class="col-lg-5 col-md-5 col-sm-4 col-xs-12">
                        <div class="single-product-view">
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <?php if (!empty($item->images) && count($item->images) > 0) { ?>
                                    <?php $i = 1; ?>
                                    <?php foreach ($item->images as $img): ?>
                                        <div class="tab-pane <?= $i == 1 ? 'active' : '' ?>" id="thumbnail_<?= $i ?>">
                                            <div class="single-product-image">
                                                <img width="324" height="432" src="<?= Url::base('http') . '/uploads/' . $img ?>" alt="single-product-image" />
                                                <?php if (TextUtils::calPercent($item->root_price, $item->sell_price) > 0): ?>
                                                    <a class="new-mark-box" href="#">Giảm giá <?= TextUtils::calPercent($item->root_price, $item->sell_price) ?>%</a>
                                                <?php endif; ?>
                                                <a class="fancybox" href="<?= Url::base('http') . '/uploads/' . $img ?>" data-fancybox-group="gallery"><span class="btn large-btn">View larger <i class="fa fa-search-plus"></i></span></a>
                                            </div>	
                                        </div>
                                        <?php $i++; ?>
                                    <?php endforeach; ?>
                                <?php } ?>
                            </div>										
                        </div>
                        <div class="select-product">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs select-product-tab bxslider">
                                <?php if (!empty($item->images) && count($item->images) > 0) { ?>
                                    <?php $i = 1; ?>
                                    <?php foreach ($item->images as $img): ?>
                                        <li class="<?= $i == 1 ? 'active' : '' ?>">
                                            <a href="#thumbnail_<?= $i ?>" data-toggle="tab"><img src="<?= Url::base('http') . '/uploads/' . $img ?>" alt="pro-thumbnail" /></a>
                                        </li>
                                        <?php $i++; ?>
                                    <?php endforeach; ?>
                                <?php } ?>
                            </ul>										
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7 col-sm-8 col-xs-12">
                        <div class="single-product-descirption">
                            <h2><?= $item->item_name ?></h2>
                            <div class="single-product-social-share">
                                <ul>
                                    <li><a href="#" class="twi-link"><i class="fa fa-twitter"></i>Tweet</a></li>
                                    <li><a href="#" class="fb-link"><i class="fa fa-facebook"></i>Share</a></li>
                                    <li><a href="#" class="g-plus-link"><i class="fa fa-google-plus"></i>Google+</a></li>
                                </ul>
                            </div>
                            <div class="single-product-review-box">
                                <div class="rating-box">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-half-empty"></i>
                                </div>
                                <div class="read-reviews">
                                    <a href="#">Read reviews (1)</a>
                                </div>
                                <div class="write-review">
                                    <a href="#">Write a review</a>
                                </div>		
                            </div>
                            <?php if ($type != ''): ?>
                                <div class="single-product-condition">
                                    <p>Loại sản phẩm : <span> <?= $type ?></span></p>
                                </div>
                            <?php endif; ?>
                            <div class="single-product-price">
                                <h2><?= TextUtils::numberFormat($item->sell_price); ?> VNĐ</h2>
                                <?php if ($item->sell_price != $item->root_price): ?>
                                    <h4><?= TextUtils::numberFormat($item->root_price); ?> VNĐ</h4>
                                <?php endif; ?>
                                <div class="clearfix"></div>
                            </div>
                            <div class="single-product-desc">
                                <p><?= $item->description ?></p>
                            </div>
                            <div class="single-product-info">
                                <a href="#"><i class="fa fa-envelope"></i></a>
                                <a href="#"><i class="fa fa-heart"></i></a>
                            </div>
                            <div class="single-product-quantity">
                                <p class="small-title">Số lượng</p> 
                                <div class="cart-quantity">
                                    <div class="cart-plus-minus-button single-qty-btn">
                                        <input class="cart-plus-minus sing-pro-qty" type="text" name="qtybutton" value="0">
                                    </div>
                                </div>
                            </div>
                            <?php if (!empty($item->prop)): ?>
                                <?php foreach ($item->prop as $val): ?>
                                    <?php if ($val->property_name == 'size'): ?>
                                        <div class="single-product-size properties-show" prop-itc="<?= $val->id ?>">
                                            <p class="small-title">Kích thước</p>
                                            <div class="single-product-prop prop-size">
                                                <ul></ul>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                    <?php if ($val->property_name == 'color'): ?>
                                        <div class="single-product-color properties-show" prop-itc="<?= $val->id ?>">
                                            <p class="small-title">Màu sắc </p> 
                                            <div class="single-product-prop prop-color">
                                                <ul class="nav nav-tabs select-product-tab"></ul>
                                                <div class="clearfix"></div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            <?php endif; ?>
                            <div class="single-product-add-cart">
                                <a class="add-cart-text" title="Add to cart" href="#">Mua ngay</a>
                                <a class="add-cart-text" title="Add to cart" href="#">Cho vào giỏ</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- SINGLE-PRODUCT-DESCRIPTION END -->
                <!-- SINGLE-PRODUCT INFO TAB START -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="product-more-info-tab">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs more-info-tab">
                                <li class="active"><a href="#moreinfo" data-toggle="tab">Chi tiết</a></li>
                                <li><a href="#datasheet" data-toggle="tab">Thông số kỹ thuật</a></li>
                                <li><a href="#review" data-toggle="tab">Bình luận</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="moreinfo">
                                    <div class="tab-description">
                                        <p><?= $item->content != '' ? $item->content : '' ?></p>
                                    </div>
                                </div>
                                <div class="tab-pane" id="datasheet">
                                    <div class="deta-sheet">
                                        <table class="table-data-sheet">			
                                            <tbody>
                                                <tr class="odd">
                                                    <td>Compositions</td>
                                                    <td>Cotton</td>
                                                </tr>
                                                <tr class="even">
                                                    <td class="td-bg">Styles</td>
                                                    <td class="td-bg">Casual</td>
                                                </tr>
                                                <tr class="odd">
                                                    <td>Properties</td>
                                                    <td>Short Sleeve</td>
                                                </tr>
                                            </tbody>
                                        </table>				
                                    </div>
                                </div>
                                <div class="tab-pane" id="review">
                                    <div class="row tab-review-row">
                                        <div class="col-xs-5 col-sm-4 col-md-4 col-lg-3 padding-5">
                                            <div class="tab-rating-box">
                                                <span>Grade</span>
                                                <div class="rating-box">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-half-empty"></i>
                                                </div>	
                                                <div class="review-author-info">
                                                    <strong>write A REVIEW</strong>
                                                    <span>06/22/2015</span>
                                                </div>															
                                            </div>
                                        </div>
                                        <div class="col-xs-7 col-sm-8 col-md-8 col-lg-9 padding-5">
                                            <div class="write-your-review">
                                                <p><strong>write A REVIEW</strong></p>
                                                <p>write A REVIEW</p>
                                                <span class="usefull-comment">Was this comment useful to you? <span>Yes</span><span>No</span></span>
                                                <a href="#">Report abuse </a>
                                            </div>
                                        </div>
                                        <a href="#" class="write-review-btn">Write your review!</a>
                                    </div>
                                </div>
                            </div>									
                        </div>
                    </div>
                </div>
                <!-- SINGLE-PRODUCT INFO TAB END -->
                <!-- RELATED-PRODUCTS-AREA START -->
                <?php if (!empty($relative)): ?>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="left-title-area">
                                <h2 class="left-title">sản phẩm liên quan</h2>
                            </div>	
                        </div>
                        <div class="related-product-area featured-products-area">
                            <div class="col-sm-12">
                                <div class=" row">
                                    <div class="related-product">
                                        <?php foreach ($relative as $item) : ?>
                                            <div class="item">
                                                <div class="single-product-item">
                                                    <div class="product-image">
                                                        <a href="<?= HelperLink::rewriteUrl($item->id, $item->item_name, Yii::$app->params['product']['action']) ?>"><img src="<?= Url::base('http') . '/uploads/' . $item->images[0] ?>" alt="product-image" /></a>
                                                    </div>
                                                    <div class="product-info">
                                                        <div class="customar-comments-box">
                                                            <div class="rating-box">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-half-empty"></i>
                                                            </div>
                                                            <div class="review-box">
                                                                <span>1 Review(s)</span>
                                                            </div>
                                                        </div>
                                                        <a href="<?= HelperLink::rewriteUrl($item->id, $item->item_name, Yii::$app->params['product']['action']) ?>"><?= $item->item_name ?></a>
                                                        <div class="price-box">
                                                            <span class="price"><?= !empty($item->sell_price) ? TextUtils::numberFormat($item->sell_price) : '' ?> VNĐ</span><br/>
                                                            <?php if (!empty($item->root_price)): ?>
                                                                <span class="old-price"><?= TextUtils::numberFormat($item->root_price) ?> VNĐ</span>
                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                </div>							
                                            </div>
                                        <?php endforeach; ?>
                                    </div>
                                    <!-- RELATED-CAROUSEL END -->
                                </div>	
                            </div>
                        </div>	
                    </div>
                <?php endif; ?>
                <!-- RELATED-PRODUCTS-AREA END -->
            </div>
            <!-- RIGHT SIDE BAR START -->
            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                <!-- SINGLE SIDE BAR START -->
                <div class="single-product-right-sidebar">
                    <h2 class="left-title">Hàng bán chạy</h2>
                    <ul>
                        <li>
                            <a href="#"><img src="img/product/sidebar_product/2.jpg" alt="" /></a>
                            <div class="r-sidebar-pro-content">
                                <h5><a href="#">Faded Short ...</a></h5>
                                <p>Faded short sleeves t-shirt with high...</p>
                            </div>
                        </li>
                    </ul>
                </div>	
                <!-- SINGLE SIDE BAR END -->
                <!-- SINGLE SIDE BAR START -->
                <div class="single-product-right-sidebar clearfix">
                    <h2 class="left-title">Tags </h2>
                    <div class="category-tag">
                        <a href="#">fashion</a>
                        <a href="#">handbags</a>
                        <a href="#">women</a>
                        <a href="#">men</a>
                        <a href="#">kids</a>
                        <a href="#">New</a>
                        <a href="#">Accessories</a>
                        <a href="#">clothing</a>
                        <a href="#">New</a>
                    </div>							
                </div>	
                <!-- SINGLE SIDE BAR END -->
                <!-- SINGLE SIDE BAR START -->						
                <div class="single-product-right-sidebar">
                    <div class="slider-right zoom-img">
                        <a href="#"><img class="img-responsive" src="img/product/cms11.jpg" alt="sidebar left" /></a>
                    </div>							
                </div>
            </div>
            <!-- SINGLE SIDE BAR END -->				
        </div>
    </div>
</section>

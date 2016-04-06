<?php

/**
 * @link http://www.yiiframework.com/
 * @copyright Copyright (c) 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 */

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @since 2.0
 */
class AppAsset extends AssetBundle {

    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/animate.css',
        'css/jquery-ui-slider.css',
        'css/jquery.bxslider.css',
        'css/jquery.fancybox.css',
        'css/font-awesome.min.css',
        'css/main.css',
        'css/meanmenu.min.css',
        'css/nivo-slider.css',
        'css/normalize.css',
        'css/owl.carousel.css',
        'css/owl.theme.css',
        'css/responsive.css',
        'css/style.css'
    ];
    public $js = [
        'js/lib/angular.min.js',
        'js/lib/jquery.bxslider.min.js',
        'js/lib/jquery.fancybox.js',
        'js/lib/jquery.meanmenu.js',
        'js/lib/jquery.nivo.slider.js',
        'js/lib/owl.carousel.min.js',
        'js/lib/vendor/modernizr-2.6.2.min.js',
        'js/lib/bootstrap.min.js',
        'js/lib/jqueryui.js',
        'js/lib/wow.js',
        'js/lib/main.js',
        'js/dev/item.js',
        'js/dev/order.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];

}

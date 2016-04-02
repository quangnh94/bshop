<?php

return array(
    'class' => 'yii\web\UrlManager',
    'enablePrettyUrl' => true,
    'showScriptName' => false,
//    'enableStrictParsing' => true,
//    'suffix' => '.html',
    'rules' => [
        'GET san-pham-<title:[\d\w\-_]+>-<id:\d+>.html' => 'detail/view',
    ]
);

<?php

return array(
    'class' => 'yii\web\UrlManager',
    'enablePrettyUrl' => true,
    'showScriptName' => false,
//    'enableStrictParsing' => true,
//    'suffix' => '.html',
    'rules' => [
        'GET control-panel.html' => 'home/index',
    ]
);

<?php

/*
 * Author : Sangnx
 */

namespace common\components\helpers;

use Yii;
use app\components\helpers\UploadImage;

class HelperLink {

    public static function rewriteUrl($id, $title, $action) {
        $link = Yii::getAlias('@web') . '/' . $action . '-' . UrlTransliterate::cleanString($title) . '-' . $id . '.html';
        return urldecode($link);
    }

    public static function rewriteUrllink($id, $title, $action) {
        $link = Yii::getAlias('@web') . $action . '-' . UrlTransliterate::cleanString($title) . '-' . $id . '.html';
        return urldecode($link);
    }

    public static function rewriteXl($id, $title, $action) {
        $link = Yii::getAlias('@web') . '/' . $action;
        return urldecode($link);
    }

    static function rewriteUrlml($id, $title, $action) {
        $link = Yii::getAlias('@web') . $action . '' . UrlTransliterate::cleanString($title) . $id;
        return urldecode($link);
    }

    static function rewriteUrllin($id, $title, $action) {
        $link = Yii::getAlias('@web') . '/' . $action . '' . UrlTransliterate::cleanString($title) . $id;
        return urldecode($link);
    }

    public static function rewriteUrlGame($id, $title, $action) {
        $link = Yii::getAlias('@web') . '/' . $action . UrlTransliterate::cleanString($title) . '-g' . $id . '.html';
        return urldecode($link);
    }

    public static function rewriteUrlMulti($params, $title, $action) {
        $link = Yii::getAlias('@web') . '/' . $action . '/' . UrlTransliterate::cleanString($title) . '-' . implode('-', $params) . '.html';
        return urldecode($link);
    }

    public static function rewriteUrlType($type) {
        if ($type == 1) {
            return Yii::$app->params['url']['video'];
        } else {
            return Yii::$app->params['url']['detail'];
        }
    }

}

<?php

namespace common\components\output;

use Yii;

class Cache {

    public static $data;
    public static $duration = 1200;
    public static $keyword;
    public static $cache;

    public static function beginCache($keyword) {
        self::$keyword = md5(is_object($keyword) || is_array($keyword) ? json_encode($keyword) : strtolower($keyword));
        self::$data = Yii::$app->cache->get(self::$keyword);
        if (self::$data !== false) {
            return self::$data;
        }
        return false;
    }

    public static function endCache($data) {
        if (!empty(self::$keyword)) {
            Yii::$app->cache->set(self::$keyword, $data, self::$duration);
            self::$keyword = '';
        }
    }

}

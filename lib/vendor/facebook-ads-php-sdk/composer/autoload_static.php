<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitbfdd100637962ceaa5d8eddb61894cad
{
    public static $prefixLengthsPsr4 = array (
        'F' => 
        array (
            'FacebookAds\\' => 12,
        ),
    );


    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitbfdd100637962ceaa5d8eddb61894cad::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = array (
        'FacebookAds\\' => 
        array (
            0 => __DIR__ . '/..' . '/facebook/php-ads-sdk/src/FacebookAds',
        ),
    );

        }, null, get_class(new ClassLoader));
    }
}

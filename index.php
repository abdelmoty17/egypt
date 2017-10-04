<?php

/* Bitcoin faucet
 * http://faucetsystem.com/
 * Copyright (c) 2017 FaucetSystem.com
 *
 * Email: faucetsystem@gmail.com
 * ToxID: 77755759350B68121FED9377DFF1D4030793DBA9A23EED849E6369CF880E277297915137F7AB
 */

require_once (__DIR__ . '/vendor/autoload.php');
require_once (__DIR__ . '/config.php'         );

use phpFastCache\CacheManager;
define('MYSQL_PREFIX'  , 'bfs_');
define('R'  , $_SERVER['DOCUMENT_ROOT']);

CacheManager::setup(['storage'=>'files', 'path'=>__DIR__.'/tmp/','securityKey'=>md5(__DIR__)]);

$routing = [

    ['GET' , '/[{referral}/]', ['Controller\Guest', 'getClaimFirst'  ]],
    ['POST', '/captcha/'     , ['Controller\Guest', 'postClaimSecond']],
    ['POST', '/reward/'      , ['Controller\Guest', 'postClaimThird' ]],

    ['GET',  '/guest/jackpot/', ['Controller\Guest','getJackpot']],
    ['GET' , '/guest/login/', ['Controller\Guest', 'getLogin']],
    ['POST', '/guest/login/', ['Controller\Guest','postLogin']],
    ['GET' , '/guest/cc/', ['Controller\Guest', 'getCc']],

    ['GET' , '/admin/dashboard/', ['Controller\Admin', 'getDashboard']],
    ['POST' , '/admin/dashboard/', ['Controller\Admin', 'postDashboard']],

    ['GET' , '/admin/ban/add/', ['Controller\Admin', 'getBan']],
    ['POST', '/admin/ban/add/', ['Controller\Admin', 'postBan']],
    ['GET' , '/admin/ban/list/{page:\d+}/', ['Controller\Admin', 'getBanList']],
    ['POST' , '/admin/ban/list/{page:\d+}/', ['Controller\Admin', 'postBanList']],

    ['GET' , '/admin/payments/list/{page:\d+}/', ['Controller\Admin', 'getPaymentsList']],
    ['GET' , '/admin/actions/list/{page:\d+}/', ['Controller\Admin', 'getActionsList']],


    ['GET' , '/admin/settings/base/', ['Controller\Admin', 'getBase']],
    ['POST' , '/admin/settings/base/', ['Controller\Admin', 'postBase']],

    ['GET' , '/admin/settings/security/', ['Controller\Admin', 'getSecurity']],
    ['POST' , '/admin/settings/security/', ['Controller\Admin', 'postSecurity']],

    ['GET' , '/admin/settings/money/', ['Controller\Admin', 'getMoney']],
    ['POST' , '/admin/settings/money/', ['Controller\Admin', 'postMoney']],

    ['GET' , '/admin/settings/country/', ['Controller\Admin', 'getCountry']],
    ['POST' , '/admin/settings/country/', ['Controller\Admin', 'postCountry']],

    ['GET' , '/admin/ads/add/', ['Controller\Admin', 'getAds']],
    ['POST' , '/admin/ads/add/', ['Controller\Admin', 'postAds']],

    ['GET' , '/admin/exit/', ['Controller\Admin', 'getExit']],


];

$route = \FastRoute\cachedDispatcher(function(\FastRoute\RouteCollector $r) use ($routing) {
    foreach($routing as $v) $r->addRoute($v[0], $v[1], $v[2]);
}, ['cacheFile' => R.'/tmp/'.md5(__DIR__).'.cache'])
    ->dispatch($_SERVER['REQUEST_METHOD'], parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));

if($route[0] == \FastRoute\Dispatcher::FOUND){
    $new = new $route[1][0];
    $new->before();
    $new->{$route[1][1]}($route[2]);
    $new->after();
}else{
    header("HTTP/1.0 404 Not Found");
    exit('Router: access denied.');
}
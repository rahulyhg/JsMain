<?php
/**
 * ClickTale - PHP Integration Module
 *
 * LICENSE
 *
 * This source file is subject to the ClickTale(R) Integration Module License that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://www.clicktale.com/Integration/0.2/LICENSE.txt
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@clicktale.com so we can send you a copy immediately.
 *
 */
?>
<?php

/*
 * This page retrieves the cached page from cache using the provided token
 */


if (!defined('ClickTale_Root'))
{
	$pathinfo = pathinfo(__FILE__);
	define ("ClickTale_Root", $pathinfo["dirname"]);
}

require_once(ClickTale_Root."/ClickTale.inc.php");
require_once(ClickTale_Root."/ClickTale.CacheFactory.php");
require_once(ClickTale_Root."/ClickTale.Settings.php");
require_once(ClickTale_Root."/ClickTale.Logger.php");

// including for logging purpose
include_once(JsConstants::$docRoot."/classes/LoggingWrapper.class.php");

@$token = $_GET["t"];
if ($token != "CacheTest" && ClickTale_IsAllowedIp() == false)
{
	/*
	$message = "Request from unauthorized ip: ".FetchClientIP().", user agent: ".$_SERVER["HTTP_USER_AGENT"].".";
	ClickTale_Logger::Write($message);
	header("HTTP/1.0 404 ".$message);
	die ("Request from unauthorized ip.");
	*/
}
  
try
{
	$cacheProvider = ClickTale_CacheFactory::DefaultCacheProvider();
}
catch (Exception $ex)
{
	ClickTale_Logger::Write($ex->getMessage());
	header("HTTP/1.0 500 ".$ex->getMessage());
	LoggingWrapper::getInstance()->sendLogAndDie(LoggingEnums::LOG_ERROR, $ex);
}

$config = ClickTale_Settings::Instance()->getCacheProviderConfig();

if (!$cacheProvider->exists($token, $config))
{
	header("HTTP/1.0 404 "."Could not retrieve the cached page.");
	die ("Could not retrieve the cached page.");
}

print ($cacheProvider->Pull($token, $config));
 
?>

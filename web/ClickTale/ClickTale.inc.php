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
/* Copyright 2008, ClickTale LTD. */

define("ClickTale_DS", strstr( PHP_OS, "WIN") ? "\\" : "/");

require_once(ClickTale_Root."/ClickTale.Settings.php");
require_once(ClickTale_Root."/ClickTale.CacheFactory.php");


function ClickTale_IsAllowedIp()
{
	$addresses = str_replace(""," ", ClickTale_Settings::Instance()->AllowedAddresses);
	$addresses = explode(",", $addresses);
	if (empty($addresses))
		return false;
		
	foreach($addresses as $value)
	{
		$value = explode("/", $value);

		if (sizeof($value)<2)
			$mask = 0xFFFFFFFF;
		else
			$mask = ((0x00000001 << intval(@$value[1])) - 1) * (0x00000001 << (32 - intval(@$value[1])));
		if ((ClickTale_IpToInteger(FetchClientIP()) & $mask) == (ClickTale_IpToInteger($value[0]) & $mask))
			return true;
	}
	return false;
}

// Converts ip to hexadecimal integer.
function ClickTale_IpToInteger($ip)
{
	$ipArr = explode(".", $ip);
	
	for($i = 0; $i < 4; $i++)
		if (empty($ipArr[$i]))
			$ipArr[$i] = 0;
	
	$retVal  = intval($ipArr[0], 16)<<24;
	$retVal += intval($ipArr[1], 16) << 16;
	$retVal += intval($ipArr[2], 16) << 8;
	$retVal += intval($ipArr[3], 16); 
	
	return $retVal;
}

/// This function check a cookie value to control recording logic.
/// The main use of this is to check if the value of the WRUID cookie is set to 0 which means "ClickTale don't record user"
/// This allow us to save on processing and caching for users who don't fall into the "recording ratio".
/// The problem with this method is that client side code can change the value of the cookie, thus WRUID can be 0 at first 
/// and then changed for this page in the client side without the server side knowing about it. This usually means that the user is using our API
/// or doing some other fancy manipulation. In those cases, the user will want to not use this feature.
function ClickTale_CheckCookieFlagForRecording()
{
	$name = @ClickTale_Settings::Instance()->DoNotProcessCookieName;
	if (empty($name))
		return false;
	
	$value = $_COOKIE[@ClickTale_Settings::Instance()->DoNotProcessCookieName];
	if (empty($value) || $value != ClickTale_Settings::Instance()->DoNotProcessCookieValue)
		return false;
	return true;
}

// Wraps with bracets '(', ')' if already not wrapped.
// This in needed because we want preg_replace treat it as whole unit.
function ClickTale_NormalizeRegex($str)
{
	if (!empty($str) && $str[0] != '(' && $str[strlen($str) - 1] != ')')
	{
		$str = "(".$str.")";
	}
	return $str;
}

// Returns true if file changed from the last time or if it
// is the first call to this function.
function ClickTale_FileChanged($path)
{
	$key = "TimeStamp_".md5($path);

	$cacheProvider = ClickTale_CacheFactory::DefaultCacheProvider();
	$config = ClickTale_Settings::Instance()->getCacheProviderConfig();
	$config["DeleteAfterPull"] = false;
	
	if ($cacheProvider->exists($key, $config)) {
		$timestamp = $cacheProvider->pull($key, $config);
	} else {
		$timestamp = null;
	}
		
	//clearstatcache(); // Not necessary.
	if (empty($timestamp) or $timestamp != filemtime($path))
	{
		$config = ClickTale_Settings::Instance()->getCacheProviderConfig();
		$config["MaxCachedSeconds"] = false;
		$cacheProvider->store($key, filemtime($path), $config);
		return true;
	}
	return false;
}

function ClickTale_LoadScripts($path)
{
	// We need this even if there is a cached scripts file 
	// because the timestamp needs to be checked.
	if (!file_exists($path)) 
		throw new Exception("Could not find file: $path."); 
	
	$key = "Data_".md5($path);
	$cacheProvider = ClickTale_CacheFactory::DefaultCacheProvider();
	
	// If aviable, get scripts data from cache. 
	if (ClickTale_Settings::Instance()->CacheScriptsFile && !ClickTale_FileChanged($path))
	{
		$config = ClickTale_Settings::Instance()->getCacheProviderConfig();
		$config["DeleteAfterPull"] = false;
		if ($cacheProvider->exists($key, $config))
		{
			$data = $cacheProvider->pull($key, $config);
			return unserialize($data);
		}
	} 

	$xml = new DOMDocument();
	$xml->load($path);
	// Find name=Top and name=Bottom elements using xpath.
	$xpath = new DOMXPath($xml);
	$top = $xpath->query("script[@name=\"Top\"]"); 
	$bottom = $xpath->query("script[@name=\"Bottom\"]");

	// name=Top and name=Bottom elements are mandatory.
	if (empty($top) || empty($bottom)) 
		throw new Exception("Scripts file must contain <script> elements. One with name=top and one with name=bottom."); 
	
	$returnItems = array
	(
		"TopScript" => $top->item(0)->textContent,
		"BottomScript" => $bottom->item(0)->textContent,

		"TopDoNotReplaceCondition" => @$top->item(0)->attributes->getNamedItem("DoNotReplaceCondition")->value,
		"BottomDoNotReplaceCondition" => @$bottom->item(0)->attributes->getNamedItem("DoNotReplaceCondition")->value,
		"TopInsertAfter" => @$bottom->item(0)->attributes->getNamedItem("InsertAfter")->value,
		"BottomInsertBefore" => @$bottom->item(0)->attributes->getNamedItem("InsertBefore")->value,
	);
			
	// Store in cache so we will not need to read from file each page request.
	$config = ClickTale_Settings::Instance()->getCacheProviderConfig();
	$config["MaxCachedSeconds"] = false;
	$cacheProvider->store($key, serialize($returnItems), $config);
	
	return $returnItems;
}

// Generates a string that represents a random hexacecimal number.
function ClickTale_RandHash($length)
{
// Another option: substr(md5(rand()), 0, 8); 

	$chars = 'abcdef0123456789';
    $string = '';
    for ($i = 0; $i < $length; $i++)
    {
        $pos = rand(0, strlen($chars)-1);
        $string .= $chars{$pos};
    }
    return $string;
}


// Converts physical path to url representation
function ClickTale_PathToUrl($path)
{
	// We use current url, file path and relation between them to extract info.
	$currentUrl = ClickTale_ForwardSlash($_SERVER["HTTP_HOST"].$_SERVER["SCRIPT_NAME"]);
	$currentPath = ClickTale_ForwardSlash($_SERVER["SCRIPT_FILENAME"]);
	$path = ClickTale_ForwardSlash($path);
	
	$prefixLength = ClickTale_SharedPrefixLength($currentPath, $path); // Prefix of $currentPath.
	
	$relative = substr($path, $prefixLength - 1);
	
	$suffixLength = strlen($currentPath) - $prefixLength;  // Suffix of $currentPath.
	
	$root = substr($currentUrl, 0, strlen($currentUrl) - $suffixLength - 1);
	
	//return "_".$relative."_";
	
	//return "_".$_SERVER["SCRIPT_NAME"]."__".$_SERVER["PHP_SELF"]."_".$_SERVER["ORIG_PATH_INFO"]."_";
	
	return $root.$relative;
}

// Gets the length of the the first shared part between two strings
function ClickTale_SharedPrefixLength($a, $b)
{
	$length = 0;
	while(strlen($a) > $length && strlen($b) > $length && $a[$length] == $b[$length])
		$length++;
		
	return $length;
}
/*
// Gets the length of the last shared part  of two strings
function ClickTale_SharedSuffixLength($a, $b)
{
	$length = 0;
	$ia = strlen($a);
	$ib = strlen($b);
	while($ia > 0 && $ib > 0 && $a[$ia] == $b[$ib])
	{
		$length++;
		$ia--;
		$ib--;
	}	
	return $length;
}
*/
// Convert all slashes to '/'
function ClickTale_ForwardSlash($url)
{
	$urlArr = explode("\\", $url);
	
	foreach($urlArr as $key => $value) 
	{ 
		if(empty($value)) 
			unset($urlArr[$key]); 
	}
	return implode("/", $urlArr); 

	//return  str_ireplace("\\", "/", $url); // This is not correct. Some paths may already have double back-slashes.
}





// Inserts ClickTale script. 
function ClickTale_Filter($buffer, $data, $hash)
{
  $settings = ClickTale_Settings::Instance();
  $config = $settings->getCacheProviderConfig();
  
  // create token replacements arrays
  $tokens = array();

  $tokens["%FetchFromUrl%"] = str_replace(array("%CacheToken%","%ClickTaleCacheUrl%"),
  	array($hash,ClickTale_PathToUrl(ClickTale_Root)), $settings->CacheFetchingUrl);
  
  $tokenKeys = array_keys($tokens);
  $tokenValues = array_values($tokens);
  
  
  
	if (!empty($data["TopScript"]) && !@preg_match(ClickTale_NormalizeRegex($data["TopDoNotReplaceCondition"]), $buffer))
	{
    $data["TopScript"] = str_replace($tokenKeys, $tokenValues, $data["TopScript"]);
		$topInsertAfter = ClickTale_NormalizeRegex($data["TopInsertAfter"]);
		if (empty($topInsertAfter))
			$topInsertAfter = "(<body.*?>)"; // Default value.
		$buffer = preg_replace($topInsertAfter, "$0".$data["TopScript"], $buffer, 1);
	}	
	
	if (!empty($data["BottomScript"]) && !@preg_match(ClickTale_NormalizeRegex($data["BottomDoNotReplaceCondition"]), $buffer))
	{
		//$data["BottomScript"] = str_replace("%CacheToken%", $hash, $data["BottomScript"]);
		//$data["BottomScript"] = str_replace("%ClickTaleWebRoot%", ClickTale_PathToUrl(ClickTale_Root), $data["BottomScript"]);
    $data["BottomScript"] = str_replace($tokenKeys, $tokenValues, $data["BottomScript"]);
		$bottomInsertBefore = ClickTale_NormalizeRegex($data["BottomInsertBefore"]);
		if (empty($bottomInsertBefore))
			$bottomInsertBefore = "(</body>)"; // Default value.
				
		$buffer = preg_replace($bottomInsertBefore, $data["BottomScript"]."$0", $buffer, 1);
	}
	
	return $buffer;
}


function ClickTale_ProcessOutput($buffer)
{
	if (ClickTale_CheckCookieFlagForRecording()) 
		return $buffer;
	try
	{
		// Data contains data from the scripts file.
		$data = ClickTale_LoadScripts(ClickTale_Settings::Instance()->ScriptsFile); 
	}
	catch (Exception $ex)
	{
		ClickTale_Logger::Write($ex->getMessage());
		return $buffer;
	}
	
	$settings = ClickTale_Settings::Instance();
	
	// Cache
	if (empty($settings->DisableCache))
	{
		$hash = $settings->UseStaticHash ? $settings->StaticHash : ClickTale_RandHash(20);
		$cacheProvider = ClickTale_CacheFactory::DefaultCacheProvider();
		$config = ClickTale_Settings::Instance()->getCacheProviderConfig();
		$cacheProvider->store($hash, $buffer, $config);
	}
	
	
	// Filter
	if (empty(ClickTale_Settings::Instance()->DisableFilter))
	{
		$buffer = ClickTale_Filter($buffer, $data, $hash);
	}
	
	return $buffer;
}



?>

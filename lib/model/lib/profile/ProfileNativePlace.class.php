<?php

/**
 * Description of ProfileNativePlace
 * Library Class to handle Model for NATIVE_PLACE Table
 *
 * @package     jeevansathi
 * @author      Kunal Verma
 * @created     14th Sept 2016
 */
class ProfileNativePlace
{
    /**
     * Member Variable
     */

    /**
     * @var Static Instance of this class
     */
    private static $instance;
    
    /**
     * Object of Store class
     * @var instance of NEWJS_PROFILE|null
     */
    private static $objNativePlaceMysql = null;

    /**
     * @fn __construct
     * @brief Constructor function
     * @param $dbName - Database to which the connection would be made
     */
    private function __construct($dbname = "")
    {
        self::$objNativePlaceMysql = new NEWJS_NATIVE_PLACE($dbname);
    }

    /**
     * To Stop clone of this class object
     */
    private function __clone()
    {
        
    }

    /**
     * To stop unserialize for this class object
     */
    private function __wakeup()
    {
        
    }

    /**
     * @fn getInstance
     * @brief fetches the instance of the class
     * @param $dbName - Database name to which the connection would be made
     * @return instance of this class
     */
    public static function getInstance($dbName = '')
    {
        if (!$dbName)
            $dbName = "newjs_master";
        if (isset(self::$instance)) {
            //If different instance is required
            if ($dbName != self::$instance->connectionName) {
                $class = __CLASS__;
                self::$instance = new $class($dbName);
                self::$instance->connectionName = $dbName;
            }
        }
        else {
            $class = __CLASS__;
            self::$instance = new $class($dbName);
            self::$instance->connectionName = $dbName;
        }
        return self::$instance;
    }

    /**
     * 
     * @param type $arrRecordData
     * @return type
     */
    public function InsertRecord($arrRecordData)
    {
        //Insert Record returns rowCount
        $result = self::$objNativePlaceMysql->InsertRecord($arrRecordData);
        
        if($result && isset($arrRecordData['PROFILEID'])) {
                if(!$arrRecordData["NATIVE_CITY"]){
                        $arrRecordData['NATIVE_CITY']='';
                }
                if(!$arrRecordData["NATIVE_STATE"]){
                        $arrRecordData['NATIVE_STATE']='';
                }
            ProfileCacheLib::getInstance()->insertInCache($arrRecordData['PROFILEID'], $arrRecordData,__CLASS__);
        }
        return $result;
    }

    /**
     * 
     * @param type $iProfileID
     * @param type $arrRecordData
     * @return type
     */
    public function UpdateRecord($iProfileID, $arrRecordData)
    {
        $bResult = self::$objNativePlaceMysql->UpdateRecord($iProfileID, $arrRecordData);
        if(true === $bResult) {
            ProfileCacheLib::getInstance()->updateCache($arrRecordData, ProfileCacheConstants::CACHE_CRITERIA, $iProfileID, __CLASS__);
        }
        return $bResult;
    }

    /**
     * 
     * @param type $iProfileID
     * @return type
     */
    public function getRecord($iProfileID)
    {
        $bServedFromCache = false;
        $objProCacheLib =ProfileCacheLib::getInstance();
        if ($objProCacheLib->isCached(ProfileCacheConstants::CACHE_CRITERIA, $iProfileID, 'NATIVE_COUNTRY,NATIVE_STATE,NATIVE_CITY', __CLASS__)) {
            //Get From Cache
            $result = $objProCacheLib->get(ProfileCacheConstants::CACHE_CRITERIA, $iProfileID, 'NATIVE_COUNTRY,NATIVE_STATE,NATIVE_CITY', __CLASS__);

            if (false !== $result) {
                $bServedFromCache = true;
                $result = FormatResponse::getInstance()->generate(FormatResponseEnums::REDIS_TO_MYSQL, $result);
            }
            
            if($result && $result["NATIVE_COUNTRY"] === ProfileCacheConstants::NOT_FILLED){
                $result = null;
            }
        }
        if ($bServedFromCache && ProfileCacheConstants::CONSUME_PROFILE_CACHE) {
            $this->logCacheConsumeCount(__CLASS__);
            return $result;
        }
        
        //Get Records from Mysql
        $result = self::$objNativePlaceMysql->getRecord($iProfileID);
        
        if(is_null($result)) { 
            //TODO check PROFILEID is Valid or not
                $dummyResult = ProfileCacheFunctions::setNotFilledArray(__CLASS__, $iProfileID);
        }
        
        if (is_array($result) && false === ProfileCacheFunctions::isCommandLineScript("set")) {
            $result['PROFILEID'] = $iProfileID;
            $objProCacheLib->cacheThis(ProfileCacheConstants::CACHE_CRITERIA, $result['PROFILEID'], $result,__CLASS__);
        }
        
        if (is_array($dummyResult) && false === ProfileCacheFunctions::isCommandLineScript("set")) {
            $objProCacheLib->cacheThis(ProfileCacheConstants::CACHE_CRITERIA, $dummyResult['PROFILEID'], $dummyResult,__CLASS__);
        }
        return $result;
    }

    /**
     * 
     * @param type $profileid
     * @return type
     */
    public function getNativeData($profileid)
    {
        return $this->getRecord($profileid);
    }

    /**
     * 
     * @param type $profileidArray
     * @return type
     */
    public function getNativeDataForMultipleProfiles($profileidArray)
    {
        $bServedFromCache = false;
        $objProCacheLib = ProfileCacheLib::getInstance();
        
        $result = $objProCacheLib->getForMultipleKeys(ProfileCacheConstants::CACHE_CRITERIA, $profileidArray,"PROFILEID,NATIVE_COUNTRY,NATIVE_STATE,NATIVE_CITY",__CLASS__);
        
        if (is_array($result) && false !== $result) {
            $bServedFromCache = true;
            $result = FormatResponse::getInstance()->generate(FormatResponseEnums::REDIS_TO_MYSQL, $result);
        }
        
        if(is_array($result) && count($result)) {
            foreach($result as $k=>$v){
                if($v[NATIVE_COUNTRY] === ProfileCacheConstants::NOT_FILLED) {
                    unset($result[$k]);
                }
            }
            $result = array_values($result);
        }
        
        if ($bServedFromCache && ProfileCacheConstants::CONSUME_PROFILE_CACHE) {
            $this->logCacheConsumeCount(__CLASS__);
            return $result;
        }
        
        //Get Records from Mysql
        $result = self::$objNativePlaceMysql->getNativeDataForMultipleProfiles($profileidArray);
        //echo "adads";print_r($result);die;
        if(is_array($result) && count($result) !== count($profileidArray)) {
            $arrDataNotExist = array();
            foreach($result as $key=>$val){
                $arrDataNotExist[] = $val['PROFILEID'];
            }
            $arrDataNotExist = array_diff($profileidArray, $arrDataNotExist);
            //print_r($arrDataNotExist);die;
            $dummyArray = array();
            foreach($arrDataNotExist as $k => $v){
                    $data = ProfileCacheFunctions::setNotFilledArray(__CLASS__, $v);
                    $dummyArray[] = $data;
            }
        }
        
        if(is_array($result) && count($result) && false === ProfileCacheFunctions::isCommandLineScript("set")) {
            $objProCacheLib->cacheForMultiple(ProfileCacheConstants::CACHE_CRITERIA, $result,__CLASS__);
        }
        
        if($dummyArray && is_array($dummyArray) && count($dummyArray) && false === ProfileCacheFunctions::isCommandLineScript("set")) {
            $objProCacheLib->cacheForMultiple(ProfileCacheConstants::CACHE_CRITERIA, $dummyArray,__CLASS__);
        }
        return $result;
    }

    /**
     * 
     * @param type $funName
     */
    private function logCacheConsumeCount($funName)
    {return;
        $key = 'cacheConsumption' . '_' . date('Y-m-d');
        JsMemcache::getInstance()->hIncrBy($key, $funName);

        JsMemcache::getInstance()->hIncrBy($key, $funName . '::' . date('H'));
    }

}

?>

<?php 
/**
 * This file updates the occupation grouping for new and changed occupation values
 */
ini_set('memory_limit',"256M");
$flag_using_php5 = 1;
include_once("/usr/local/scripts/DocRoot.php");
include("config.php");
include("connect.inc");


include_once(JsConstants::$docRoot."/classes/Mysql.class.php");
include_once(JsConstants::$docRoot."/commonFiles/SymfonyPictureFunctions.class.php");
include_once(JsConstants::$docRoot."/classes/globalVariables.Class.php");
include_once(JsConstants::$docRoot."/classes/JProfileUpdateLib.php");


$updateArray = array(
    0 => array('TABLE_NAME'=>'newjs.JPARTNER','IS_MASTER'=>FALSE,'OCCUPATION_VALUE_FIELD'=>'PARTNER_OCC','OCCUPATIN_GROUP_FIELD'=>'OCCUPATION_GROUPING',"PRIMARY_KEY"=>"PROFILEID",'IS_SINGLE_QUOTE' => TRUE,'IS_OCCUPATION_CHANGE' => TRUE,'IS_OCCUPATION_GROUPING_CHANGE' => TRUE),
    1 => array('TABLE_NAME'=>'newjs.SEARCH_MALE','IS_MASTER'=>TRUE,'OCCUPATION_VALUE_FIELD'=>'OCCUPATION','OCCUPATIN_GROUP_FIELD'=>'OCCUPATION_GROUPING',"PRIMARY_KEY"=>"PROFILEID",'IS_SINGLE_QUOTE' => FALSE, 'IS_OCCUPATION_CHANGE' => FALSE,'IS_OCCUPATION_GROUPING_CHANGE' => TRUE),
    2 => array('TABLE_NAME'=>'newjs.SEARCH_FEMALE','IS_MASTER'=>TRUE,'OCCUPATION_VALUE_FIELD'=>'OCCUPATION','OCCUPATIN_GROUP_FIELD'=>'OCCUPATION_GROUPING',"PRIMARY_KEY"=>"PROFILEID",'IS_SINGLE_QUOTE' => FALSE, 'IS_OCCUPATION_CHANGE' => FALSE,'IS_OCCUPATION_GROUPING_CHANGE' => TRUE),
    // 3 => array('TABLE_NAME'=>'newjs.SEARCH_AGENT','IS_MASTER'=>TRUE,'OCCUPATION_VALUE_FIELD'=>'OCCUPATION','OCCUPATIN_GROUP_FIELD'=>'OCCUPATION_GROUPING',"PRIMARY_KEY"=>"ID",'IS_SINGLE_QUOTE' => FALSE, 'IS_OCCUPATION_CHANGE' => TRUE,'IS_OCCUPATION_GROUPING_CHANGE' => TRUE),
    // 4 => array('TABLE_NAME'=>'search.LATEST_SEARCHQUERY','IS_MASTER'=>TRUE,'OCCUPATION_VALUE_FIELD'=>'OCCUPATION','OCCUPATIN_GROUP_FIELD'=>'OCCUPATION_GROUPING',"PRIMARY_KEY"=>"ID",'IS_SINGLE_QUOTE' => FALSE, 'IS_OCCUPATION_CHANGE' => TRUE,'IS_OCCUPATION_GROUPING_CHANGE' => TRUE),
    5 => array('TABLE_NAME'=>'newjs.SEARCH_FEMALE_REV','IS_MASTER'=>TRUE,'OCCUPATION_VALUE_FIELD'=>'PARTNER_OCC','OCCUPATIN_GROUP_FIELD'=>'',"PRIMARY_KEY"=>"PROFILEID",'IS_SINGLE_QUOTE'  => FALSE, 'IS_OCCUPATION_CHANGE' => TRUE,'IS_OCCUPATION_GROUPING_CHANGE' => FALSE),
    6 => array('TABLE_NAME'=>'newjs.SEARCH_MALE_REV','IS_MASTER'=>TRUE,'OCCUPATION_VALUE_FIELD'=>'PARTNER_OCC','OCCUPATIN_GROUP_FIELD'=>'',"PRIMARY_KEY"=>"PROFILEID",'IS_SINGLE_QUOTE'  => FALSE, 'IS_OCCUPATION_CHANGE' => TRUE,'IS_OCCUPATION_GROUPING_CHANGE' => FALSE),
    );  
// Master and slave connection object
global $mysqlObjS , $mysqlObjM;

$mysqlObjM = new Mysql;
$connMaster = $mysqlObjM->connect("master") or logError("Unable to connect to master","ShowErrTemplate");
mysql_query('set session wait_timeout=10000,interactive_timeout=10000,net_read_timeout=10000',$connMaster);

$sql="SET @DONT_UPDATE_TRIGGER=1";
mysql_query($sql,$connMaster) or die(mysql_error().$sql);

$mysqlObjS = new Mysql;
$connSlave = $mysqlObjS->connect("slave") or logError("Unable to connect to slave","ShowErrTemplate");
mysql_query('set session wait_timeout=10000,interactive_timeout=10000,net_read_timeout=10000',$connSlave);



foreach ($updateArray as $key => $tableArr) 
{
    if($tableArr['TABLE_NAME'] == 'newjs.JPARTNER')
    {
        for($activeServerId=0;$activeServerId<$noOfActiveServers;$activeServerId++)
        {
            $connArray = getShardConnection($activeServerId);  
            if($connArray['slave'] && $connArray['master'])
            {
                updateOccupationGrouping($tableArr["TABLE_NAME"],$tableArr['OCCUPATION_VALUE_FIELD'],$tableArr['OCCUPATIN_GROUP_FIELD'],$connArray['slave'],$connArray['master'],$tableArr['PRIMARY_KEY'],$tableArr['IS_SINGLE_QUOTE'],$tableArr['IS_OCCUPATION_CHANGE'],$tableArr['IS_OCCUPATION_GROUPING_CHANGE']);
            }
        }
    }
    else
    {
         updateOccupationGrouping($tableArr["TABLE_NAME"],$tableArr['OCCUPATION_VALUE_FIELD'],$tableArr['OCCUPATIN_GROUP_FIELD'],$connSlave,$connMaster,$tableArr['PRIMARY_KEY'],$tableArr['IS_SINGLE_QUOTE'],$tableArr['IS_OCCUPATION_CHANGE'],$tableArr['IS_OCCUPATION_GROUPING_CHANGE']);              
    }
}


/**
 * function updates new grouping values
 * @param  string $tableName            table name
 * @param  string $occupationValueField name of the occupation field, i.e., occupation or partner_occ etc
 * @param  string $occupationGroupField name of the occupation group field
 * @param  mysql connection $slaveConn            mysql connection on slave to select data
 * @param  mysql $masterConn           mysql connection on master
 * @param  string $primaryKey           the key on which fetching and updation is done
 * @param  boolean $isSingleQuote        whether occupation values are stored as sigle quoted or not
 * @param  boolean $isOccupationChange   whether we need to change occupation values too. in some case, only occupation grouping needs to be changed
 * @param  boolean $isOccupationGroupingChange whether we need to update occupation groupings too
 */
function updateOccupationGrouping($tableName,$occupationValueField,$occupationGroupField,$slaveConn,$masterConn,$primaryKey,$isSingleQuote,$isOccupationChange,$isOccupationGroupingChange)
{
    global $mysqlObjS , $mysqlObjM;

    $selectSql = "SELECT $primaryKey,$occupationValueField from $tableName where ".$occupationValueField." != '' and ".$occupationValueField." != '0'";

    $result = $mysqlObjS->executeQuery($selectSql,$slaveConn) or $mysqlObjS->logError($selectSql);
    while($row = $mysqlObjS->fetchAssoc($result))
    { 
        if ( $row[$occupationValueField] )
        {
            unset($occupationGroups);   
            unset($occupationValues);   
            unset($setQuery);   
            unset($updateSql);   
            unset($setQuery);   
            $occupationGroups = CommonFunction::getOccupationGroups($row[$occupationValueField],$isSingleQuote);
            if ( $isOccupationChange && $isOccupationGroupingChange)
            {
                $occupationValues = CommonFunction::getOccupationValues($occupationGroups,$isSingleQuote);
                $setQuery = ' SET '.$occupationValueField.' = "'.$occupationValues .'",'.$occupationGroupField.'= "'.$occupationGroups;
            }
            else if ( $isOccupationGroupingChange )
            {
                $setQuery = ' SET '.$occupationGroupField.'= "'.$occupationGroups;
            }
            else
            {
                $occupationValues = CommonFunction::getOccupationValues($occupationGroups,$isSingleQuote);
                $setQuery = ' SET '.$occupationValueField.' = "'.$occupationValues;
            }
            $updateSql = 'UPDATE '.$tableName.$setQuery.'" WHERE '. $primaryKey.' = '.$row[$primaryKey];
            $mysqlObjM->executeQuery($updateSql,$masterConn) or $mysqlObjM->logError($updateSql);

        }
    }
}
/**
 * 
 * @global Mysql $mysqlObjM
 * @global Mysql $mysqlObjS
 * @param type $activeServerId active server id
 * @return type array of master and slave connection
 */
function getShardConnection($activeServerId){
    global $mysqlObjM, $mysqlObjS;
    
    $myDbName=getActiveServerName($activeServerId,'master',$mysqlObjM);
    $shardConnMaster=$mysqlObjM->connect("$myDbName");
    mysql_query('set session wait_timeout=86400,interactive_timeout=86400,net_read_timeout=86400',$shardConnMaster);
    $sql="SET @DONT_UPDATE_TRIGGER=1";
    mysql_query($sql,$shardConnMaster) or die(mysql_error().$sql);

    $myDbName=getActiveServerName($activeServerId,'slave',$mysqlObjS);
    $shardConnSlave=$mysqlObjS->connect("$myDbName");
    mysql_query('set session wait_timeout=86400,interactive_timeout=86400,net_read_timeout=86400',$shardConnSlave);
    return array('master'=>$shardConnMaster,'slave'=>$shardConnSlave);
}


?>
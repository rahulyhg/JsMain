<?php
/*********************************************************************************************
 * FILE NAME       : paidCampaignProcess.php
 * DESCRIPTION     : Change the Dialer Dial status to 0
 *********************************************************************************************/
include "MysqlDbConstants.class.php";
include_once "DialerLog.class.php";
$dialerLogObj = new DialerLog();

//Open connection at JSDB
$db_js     = mysql_connect(MysqlDbConstants::$misSlave['HOST'], MysqlDbConstants::$misSlave['USER'], MysqlDbConstants::$misSlave['PASS']) or die("Unable to connect to nmit server");
$db_master = mysql_connect(MysqlDbConstants::$master['HOST'], MysqlDbConstants::$master['USER'], MysqlDbConstants::$master['PASS']) or die("Unable to connect to nmit server ");
$db_js_111 = mysql_connect(MysqlDbConstants::$slave111['HOST'], MysqlDbConstants::$slave111['USER'], MysqlDbConstants::$slave111['PASS']) or die("Unable to connect to local-111 server");
$db_dialer = mssql_connect(MysqlDbConstants::$dialer['HOST'], MysqlDbConstants::$dialer['USER'], MysqlDbConstants::$dialer['PASS']) or die("Unable to connect to dialer server");

$campaignName   = 'OB_JS_RCB';
$action         = 'STOP';
$str            = 'Dial_Status=0';
$date2DayBefore = date("Y-m-d H:i:s", time() - 58 * 60 * 60);

$profilesArr = fetchProfiles($db_master);
$profileStr  = implode(",", $profilesArr);

$allocatedArr   = getAllocatedProfiles($profilesArr, $db_js);
$paidArr        = getPaidProfiles($profilesArr, $db_js, $dateTime);
$eligibleArrNew = array_merge($allocatedArr, $paidArr);
$eligibleArrNew = array_unique($eligibleArrNew);
$eligibleArrNew = array_values($eligibleArrNew);

if ($profileStr != '') {
    // Set dial status=0 for paid campaign
    $query1 = "UPDATE easy.dbo.ct_$campaignName SET Dial_Status='0' WHERE CSV_ENTRY_DATE<'$date2DayBefore'";
    mssql_query($query1, $db_dialer) or $dialerLogObj->logError($query1, $campaignName, $db_dialer, 1);
    deleteProfiles($db_master, $profileStr);

    foreach ($profilesArr as $key => $profileid) {
        $log_query = "INSERT into js_crm.DIALER_UPDATE_LOG (PROFILEID,CAMPAIGN,UPDATE_STRING,TIME,ACTION) VALUES ('$profileid','$campaignName','Dial_Status=0',now(),'$action')";
        mysql_query($log_query, $db_js_111) or die($log_query . mysql_error($db_js_111));
    }
}

// Stop profiles which are paid and allocated
if (count($eligibleArrNew > 0)) {
    foreach ($eligibleArrNew as $key => $profileid) {

        $query1 = "UPDATE easy.dbo.ct_$campaignName SET Dial_Status=0 WHERE PROFILEID='$profileid'";
        mssql_query($query1, $db_dialer) or $dialerLogObj->logError($query1, $campaignName, $db_dialer, 1);

        $deleteArr[] = $profileid;
        addLog($profileid, $campaignName, $str, $action, $db_js_111);
    }
    if (is_array($deleteArr)) {
        $profileStrDel = implode(",", $deleteArr);
        deleteProfiles($db_master, $profileStrDel);
        unset($deleteArr);
    }
}

// mail added
$to   = "manoj.rana@naukri.com";
$sub  = "Dialer updates of RCB Campaign Process.";
$from = "From:vibhor.garg@jeevansathi.com";
mail($to, $sub, $profileStr, $from);

// Fetch profile with dial status 0
function fetchProfiles($db_js)
{
    $profileArr = array();
    $sql        = "SELECT PROFILEID FROM incentive.SALES_CSV_DATA_RCB WHERE DIAL_STATUS=0";
    $res        = mysql_query($sql, $db_js) or die($sql . mysql_error($db_js));
    while ($myrow = mysql_fetch_array($res)) {
        $profileArr[] = $myrow["PROFILEID"];
    }

    return $profileArr;
}
function deleteProfiles($db_master, $profiles)
{
    $sql = "delete FROM incentive.SALES_CSV_DATA_RCB WHERE DIAL_STATUS=0 AND PROFILEID IN ($profiles)";
    $res = mysql_query($sql, $db_master) or die($sql . mysql_error($db_master));
}

// Add logging
function addLog($profileid, $campaignName, $str = '', $action, $db_js_111)
{
    $log_query = "INSERT into js_crm.DIALER_UPDATE_LOG (PROFILEID,CAMPAIGN,UPDATE_STRING,TIME,ACTION) VALUES ('$profileid','$campaignName','$str',now(),'$action')";
    mysql_query($log_query, $db_js_111) or die($log_query . mysql_error($db_js_111));
}

// Fetch allocated profiles
function getAllocatedProfiles($profileArr, $db_js)
{
    $dataArr    = array();
    $profileStr = implode(",", $profileArr);
    $sql        = "SELECT PROFILEID FROM incentive.MAIN_ADMIN WHERE PROFILEID IN($profileStr)";
    $res        = mysql_query($sql, $db_js) or die($sql . mysql_error($db_js));
    while ($myrow = mysql_fetch_array($res)) {
        $dataArr[] = $myrow["PROFILEID"];
    }
    return $dataArr;
}

// Fetch Paid profiles
function getPaidProfiles($profileArr, $db_js, $dateTime)
{
    $dataArr    = array();
    $profileStr = implode(",", $profileArr);
    $sql        = "SELECT distinct PROFILEID FROM billing.PURCHASES WHERE PROFILEID IN($profileStr) AND STATUS='DONE' AND ENTRY_DT>='$dateTime' AND MEMBERSHIP='Y'";
    $res        = mysql_query($sql, $db_js) or die($sql . mysql_error($db_js));
    while ($myrow = mysql_fetch_array($res)) {
        $dataArr[] = $myrow["PROFILEID"];
    }
    return $dataArr;
}

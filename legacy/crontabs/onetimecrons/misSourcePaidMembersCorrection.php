<?php 
  $curFilePath = dirname(__FILE__)."/"; 
 include_once("/usr/local/scripts/DocRoot.php");
include($curFilePath."../connect.inc");
connect_db();
//connect_db();
for($i=1;$i<20;$i++)
{
	$previousDays = time() - $i*24*60*60;
                   // 7 days; 24 hours; 60 mins; 60secs
$tpaid45=$previousDays-44*24*60*60;
$datePaid45=date("Y-m-d",$tpaid45);
$st_datePaid45=$datePaid45." 00:00:00";
$end_datePaid45=$datePaid45." 23:59:59";

$tpaid90=$previousDays-89*24*60*60;
$datePaid90=date("Y-m-d",$tpaid90);
$st_datePaid90=$datePaid90." 00:00:00"."\n";
$end_datePaid90=$datePaid90." 23:59:59";

//Paid Count Sql starts 
//45 days
$sql="INSERT INTO MIS.SOURCE_MEMBERS_PAID (ENTRY_DT,SOURCEID,ACTIVATED,INCOMPLETE,ENTRY_MODIFY,AGE,CITY_RES,COUNTRY_RES,GENDER,MTONGUE,MSTATUS,RELATION,COUNT45,COUNT90,SEC_SOURCE,HAVEPHOTO,PHONE_STATUS,DUPLICATE) SELECT left(P.REG_DATE,10) as dd,J.SOURCE AS SOURCE,J.ACTIVATED AS ACTIVATED,INCOMPLETE,'E',AGE,CITY_RES,COUNTRY_RES,J.GENDER,MTONGUE,MSTATUS,RELATION,COUNT( DISTINCT S.PROFILEID ) ,0,SEC_SOURCE,HAVEPHOTO,IF((J.MOB_STATUS='Y' OR J.LANDL_STATUS='Y'),'Y','N') as PHONE_STATUS ,IF(D.PROFILEID is NULL,'N','Y') as DUPLICATE 
FROM  newjs.INCOMPLETE_PROFILES as P 
LEFT JOIN newjs.JPROFILE as J ON P.PROFILEID=J.PROFILEID 
left join duplicates.DUPLICATE_PROFILES as D  ON P.PROFILEID=D.PROFILEID 
LEFT JOIN billing.PAYMENT_DETAIL AS S ON P.PROFILEID = S.PROFILEID
LEFT JOIN billing.SERVICE_STATUS AS B ON B.BILLID = S.BILLID
WHERE (P.REG_DATE BETWEEN '$st_datePaid45' AND '$end_datePaid45') AND S.STATUS='DONE' AND S.AMOUNT >0
AND (
B.SERVEFOR LIKE  '%F%'
OR B.SERVEFOR LIKE  '%D%'
OR B.SERVEFOR LIKE  '%X%'
)
AND DATEDIFF(S.ENTRY_DT,P.REG_DATE)<=45
GROUP BY dd,SOURCE,J.ACTIVATED,INCOMPLETE,AGE,CITY_RES,COUNTRY_RES,GENDER,MTONGUE,MSTATUS,RELATION,SEC_SOURCE,HAVEPHOTO,PHONE_STATUS,DUPLICATE";
mysql_query($sql) or die(mysql_error());

//90 days
$sql="INSERT INTO  MIS.SOURCE_MEMBERS_PAID (ENTRY_DT,SOURCEID,ACTIVATED,INCOMPLETE,ENTRY_MODIFY,AGE,CITY_RES,COUNTRY_RES,GENDER,MTONGUE,MSTATUS,RELATION,COUNT45,COUNT90,SEC_SOURCE,HAVEPHOTO,PHONE_STATUS,DUPLICATE) SELECT left(P.REG_DATE,10) as dd,J.SOURCE AS SOURCE,J.ACTIVATED AS ACTIVVATED,INCOMPLETE,'E',AGE,CITY_RES,COUNTRY_RES,J.GENDER,MTONGUE,MSTATUS,RELATION,0,COUNT( DISTINCT S.PROFILEID ) ,SEC_SOURCE,HAVEPHOTO,IF((J.MOB_STATUS='Y' OR J.LANDL_STATUS='Y'),'Y','N') as PHONE_STATUS ,IF(D.PROFILEID is NULL,'N','Y') as DUPLICATE 
FROM  newjs.INCOMPLETE_PROFILES as P 
LEFT JOIN newjs.JPROFILE as J ON P.PROFILEID=J.PROFILEID 
left join duplicates.DUPLICATE_PROFILES as D  ON J.PROFILEID=D.PROFILEID 
LEFT JOIN billing.PAYMENT_DETAIL AS S ON J.PROFILEID = S.PROFILEID
LEFT JOIN billing.SERVICE_STATUS AS B ON B.BILLID = S.BILLID
WHERE (P.REG_DATE BETWEEN '$st_datePaid90' AND '$end_datePaid90') AND S.STATUS='DONE' AND S.AMOUNT >0
AND (
B.SERVEFOR LIKE  '%F%'
OR B.SERVEFOR LIKE  '%D%'
OR B.SERVEFOR LIKE  '%X%'
)
AND DATEDIFF(S.ENTRY_DT,P.REG_DATE)<=90
GROUP BY dd,SOURCE,J.ACTIVATED,INCOMPLETE,AGE,CITY_RES,COUNTRY_RES,GENDER,MTONGUE,MSTATUS,RELATION,SEC_SOURCE,HAVEPHOTO,PHONE_STATUS,DUPLICATE";
mysql_query($sql) or die(mysql_error());


$sql="UPDATE MIS.SOURCE_MEMBERS_PAID a, MIS.SOURCE b SET a.SOURCEGP=b.GROUPNAME WHERE a.SOURCEID=b.SourceID AND a.SOURCEGP=''";
mysql_query($sql) or die(mysql_error());
}

<?php 
  $curFilePath = dirname(__FILE__)."/"; 
 include_once("/usr/local/scripts/DocRoot.php");

die();
include "$_SERVER[DOCUMENT_ROOT]/jsadmin/connect.inc";
$from="payments@jeevansathi.com";
$cc="bodhsatv@naukri.com,shyam.kumar@jeevansathi.com";

$msg='';
$last_walkin='';
unset($inmail);
$cur_date=date('d-m-Y');
$date=date('Y-m-d');
		
		$sql="create TEMPORARY TABLE billing.due_amount_tab select MAX(BILLID) as BILLID,PROFILEID from billing.PURCHASES GROUP BY PROFILEID";
		mysql_query($sql) or die("could not create temp table");	
		
		$sql=" (SELECT USERNAME,DUEAMOUNT,DATE_FORMAT(DUEDATE,'%d-%m-%Y') as DUEDATE,WALKIN,ENTRYBY,DATE_FORMAT(ENTRY_DT,'%d-%m-%Y') as ENTRY_DATE from billing.PURCHASES as a,billing.due_amount_tab as b WHERE  a.BILLID=b.BILLID and DUEDATE<=DATE_ADD('$date',INTERVAL 7 DAY) and `DUEAMOUNT` > 100 and STATUS='DONE') UNION (SELECT USERNAME,DUEAMOUNT,DATE_FORMAT(DUEDATE,'%d-%m-%Y') as DUEDATE,WALKIN,ENTRYBY,DATE_FORMAT(ENTRY_DT,'%d-%m-%Y') as ENTRY_DATE from billing.PURCHASES as c,billing.due_amount_tab as d WHERE  c.BILLID=d.BILLID and ENTRY_DT<=DATE_SUB('$date',INTERVAL 30 DAY) and `DUEAMOUNT` > 100 and STATUS='DONE') ORDER BY WALKIN";
		$result=mysql_query($sql) or die(mysql_error());
		if(mysql_num_rows($result)>0)
		{
			while($myrow=mysql_fetch_array($result))
			{

				if($myrow['DUEDATE']=='00-00-0000')
					$due_dt_set=$myrow['ENTRY_DATE'];
				else
					$due_dt_set=$myrow['DUEDATE'];
				if($last_walkin!=$myrow['WALKIN'])
				{
					if(count($inmail) > 0)
					{
					        $msg = "\n\nUSERNAME    "."DUEAMOUNT     "."DUEDATE	"."SALE_BY	"."ENTRY_BY	"."ENTRY_DT	\n".implode("\n",$inmail);
						$email=get_email($last_walkin);
						if($email=="")
						{
							$email=get_boss_email($last_walkin);
							$cc1=$cc;
						}
						else
						{
							$boss_email=get_boss_email($last_walkin);
							if($boss_email!='')
								$cc1=$boss_email.",".$cc;
							else
								$cc1=$cc;
						}
						$sub="Due Payment for $last_walkin on $cur_date";
						mail($email, $sub, $msg,"From: $from\r\n"."Cc: $cc1\r\n"."Bcc: $bcc\r\n"."X-Mailer: PHP/" . phpversion());
						unset($inmail);
						unset($msg);
					}

					$last_walkin=$myrow['WALKIN'];
					$inmail[]=$myrow['USERNAME']."        ".$myrow['DUEAMOUNT']."       ".$due_dt_set."	".$myrow['WALKIN']."        ".$myrow['ENTRYBY']."        ".$myrow['ENTRY_DATE'];
				}
				else
				{
					$inmail[]=$myrow['USERNAME']."        ".$myrow['DUEAMOUNT']."       ".$due_dt_set."	".$myrow['WALKIN']."        ".$myrow['ENTRYBY']."        ".$myrow['ENTRY_DATE'];
				}
			}
			if(count($inmail) > 0)
			{
				$email=get_email($last_walkin);
                                if($email=="")
                                {
                                        $email=get_boss_email($last_walkin);
                                        $cc1=$cc;
                                }
                                else
                                {
                                        $boss_email=get_boss_email($last_walkin);
                                        if($boss_email!='')
                                                $cc1=$boss_email.",".$cc;
                                        else
                                                $cc1=$cc;
                                }
				$sub="Due Payment for $last_walkin on $cur_date";
				$msg = "\n\nUSERNAME    "."DUEAMOUNT     "."DUEDATE     "."SALE_BY      "."ENTRY_BY     "."ENTRY_DT     \n".implode("\n",$inmail);
				mail($email, $sub, $msg,"From: $from\r\n"."Cc: $cc1\r\n"."Bcc: $bcc\r\n"."X-Mailer: PHP/" . phpversion());
				unset($inmail);
				unset($msg);
			}


		}

?>	

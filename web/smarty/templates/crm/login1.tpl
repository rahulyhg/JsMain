<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JeevanSathi Matrimonials - My JeevanSathi</title>
<link href="/P/images/styles.css" rel="stylesheet" type="text/css">
<link href="/P/imagesnew/styles.css" rel="stylesheet" type="text/css">

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
}
-->
</style>

<script language="javascript">
<!--
                                                                                                                             
function MM_openBrWindow(theURL,winName,features)
{
        window.open(theURL,winName,features);
}
                                                                                                                             
//-->
</SCRIPT>

</head>

<body>
<table width="60%"  border="0" align="center" cellpadding="0" cellspacing="0">
 <tr>
  <td  valign="top"><br>
   <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
     <td colspan="2" rowspan="3" valign="top"><img src="/P/imagesnew/ps_1.gif" width="9" height="17"></td>
     <td width="531" bgcolor="#000000"><img src="/P/imagesnew/zero.gif" width="1" height="1"></td>
     <td colspan="2" rowspan="3" valign="top"><img src="/P/imagesnew/ps_2.gif" width="39" height="17"></td>
    </tr>
    <tr>
     <td height="15" width="100%" class="bgbrownL3"><span class="mediumblackb">Profile Statistics</span></td>
    </tr>
    <tr>
     <td bgcolor="#000000"><img src="/P/imagesnew/zero.gif" width="1" height="1"></td>
    </tr>
    <tr>
     <td bgcolor="#000000"><img src="/P/imagesnew/zero.gif" width="1" height="1"></td>
     <td width="8">&nbsp;</td>
     <td>
     <table width="100%"  border="0" cellspacing="0" cellpadding="0">

<!-- New data records -->
	~if $new_username`	
	<tr>
	       <td width="27%" class="mediumblack">Name of person </td>
	       <td width="1%">:</td>
	       <td colspan="2" class="mediumblack" >&nbsp;~$new_username`</td>
	</tr>
	~/if`
	<tr>
	       <td width="27%" class="mediumblack">Current Status </td>
	       <td width="1%">:</td>
	       <td colspan="2" class="mediumblack" >&nbsp;~if $ISONLINE` Online ~else` Offline ~/if` </td>
	</tr>
<!-- New data records ends -->
	<tr>
	       <td width="27%" class="mediumblack">Profile Views </td>
	       <td width="1%">:</td>
	       <td colspan="2" class="mediumblack" >&nbsp;~$VIEWS`</td>
	</tr>
	<tr>
       		<td class="mediumblack">Profile last edited</td>
       		<td>:</td>
       		<td colspan="2" class="mediumblack" >&nbsp;~$LAST_MODIFIED`</td>
      	</tr>
	~if $PRIVACY neq ''`
	<tr>
        	<td class="mediumblack">Privacy Settings</td>
        	<td>:</td>
        	<td colspan="2" class="mediumblack">&nbsp;
        	~if $PRIVACY eq 'A'`
        	Everyone can view
        	~elseif $PRIVACY eq 'F'`
        	Only people who pass filter can view
        	~elseif $PRIVACY eq 'C'`
        	Only contacted people can view
        	~/if`
        	</td>
       	</tr>
        ~/if`
	 <tr>
                <td class="mediumblack">Action Required </td>
                <td>:</td>
                <td class="mediumblack" >&nbsp;~$ACTIONREQUIRED`</font></td>
                <td>&nbsp;
                </td>
        </tr>
        <tr>
                <td class="mediumblack">Free Trial Offer status</td>
                <td>:</td>
                <td class="mediumblack" >&nbsp;~$FTO_OFFER_STATUS_MSG`</td>
                <td>&nbsp;
                </td>
        </tr>
	<tr>
       		<td class="mediumblack">Membership Status </td>
       		<td>:</td>
       		<td class="mediumblack" >&nbsp;~$MEMBERSHIP`</td>
       		<td>&nbsp;
		~if $MEMBERSHIP eq 'e-Rishta'`
			<img src="/P/imagesnew/logo_erishta.gif" >
		~elseif $MEMBERSHIP eq 'e-Classified'`
       			<img src="/P/imagesnew/logo_eclassifieds.gif" >
		~elseif $MEMBERSHIP eq 'e-Value Pack'`
       			<img src="/P/imagesnew/logo_evaluepack.gif" >
		~/if`
		</td>
        </tr>
	~if $ADDON_SUBSCRIPTION eq "yes"`
       	<tr>
       		<td class="mediumblack">Add on Services <br></td>
       		<td>:</td>
       		<td width="29%" class="mediumblack" >&nbsp;~$ADDON_MEMBERSHIP` </td>
      	</tr>
	~/if` 
	~if $FREE_SERVICES eq "Y"`
	<tr class="mediumblack">
		<td class="mediumblack"><FONT class=subhd>Free Services </FONT></td>
		<td>:</td>
		<td>&nbsp;~$FREE_SERVICES`</td>
	</tr>
	~/if`
	~if $SHOWEXPIRY eq 'yes'`
	<tr class="mediumblack">
		<td class="mediumblack"><FONT class=subhd>Membership Expires on</FONT></td>
		<td>:</td>
		<td>&nbsp;~$SSEXPIRYDT`<br>
	</tr>
	~/if`
	<tr class="mediumblack">
                <td class="mediumblack" valign="top"><FONT class=subhd>Service Requirement</FONT></td>
                <td valign="top"><b>:</b></td>
                <td valign="top"><font color="red" >&nbsp;~$serviceRequirement`<br>
        </tr>
    </table>
    </td>
     <td width="38">&nbsp;</td>
     <td  bgcolor="#000000"><img src="/P/imagesnew/zero.gif" width="1" height="1"></td>
    </tr>
    <tr>
     <td colspan="5" bgcolor="#696969"><img src="/P/imagesnew/zero.gif" width="1" height="1"></td>
    </tr>
   </table><br>
   
<br>
   <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
     <td height="18" align="right">

<!--
        <span class="mediumblackb">&nbsp;
        <a href="#" onclick="MM_openBrWindow('/crm/smsPassword.php?cid=~$cid`&checksum=~$CHECKSUM`','','width=400,height=100,scrollbars=no'); return false;">Send SMS of Username/Password</a>
        </span>

	<br>
-->
	<span class="mediumblackb">&nbsp;
	<a href="/crm/extraDetails_profile.php?cid=~$cid`&checksum=~$CHECKSUM`&table_name=~$table_name`&paid_str=~$paid_str`" target=_blank>Profile Matches (Click here)</a>
    	</span>
     </td>
    </tr>
    <tr>
     <td height="18" class="bgbrownL"><span class="mediumblackb">&nbsp;Detailed Profile Stats</span></td>
    </tr>
   </table>
 
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr class="bggrey">
     <td><img src="/P/imagesnew/zero.gif" width="8" height="20"></td>
     <td width="42%" class="mediumgreybl">Members who contacted you </td>
     <td width="8%" class="mediumgreybl">~$RECEIVEDSUM` </td>
     <td rowspan="4" bgcolor="#666666" ><img src="/P/imagesnew/zero.gif" width="1" height="1"></td>
     <td><img src="/P/imagesnew/zero.gif" width="8" height="1"></td>
     <td width="42%" class="mediumgreybl">Members you contacted </td>
     <td width="8%" class="mediumgreybl">~$MADESUM` </td>
    </tr>
    <tr class="bggreyl">
     <td ><img src="/P/imagesnew/zero.gif" width="8" height="20"></td>
     <td class="mediumblack"><span class= "blacklinku">~if $company`<a href="~$SITE_URL`/infovision/contacts_made_received.php?self_profileid=~$profileid`&flag=I&type=R&company=~$company`&cid=~$cid`" target="_blank">~else`<a href="~$SITE_URL`/crm/contacts_made_received.php?checksum=~$CHECKSUM`&flag=I&type=R&company=~$company`">~/if` Awaiting Response </a></span><BR>&nbsp;<img src="/P/imagesnew/open.gif" alt="Contact Member">~if $NUM_NEW_CONTACTS`<span class="mediumred">&nbsp;(~$NUM_NEW_CONTACTS`) new</span>~/if` <BR> Awaiting Response (Filtered)   
     </td>
     <td class="mediumblackb">~$RECEIVED_I` <BR>~$RECEIVED_I_A` <BR> ~$RECEIVED_II_FF`</td>
     <td>&nbsp;</td>
     <td class="mediumblack"><span class= "blacklinku">~if $company`<a href="~$SITE_URL`/infovision/contacts_made_received.php?self_profileid=~$profileid`&flag=I&type=M&company=~$company`&cid=~$cid`" target="_blank">~else`<a href="~$SITE_URL`/crm/contacts_made_received.php?checksum=~$CHECKSUM`&flag=I&type=M&company=~$company`">~/if`Of which no response </a></span>&nbsp;<img src="/P/imagesnew/open.gif" alt="Contact Member"><BR><BR> Viewed: ~$MADE_I-$MADE_D_R` &nbsp;&nbsp;&nbsp; Not viewed:~$MADE_D_R` </td>
     <td class="mediumblackb">~$MADE_I` </td>
    </tr>
    <tr class="bggrey">
     <td class="mediumblack"><img src="/P/imagesnew/zero.gif" width="8" height="20"></td>
     <td class="mediumblack"><span class= "blacklinku">~if $company`<a href="~$SITE_URL`/infovision/contacts_made_received.php?self_profileid=~$profileid`&flag=A&type=R&company=~$company`&cid=~$cid`" target="_blank">~else`<a href="~$SITE_URL`/crm/contacts_made_received.php?checksum=~$CHECKSUM`&flag=A&type=R&company=~$company`">~/if`Of which you accepted </a></span>&nbsp;<img src="/P/imagesnew/ac.gif" alt="Contact Accepted"></td>
     <td class="mediumblackb">~$RECEIVED_A` </td>
     <td >&nbsp;</td>
     <td class="mediumblack"><span class= "blacklinku">~if !$company`<a href="~$SITE_URL`/crm/contacts_made_received.php?checksum=~$CHECKSUM`&flag=A&type=M&company=~$company`">~else`<a href="~$SITE_URL`/infovision/contacts_made_received.php?self_profileid=~$profileid`&flag=A&type=M&company=~$company`&cid=~$cid`" target="_blank">~/if`Of which accepted </a></span>&nbsp;<img src="/P/imagesnew/ac.gif" alt="Contact Accepted"></td>
     <td class="mediumblackb">~$MADE_A` </td>
    </tr>
    <tr class="bggreyl">
     <td><img src="/P/imagesnew/zero.gif" width="8" height="20"></td>
     <td class="mediumblack"><span class= "blacklinku">~if !$company`<a href="~$SITE_URL`/crm/contacts_made_received.php?checksum=~$CHECKSUM`&flag=D&type=R&company=~$company`">~else` <a href="~$SITE_URL`/infovision/contacts_made_received.php?self_profileid=~$profileid`&flag=D&type=R&company=~$company`&cid=~$cid`" target="_blank">~/if`Of which you declined </a></span>&nbsp;<img src="/P/imagesnew/rj.gif" alt=""></td>
     <td class="mediumblackb">~$RECEIVED_D` </td>
     <td>&nbsp;</td>
     <td class="mediumblack"><span class= "blacklinku">~if !$company`<a href="~$SITE_URL`/crm/contacts_made_received.php?checksum=~$CHECKSUM`&flag=D&type=M&company=~$company`">~else`<a href="~$SITE_URL`/infovision/contacts_made_received.php?self_profileid=~$profileid`&flag=D&type=M&company=~$company`&cid=~$cid`" target="_blank"> ~/if`Of which declined </a></span>&nbsp;<img src="/P/imagesnew/rj.gif" alt=""></td>
     <td class="mediumblackb">~$MADE_D` </td>
    </tr>
    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Profile Length</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$PROFILELENGTH`</td>
    </tr>
    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Login Frequency</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$LOGIN_FREQ`</td>
    </tr>
    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Contacts Viewed Frequency</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$CONTACT_VIW_FREQ`</td>
    </tr>
<!-- New data records -->
    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Free members contacted by you</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$contacted_free_profiles`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Free members accepted by you</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$accepted_free_profiles`</td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Total Acceptances</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$RECEIVED_A+$MADE_A`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Mobile Usage in the last one month</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$mobile_usage`</td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Total EOIs</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$RECEIVEDSUM+$MADESUM`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">EOIs sent to you versus your profile viewed</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~if $eoi_versus_viewed` ~$eoi_versus_viewed`% ~else` 0 ~/if`</td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">EOIs sent through auto-apply </td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$eoiSent_autoApply`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">EOIs received through auto-apply</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$eoiReceived_autoApply`</td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Discount Applicable</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~if $vdiscount` ~$vdiscount` ~else` 0 ~/if`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Discount valid till</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~if $edate_discount` ~$edate_discount`  ~/if` </td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Last Discount Applicable</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~if $last_vdiscount` ~$last_vdiscount`% ~else` 0 ~/if`</td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Renewal Discount Applicable</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~if $variableRenewalDiscount` ~$variableRenewalDiscount`% ~else` 0 ~/if`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Last Discount valid till</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~if $last_edate_discount` ~$last_edate_discount`  ~/if` </td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Photo Request Received</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$PHOTO_CNT`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Horoscope Request Received</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$HOROSCOPE_CNT`</td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Photo uploaded count</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$photo_upload`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Phone verification status</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">
        ~if $mob1_status eq 'Y'`
                Mobile 1
        ~/if`
        ~if $mob2_status eq 'Y'`
                ~if $mob1_status eq 'Y'`, ~/if`
                 Mobile 2       
        ~/if`
        ~if $landl_status eq 'Y'`
                ~if $mob1_status eq 'Y' || $mob2_status eq 'Y'` , ~/if`
                Landline 
        ~/if`
        ~if $mob1_status eq 'Y' || $mob2_status eq 'Y' || $landl_status eq 'Y'`
                Verified
        ~else`
                Not verified
        ~/if`
     </td>
    </tr>

    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Email status</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">
	~if $email_status eq 'Y'`
		Verified
	~elseif $email_status eq 'B'`
		Bounced Email: ~$HISEMAIL`
	~else`
		Not Verified
	~/if`
     </td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Address verification status</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">
	~if $addr_status eq 'Y'`
		Verified
	~else`
		Not Verified
	~/if`
     </td>
    </tr>
    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Messenger ID</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">
	~if $messenger_id eq 'G'`
		Present (Gtalk id)
	~elseif $messenger_id eq 'O'`
		Present (Other id)
	~else`	
		Not Present
	~/if`
     </td>
    </tr>

<!--
~if $sugar_username`
    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Profile handler name</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$sugar_username`</td>
    </tr>
~/if`
-->

<!-- New data records Ends -->

~if $show_score eq 1`
    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Profile source</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$SOURCE`</td>
    </tr>

    <tr class="bggrey">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">User Score</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$SCORE`</td>
    </tr>
~/if`
~if $an_show_score eq 1`
    <tr class="bggreyl">
     <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20">Analytics Score</td>
     <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20">~$ANALYTIC_SCORE`</td>
    </tr>
~/if`
     <tr class="bggrey" width="100%">
      <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20"/>Eligible for Free Response Booster</td>
      <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20"/><font color="red" >~$eligibleForRB`</font></td>
     </tr>
~if $remainingContacts`    
     <tr class="bggreyl" width="100%">
      <td class="mediumblack" colspan="4"><img src="/P/imagesnew/zero.gif" width="8" height="20"/>Number of Direct Contacts Remaining</td>
      <td class="mediumblackb" colspan="3"><img src="/P/imagesnew/zero.gif" width="8" height="20"/>~$remainingContacts`</font></td>
     </tr>
~/if`


        <!--
        <a href=# onClick=\"window.open('~$SITE_URL`/crm/extraDetails_profile.php?cid=~$cid`&table_name=~$table_name`&paid_str=~$paid_str`&checksum=~$CHECKSUM`','','fullscreen=1,resizable=1,scrollbars=1');\">Exta Info of the profile Stats (Click here)</a>
        -->

   </table>

<br>
</td>
 </tr>
</table>

<link rel="stylesheet" href="~sfConfig::get('app_img_url')`/jsadmin/jeevansathi.css" type="text/css">
~include_partial('global/header')`
<br><br>
<table width="70%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr class="formhead" align="center" width="100%">
        <td colspan="3"  height="30">
            <font size=3>FOLLOWUP STATUS</font>
        </td>
    </tr>
   
    <tr>
    <form name="followupStatus" method="post" action="~sfConfig::get('app_site_url')`/operations.php/jsexclusive/submitFollowupStatus" enctype="multipart/form-data">
    <table width="50%" border="0" align="center" cellpadding="4" cellspacing="4">
        ~if $serviceDay neq 'NA' AND $serviceDay neq ''`
        <tr><td>Service Day Currently Selected: ~$serviceDay`</td></tr>
        <tr><td>Service Day Was last updated on: ~$serviceDaySetDate`</td></tr>
        ~/if`
        <tr class="fieldsnew">
            <td>
                Status:
            </td>
            <td>
                <select name="status" id="status">
                    <option value="Y">Confirm</option>
                    <option value="N">Decline</option>
                    <option value="F">Followup</option>
                </select>
            </td>
        </tr>
        <tr class="fieldsnew">
            <td>
                Reason:
            </td>
            <td>
                <select name="reason" id="reason">
                    <option value="Will check profile">Will check profile</option>
                    <option value="Not decided yet">Not decided yet</option>
                    <option value="RNR/Switched off">RNR/Switched off</option>
                    <option value="Others">Others</option>
                </select>
            </td>
        </tr>
        <tr class="fieldsnew">
            <td>
                Reason text:
            </td>
            <td>
                <input type="text" id="reasonText" value="">
            </td>
        </tr>
        <tr class="fieldsnew">
            <td class="label">
                Set date:
            </td>
            <td class="fieldsnew">
            <input id="date1" type="text" value="">
        </td>
        </tr>
        <tr></tr><tr></tr>
    </table>
    <table width="50%" border="0" align="center" cellpadding="4" cellspacing="4">
        <tr>
            <td><br><br>
                NOTE:
                <br>
                **You will not be able to change this after leaving this page.<br>
                **The number in the parenthesis indicates clients already having their service day set as that day itself.
            </td>
        </tr>
    </table>
   
</form>
</tr>
</table>
~include_partial('global/footer')`
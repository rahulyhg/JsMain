<script>
function change(click)
{
	if(click == 1)
	{
        	document.getElementById("create").style.display = "block";
		document.getElementById("upload").style.display = "none";
        	document.getElementById("topText").style.display = "block";
	}
	if(click == 2)
	{
		document.getElementById("create").style.display = "none";
		document.getElementById("upload").style.display = "block";
        	document.getElementById("topText").style.display = "none";
	}
}
function feed_astrodata(theURL,winName,features)
        {
                var docF=document.form1;
                if(docF.display_horo.checked)
                {
                        if(document.getElementById)
                        {
                                document.getElementById("frame_show").style.display = 'block';
                                document.getElementById("show_hide_buttons").style.display = 'none';
                                document.getElementById("hide_compul_field").style.display = 'none';
                        }
                        document.getElementById('astro_data').style.display="none";
                        var astro_detail = document.getElementById('astro_data_fed');
                        astro_detail.value='Y';
                }
                else
                {
                        if(document.getElementById("frame_show"))
                        {
                                document.getElementById("frame_show").style.display = 'none';
                                document.getElementById("show_hide_buttons").style.display = 'block';
                                document.getElementById("hide_compul_field").style.display = 'block';
                        }
                        document.getElementById('astro_data').style.display="block";
                        docF.Country_Birth.disabled=false;
                        docF.City_Birth.disabled=false;
                        docF.Hour_Birth.disabled=false;
                        docF.Min_Birth.disabled=false;
                }
        }
	function showform()
        {
                var docF=document.form1;

                if (document.getElementById)
                {
                        if (docF.display_horo.checked)
                        {
                                docF.Country_Birth.disabled=true;
                                docF.City_Birth.disabled=true;
                                docF.Hour_Birth.disabled=true;
                                docF.Min_Birth.disabled=true;
                        }
                        else
                        {
                                docF.Country_Birth.disabled=false;
                                docF.City_Birth.disabled=false;
                                docF.Hour_Birth.disabled=false;
                                docF.Min_Birth.disabled=false;
                        }
                }
        }
        function disable_minutes()
        {
                var docF = document.form1;
                if(docF.Hour_Birth.value=="")
                        docF.Min_Birth.disabled = true;
                else
                        docF.Min_Birth.disabled = false;
        }
function show_loader()
{
	document.getElementById("horo_iframe").style.display="none";
	document.getElementById("horo_loader").style.display="inline";
}
function horo(a)
{
	if(a=='OK')
	{
		document.getElementById("horo_loader").style.display="none";
		document.getElementById("horo_message").style.display="block";
		document.getElementById("horo_iframe").style.display="none";
		document.getElementById("horo_error_message").style.color="#000000";
	}
	else if(a=="ERROR")
	{
		document.getElementById("horo_loader").style.display="none";
		document.getElementById("horo_iframe").style.display="inline";
		document.getElementById("horo_error_message").style.color="red";
		show_horo_section();
	}
}
function show_horo_section()
{
	var site="~$SITE_URL`/profile/horoscope_browse.php"
	document.getElementById("horo_message").style.display="none";
	document.getElementById("horo_section").style.display="inline";
	document.getElementById("horo_iframe").style.display="inline";
	document.getElementById("horo_iframe").src=site;
}
function closeLayer()
{
        window.location ="~$SITE_URL`/profile/editProfile?ownview=1&checksum=~$CHECKSUM`&profilechecksum=~$PROFILECHECKSUM`&from_horo_layer=1";
}
</script>
<input type="hidden" name="pchecksum" value="~$profilechecksum`">
<div class="edit_scrollbox2_1 ">
<div id="topText">
<div class="t12 b">Please provide your birth details so that we can show you Kundli matches.</div>
<div class = "clr_8"></div>
</div>
<div class="t12 b"><input id="horo_section" type="radio" class="chbx" name="horo" style="vertical-align:middle" ~if $nextLayer eq 'C'`checked~/if` onClick="change(1);">
Let Jeevansathi create your Horoscope</div>
<div id="create" style="display:none;">
<div id="frame_show" style="display:block;width:95%"><iframe vspace="0" hspace="0" marginheight="0" marginwidth="0" width="560" height="250" frameborder="0" scrolling="no" src="http://vendors.vedic-astrology.net/cgi-bin/JeevanSathi_DataEntry_Matchstro.dll?BirthPlace?JS_UniqueID=~$js_UniqueID`&JS_Year=~$BIRTH_YR`&JS_Month=~$BIRTH_MON`&JS_Day=~$BIRTH_DAY`"></iframe></div><div id="frame_show_edit" style="display:none"><iframe vspace="0" hspace="0" marginheight="0" marginwidth="0" width="570" height="250" frameborder="0" scrolling="no" src="http://vendors.vedic-astrology.net/cgi-bin/JeevanSathi_DataEntry_Matchstro.dll?BirthPlace?js_UniqueID=~$js_UniqueID`&js_year=~$BIRTH_YR`&js_month=~$BIRTH_MON`&js_day=~$BIRTH_DAY`"></iframe></div></div><br>
<div id = "upload_section">
<div style=" float:left;padding:15px 4px 10px 4px; font:bold 24px verdana,arial; color:#999999">OR</div>
<br><br><br><br>
<div class="t12 b"><input type="radio" class="chbx" name="horo" style="vertical-align:middle" onClick="change(2);" ~if $nextLayer eq 'U'`checked~/if`>
Upload your digitally scanned horoscope</div>
<div class="spacer">&nbsp;</div>
<div id="upload" style="display:none;">
        <div class="lftflow pad2" style="width:350px; border:1px solid #9E9E9E; background-color:#F2F2F2; background-image:url(~$IMG_URL`/profile/ser4_images/bgpay_1.gif)">
        <div class="bele pad4"><b>Browse and upload a digitally scanned  horoscope</b></div>
        <div class="bele pad4" style="display:none" id="horo_loader"><img align="absmiddle" src="~$IMG_URL`/profile/images/registration_revamp_new/loader_big.gif"/> Uploading Your Horoscope...</div>
	<iframe name="horo_iframe" id="horo_iframe" src="~$SITE_URL`/profile/horoscope_browse.php" scrolling='no' height="53" width="350" style="display:inline;background-color:#F5F5F5;" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0"></iframe>
	<div style="display:none" id="horo_message">Your horoscope has been uploaded.</div>
    <!--    <div class="bele pad4"><input type="file" name="horoscope"><input type="submit" name="submitted" class="gray_btn" value="upload" style="height:22px;margin-left:70px"></div>-->
        </div>
	<div class="spacer">&nbsp;</div>
	<div class="bele" id="horo_error_message">
	Image file size should not be more than 4MB. Image format should be &nbsp;.gif/.jpeg/.jpg
	</div>
</div>
</div>	
</div>
<script type="text/javascript">
~if $sf_request->getParameter('subheader') eq 1`
	document.getElementById("upload_section").style.display="none";
~/if`
~if $nextLayer eq 'C'`
	change(1);
~elseif $nextLayer eq 'U'`
	change(2);
~/if`
</script>

/*sends assign/unassign request to api
*@param : params
*/
function sendExMemAllocationRequest(params)
{
	var url = "/operations.php/crmAllocation/handleExMemAllocationApi";
	var postParams ={'profileDetails':params,'sendAssignMailer':true,'sendAssignSMS':true},exAction=params["exAction"];
	$.ajax({
		url: url,
		dataType: 'json',
		type: 'POST',
		data: postParams,
		timeout: 60000,
		cache: false,
		beforeSend: function( xhr ) 
		{  
			//console.log(postParams);
			$("#mainExContent").addClass("jsc-disabled"); 
			showLineLoader();            		
		},
		success: function(response) 
		{
			$("#exRow"+params["profile"]).remove();
			$("#mainExContent").removeClass("jsc-disabled");
			hideLineLoader();
		},
		error: function(xhr) 
		{
			$("#mainExContent").removeClass("jsc-disabled");
			hideLineLoader();
			alert("Something went wrong,please try again for "+params["username"]);
		}
	});
	return false;
}

$(document).ready(function() {
	//bind click action on assign/unassign actions
 $(".jsc-ExAllocate").bind('click', function() {
 	var dataArr = ($(this).attr("data")).split(",");
 	var params={},validRequest=true,assigned_to;
 	params["profile"] = dataArr[0];
 	params["username"] = dataArr[1];
 	params["phone"] = dataArr[2];
 	params["exAction"] = dataArr[3];
 	if(params["exAction"]=="ASSIGN")
 	{
 		assigned_to = $("#ASSIGN"+params["profile"]).find('select').val();
 		params["executiveDetails"] = executivesdata[parseInt(assigned_to)];
 		if(assigned_to=="")
 		{
 			validRequest=false;
 			alert("Please select any executive before clicking on ASSIGN");
 		}
 	}
 	else
 	{
 		params["executiveDetails"]=null;
	} 
 	if(validRequest==true)
 		sendExMemAllocationRequest(params);
 });
});
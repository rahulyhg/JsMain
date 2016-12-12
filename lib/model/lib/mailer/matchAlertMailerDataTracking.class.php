<?php

class matchAlertMailerDataTracking
{
	
	//This function is used to insert data for count of profiles based on logic level
	public function insertCountDataByLogicLevel($countByLogicArr)
	{		
		$todayDate = date("Y-m-d");
		$countByLogicObj = new MATCHALERT_TRACKING_MATCH_ALERT_DATA_BY_LOGIC('newjs_master');
		$rowCount = $countByLogicObj->insertCountByLogicTypeForDate($todayDate,$countByLogicArr);
		if($rowCount == 0)
		{
			$this->sendSMS(MatchAlertDataLoggingEnums::$messageByLogic);
		}

		//This is called to save the total count of profiles grouped by logic level
		$this->insertTotalCountByLogicLevel($todayDate);
		unset($countByLogicObj);		
	}

	//This function is used to insert data for count of profiles based on logic level and no of recommendations
	public function insertCountDataByLogicLevelAndRecommendation($countByLogicAndRecommendations)
	{		
		$todayDate = date("Y-m-d");
		$loggingObj = new MATCHALERT_TRACKING_MATCH_ALERT_DATA_BY_LOGIC_RECOMMEND('newjs_master');
		$rowCount = $loggingObj->insertCountByLogicTypeAndRecommendForDate($todayDate,$countByLogicAndRecommendations);				
		if($rowCount == 0)
		{
			$this->sendSMS(MatchAlertDataLoggingEnums::$messageByLogicRecommend);
		}
		unset($loggingObj);		
	}
	
    public function insertTotalCountByLogicLevel($todayDate)
    {
    	$matchAlertsToBeSentObj = new matchalerts_MATCHALERTS_TO_BE_SENT();
		$totalCount = $matchAlertsToBeSentObj->getTotalCount($todayDate);		
		$matchAlertByLogicTotalObj = new MATCHALERT_TRACKING_MATCH_ALERT_BYLOGIC_TOTAL('newjs_master');
		$rowCount = $matchAlertByLogicTotalObj->insertTotalCountForDate($todayDate,$totalCount);
		if($rowCount == 0)
		{
			$this->sendSMS(MatchAlertDataLoggingEnums::$messageByLogicTotal);
		}		
		unset($matchAlertByLogicTotalObj);
		unset($matchAlertsToBeSentObj);
    }

    public function insertTotalCountGroupedByLogicAndReceiver($totalCountByLogicReceiver,$distinctIdZeroArr)        
    {    	
    	$todayDate = date("Y-m-d");    	
    	foreach($totalCountByLogicReceiver as $key=>$val)
    	{
    		foreach($val as $k1=>$v1)
    		{
    			if($k1 == "RECEIVER")
    			{
    				if(in_array($v1,$distinctIdZeroArr))
    				{
    					unset($distinctIdZeroArr[$v1]);
    				}
    			}
    			if($k1=="TOTALCOUNT")
    			$totalCountArr[$v1]++;
    		}
    	}
    	$totalCountArr[0]= count($distinctIdZeroArr);    	
    	$totalCountObj = new MATCHALERT_TRACKING_MATCH_ALERT_DATA_BY_LOGIC_RECOMMEND_TOTAL('newjs_master');
		$rowCount = $totalCountObj->insertTotalCountForRecommedByDate($totalCountArr,$todayDate);
		if($rowCount == 0)
		{
			$this->sendSMS(MatchAlertDataLoggingEnums::$messageByLogicRecommendTotal);
		}
		unset($totalCountObj);
    }

    public function sendSMS($message)
    {
    	include(JsConstants::$docRoot."/commonFiles/sms_inc.php");
    	foreach(MatchAlertDataLoggingEnums::$arrMob as $mobile1)
				$smsState = send_sms($message,MatchAlertDataLoggingEnums::$from,$mobile1,MatchAlertDataLoggingEnums::$uniqueId,'','Y');
    }	
}
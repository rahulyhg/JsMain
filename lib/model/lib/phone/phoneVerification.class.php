<?php


class phoneVerification{
	
protected $phoneType;
protected $phone;
protected $isd;
protected $profileObject;
protected $phoneWithoutIsd;
protected $isVerified;
public function __construct($profileObject='',$phoneType)
{

 			if (!$phoneType || !$profileObject ) 
 			{	throw new Exception("phoneType or profileObj not passed", 1);
				
			}

			$this->phoneType=$phoneType;
			$this->profileObject=$profileObject;
			if (!$this->profileObject->getPROFILEID())
 				throw new Exception("profileObject not passed correctly", 1);

			
			switch ($this->phoneType) {
				
				case 'M':
					$phone=$profileObject->getPHONE_MOB();
					$this->isVerified=$profileObject->getMOB_STATUS();
					$this->isd=$this->profileObject->getISD();

				break;

				case 'L':
					$phone=$profileObject->getPHONE_WITH_STD();
					$this->isVerified=$profileObject->getLANDL_STATUS();
					$this->isd=$this->profileObject->getISD();

				break;	
				
				case 'A':		
					$contactNumOb=new newjs_JPROFILE_CONTACT();
               		$numArray=$contactNumOb->getArray(array('PROFILEID'=>$profileObject->getPROFILEID()),'','',"ALT_MOBILE,ALT_MOB_STATUS,ALT_MOBILE_ISD");
               		if($numArray['0']['ALT_MOBILE'])
               		{
						$phone=$numArray['0']['ALT_MOBILE'];
						$this->isVerified=$numArray['0']['ALT_MOB_STATUS']=='Y'?'Y':'N';
						$this->isd=$this->profileObject->getISD();
						
					}


				break;

				default:
				throw new Exception("phoneType not among the three", 1);
				break;
			}

				$phone=trim(ltrim($phone,'0'));
				$this->phoneWithoutIsd=$phone;
				$this->phone=($this->isd).$phone;
 
        }


        public function getPhoneType(){return $this->phoneType;}
        public function getPhone(){return $this->phone;}
        public function getPhoneWithoutIsd(){return $this->phoneWithoutIsd;}
        public function isVerified(){return $this->isVerified;}

protected function phoneUpdateProcess($message)
	{
			if(!$this->getPhone()) return false;
			include_once(sfConfig::get("sf_web_dir")."/P/InstantSMS.php");

			$profileid=$this->profileObject->getPROFILEID();
			$profileObject=$this->profileObject;
			switch ($this->phoneType)
			{		

				case 'M':
				$paramArr=array('MOB_STATUS'=>'Y','PHONE_FLAG'=>'');
				JPROFILE::getInstance('')->edit($paramArr, $profileid, 'PROFILEID');
				break;

				case 'L':
				$paramArr=array('LANDL_STATUS'=>'Y','PHONE_FLAG'=>'');
				JPROFILE::getInstance('')->edit($paramArr, $profileid, 'PROFILEID');
				break;

				case 'A':
				$paramArr=array('ALT_MOB_STATUS'=>'Y');
				$contactObj=new NEWJS_JPROFILE_CONTACT();
				$contactObj->update($profileid,$paramArr);
				break;
			}

			$this->profileObject->getDetail($profileid,'PROFILEID');
			$verifiedLogObj= new PHONE_VERIFIED_LOG();
			$row=$verifiedLogObj->getNoOfTimesVerified($profileid);
			$noOfTimesVerified=$row['COUNT'];

			$this->sendMailerAfterVerification($noOfTimesVerified);
			$this->trackingAfterVerification($noOfTimesVerified);

			$this->sendSMSAfterVerification();
			$this->sendMembershipOffers();




			$reportInvalidObj=new JSADMIN_REPORT_INVALID_PHONE();
			$reportInvalidObj->updateAsVerified($profileid);

			$incentiveObj=new incentive_MAIN_ADMIN_POOL();
			$incentiveObj->setTimesTriedZero($profileid);

           	$jsadminObj=new jsadmin_OFFLINE_MATCHES();
           	$jsadminObj->updateCategory($profileid,'6');

			$phoneLogObj= new PHONE_VERIFIED_LOG();
			$phoneLogObj->insertEntry($profileid,$this->getPhoneType(), $this->getPhone(),$message);
			
			try
			{
				Duplicate::logIfDuplicate($this->profileObject,$this->phone);            
			}
			catch(PDOException $e)
			{
				jsCacheWrapperException::logThis($e);
			}

			JsMemcache::getInstance()->set($profileid."_PHONE_VERIFIED",'Y');
		
			
			return true;	
	}


public function sendSMSAfterVerification() {
			
			$sms=new InstantSMS("PHONE_VERIFY",$this->profileObject->getPROFILEID());
			$sms->send();
}



public function sendMailerAfterVerification($noOfTimesVerified) {
			
			$activated =$this->profileObject->getACTIVATED();
			$profileid=$this->profileObject->getPROFILEID();

			
			if($noOfTimesVerified==0 && $activated=="Y")
			CommonFunction::sendWelcomeMailer($profileid);
}


public function trackingAfterVerification($noOfTimesVerified) {



			$profileid=$this->profileObject->getPROFILEID();
           
           	if($noOfTimesVerified==0) 
			RegChannelTrack::insertPageChannel($profileid,PageTypeTrack::_PHONEVERIFIED); 

			$memObj=JsMemcache::getInstance();
			$showConsentMsg=$memObj->get('showConsentMsg_'.$profileid);
			if (!$showConsentMsg)
			{
				$showConsentMsg=JsCommon::showConsentMessage($profileid)? 'Y':'N';
			}
			if ($showConsentMsg=='Y')
			{
			JsCommon::insertConsentMessageFlag($profileid);
			}


			if (JsCommon::showDuplicateNumberConsent($profileid))
			{
			
			$duplicateObj=new newjs_DUPLICATE_NUMBER_CONSENT();
			$duplicateObj->setConsentStatus($profileid);

			}



			

}



public function sendMembershipOffers(){

			$profileid=$this->profileObject->getPROFILEID();
			$mobileAppRegObj =new MOBILE_API_REGISTRATION_ID('newjs_slave');
			$appRegProfile =$mobileAppRegObj->appRegisteredProfile($profileid);
				
			if($appRegProfile)
			{
		    $loginTrackingObj=new MIS_LOGIN_TRACKING('newjs_slave');
            $profileArr      =$loginTrackingObj->getLast7DaysLoginProfiles($profileid);
			}
			
			if($appRegProfile && count($profileArr)>0){
				$notificationKey='BUY_MEMB';
				$smsMemb 	= new InstantSMS("$notificationKey",$profileid);
				$message 	=$smsMemb->getSmsMessage();
				if($message){
					$messageArr 	=explode("Choose",$message);
					$actualMsg 	=$messageArr[0]."Choose your plan now.";

					// Send Notification
					$instantNotificationObj =new InstantAppNotification($notificationKey);	
					$instantNotificationObj->sendNotification($profileid,'',$actualMsg);
				}
			}
			else{		
				$smsMemb = new InstantSMS("BUY_MEMB",$profileid);
				$smsMemb->send();
			}

}


static public function hidePhoneVerLayer($profileObj)
{

	if (!$profileObj) throw new Exception("no profile object passed", 1);

	if($profileObj->getENTRY_DT() < DateConstants::PhoneMandatoryLive) return 'Y';		
	if($profileObj->getMOB_STATUS()=='Y' || $profileObj->getLANDL_STATUS()=='Y' )
	return 'Y';

	$contactNumOb=new newjs_JPROFILE_CONTACT();
	$numArray=$contactNumOb->getArray(array('PROFILEID'=>$profileObj->getPROFILEID()),'','',"*");
    if($numArray['0']['ALT_MOB_STATUS']=='Y')
    return 'Y';

	return 'N';
 
} 


public function savePhone($phoneNo,$std='',$isd='')
{
       
	$this->entryInDuplcationCheckOnEdit();
    $this->JPROFILE = JPROFILE::getInstance($dbname);
    $phoneType=$this->phoneType;
	$timeNow=(new DateTime)->format('Y-m-j H:i:s');

	if($phoneType=='M'){
		$val=$isd."-".$phoneNo;
		$this->contact_archive('PHONE_MOB',$val);
		
		$fieldArr['PHONE_FLAG']='';
		$fieldArr['MOB_STATUS']='N';
		$fieldArr['MOD_DT']=$timeNow;
		$fieldArr['PHONE_MOB']=$phoneNo;
		$fieldArr['ISD']=$isd;
		$this->JPROFILE->edit($fieldArr, $this->profileObject->getPROFILEID(), 'PROFILEID');
		Flag::removeFlag("PHONEMOB");
	}
	elseif($phoneType=='L'){
		if($phoneNo!='')
			$phone_std =$std.$phoneNo;	
		if($phoneNo=="")
			$phone_std="";
		$val=$isd."-".$std."-".$phoneNo;
		$this->contact_archive('PHONE_RES',$val);
		

		$fieldArr['PHONE_FLAG']='';
		$fieldArr['LANDL_STATUS']='N';
		$fieldArr['MOD_DT']=$timeNow;
		$fieldArr['PHONE_RES']=$phoneNo;
		$fieldArr['ISD']=$isd;
		$fieldArr['STD']=$std;
		$fieldArr['PHONE_WITH_STD']=$phone_std;
		$this->JPROFILE->edit($fieldArr, $this->profileObject->getPROFILEID(), 'PROFILEID');
		Flag::removeFlag("PHONERES");
		
	}
	elseif($phoneType=='A'){
		$val=$isd."-".$phoneNo;
		$this->contact_archive('PHONE_ALT',$val);
        

		$jprofileContactArr['ALT_MOBILE']=$phoneNo;
		$jprofileContactArr['ALT_MOB_STATUS']='N';
		$jprofileContactArr['ALT_MOBILE_ISD']=$isd;

		$contactObj=new NEWJS_JPROFILE_CONTACT();
		$contactObj->update($this->profileObject->getPROFILEID(),$jprofileContactArr);

        $fieldArr['MOD_DT']=$timeNow;
		$fieldArr['PHONE_FLAG']='';
		$fieldArr['HAVE_JCONTACT']='Y';
		$this->JPROFILE->edit($fieldArr, $this->profileObject->getPROFILEID(), 'PROFILEID');

		}
	
	JsMemcache::getInstance()->delete($profileid."_PHONE_VERIFIED",$value);
	$ob=new INVALID_PHONE();
	$ob->deleteEntry($profileid);
	$action = FTOStateUpdateReason::NUMBER_UNVERIFY;
	SymfonyFTOFunctions::updateFTOState($profileid,$action);
}



public function contact_archive($field="",$val="")
{
	$profileid=$this->profileObject->getPROFILEID();
	$contactArchiveDbObj=new NEWJS_CONTACT_ARCHIVE();
                $ip=FetchClientIP();
                if(strstr($ip, ",")){
                        $ip_new = explode(",",$ip);
                        $ip = $ip_new[1];
                }

                if($field=="PHONE_RES")
                {
                        $ph_row=$this->isd()."-".$this->profileObject->getSTD()."-".$this->profileObject->getPHONE_RES();
                        if($ph_row!=$val)
                        {
                                $ph_arr=explode("-",$val);
                                if($ph_arr[2]=='')
                                        $val='';
                        }
                        $old_val="";
                        if($this->profileObject->getPHONE_RES())
                                $old_val =$ph_row;
                }
                else if($field=="PHONE_ALT" || $field=="PHONE_MOB") 
                {
                        $alt_row=$this->isd."-".$this->phoneWithoutIsd;
                        if($alt_row!=$val)///ALT_MOBILE, ALT_MOBILE_ISD
                        {
                                $alt_arr=explode("-",$val);
                                if($alt_arr[1]=='')
                                        $val='';
                        }
                        $old_val ="";
                        if($this->phoneWithoutIsd)
                        $old_val =$alt_row;

                }
                if($row_search=$contactArchiveDbObj->fetchData($profileid,$field))
                {
                		$old_val=addslashes(stripslashes($old_val));
                        $val=addslashes(stripslashes($val));
                        $changeid=$row_search['CHANGEID'];
                        (new CONTACT_ARCHIVE_INFO())->insert($changeid,$ip,$val,$old_val); 
                }
               else
               {
                        $contactArchiveDbObj->insert($profileid,$field);
                        $tempRow=$contactArchiveDbObj->fetchData($profileid,$field);
                        $changeid=$tempRow['CHANGEID'];
                       	(new CONTACT_ARCHIVE_INFO())->insert($changeid,$ip,$val,$old_val);
               }
}



public function entryInDuplcationCheckOnEdit()
{
		switch ($this->phoneType)
		{
			case 'M':
			$phoneType='phone_mob';
			break;

			case 'A':
			$phoneType='alt_mobile';
			break;

			case 'L':
			$phoneType='phone_res';
			break;
		}
        $symfonyFilePath=realpath($_SERVER['DOCUMENT_ROOT']."/../");
        $storeOb=new duplicates_DUPLICATE_CHECKS_FIELDS();
        $dup_flag_value=$storeOb->get_from_duplication_check_fields($profileid);
        if($dup_flag_value){
                if($dup_flag_value[TYPE]=='NEW')
                        $to_not_update_dup=true;
                else
                        $dup_flag_value=$dup_flag_value[FIELDS_TO_BE_CHECKED];
        }
        if(!$to_not_update_dup){
                $dup_flag_value=Flag::setFlag($phoneType,$dup_flag_value,'duplicationFieldsVal');
                $storeOb->insertRetrievedEntry(LoggedInProfile::getInstance(),'edit',$dup_flag_value);
        }
}


}

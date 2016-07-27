<?php
 /*
        This is auto-generated class by running utils:profileInformationModuleCreator task
        This class should not be updated manually.
        Created on 2014-07-03
 */
class ProfileInformationModuleMap
{
        /*This declares array of  all the configurations of all the given modules*/

	public static $MYJSAPP_ANDROID_1;
	public static $MYJSAPP_IOS_1;
	public static $ContactCenterAPP;
	public static $defaultArray;
	public static $ContactCenterMYJS;
	public static $ContactCenterDesktop;
	/* This function will return configuration of given module and infoType*/
        public function getConfiguration($module,$infoType='',$type='',$version='')
        {
                self::init();
		if($type)
		{
			if(!$version)
				$version='1';
			$arrayName = $module.'_'.$type.'_'.$version;
		}
		else
			$arrayName = self::$defaultArray[$module];
		        if(isset(self::${$arrayName}))
                {
                        if($infoType=='')
                                return self::${$arrayName};
                        if(array_key_exists($infoType,self::${$arrayName}))
                                return self::${$arrayName}[$infoType];
                }
                throw new JsException("","Wrong module or infoType is given in profileInformationModuleMap.class.php");
        }

        /* This function will return the infotype(example:INTEREST_RECEIVED) based on id*/
        public static function getInfoTypeById($module,$id,$type='',$version='')
        {
                self::init();
		if($type)
                {
                        if(!$version)
                                $version='1';
                        $arrayName = $module.'_'.$type.'_'.$version;
                }
                else
                        $arrayName = self::$defaultArray[$module];
                if(isset(self::${$arrayName}))
                {
                        foreach(self::${$arrayName} as $k=>$v)
                        {
                                if($v['ID']==$id)
                                   return $k;
                        }
                }
                throw new JsException("","Wrong module or infoType is given in profileInformationModuleMap.class.php");
        }
        
	static public function init()
        {
		self::$defaultArray = Array(
			"MYJSAPP"=>"MYJSAPP_ANDROID_1",
			"ContactCenterAPP"=>"ContactCenterAPP",
			"ContactCenterMYJS" => "ContactCenterMYJS",
			"ContactCenterDesktop" => "ContactCenterDesktop"
		);
		self::$MYJSAPP_ANDROID_1=Array(
		"INTEREST_RECEIVED"=>Array( 
			"ID"=> "1",
			"APP_TYPE"=> "ANDROID",
			"VERSION"=> "1",
			"SORT_ORDER"=> "1",
			"COUNT"=> "10",
			"TUPLE"=> "NO_USERNAME_TUPLE",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "ALL",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "People to Respond to",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "responseTracking=19",
      "CONTACT_ID"=>"",
		),
		"NOT_INTERESTED"=>Array( 
			"ID"=> "10",
			"APP_TYPE"=> "ANDROID",
			"VERSION"=> "1",
			"SORT_ORDER"=> "1",
			"COUNT"=> "0",
			"TUPLE"=> "NO_USERNAME_TUPLE",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Members",
			"SUBTITLE"=> "Declined Me",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
	"NOT_INTERESTED_BY_ME"=>Array( 
			"ID"=> "11",
			"APP_TYPE"=> "ANDROID",
			"VERSION"=> "1",
			"SORT_ORDER"=> "1",
			"COUNT"=> "0",
			"TUPLE"=> "NO_USERNAME_TUPLE",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Members",
			"SUBTITLE"=> "I Declined",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
	"VISITORS"=>Array( 
			"ID"=> "2",
			"APP_TYPE"=> "ANDROID",
			"VERSION"=> "1",
			"SORT_ORDER"=> "2",
			"COUNT"=> "10",
			"TUPLE"=> "ONLY_PIC_TUPLE",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Recent Profile Visitors",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "stype=A11",
      "CONTACT_ID"=>"",
		),
		"MATCH_ALERT"=>Array( 
			"ID"=> "3",
			"APP_TYPE"=> "ANDROID",
			"VERSION"=> "1",
			"SORT_ORDER"=> "3",
			"COUNT"=> "2",
			"TUPLE"=> "NO_USERNAME_TUPLE",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Match Alerts",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "stype=A15",
      "CONTACT_ID"=>"",
		),
		"ACCEPTANCES_SENT"=>Array( 
			"ID"=> "4",
			"APP_TYPE"=> "ANDROID",
			"VERSION"=> "1",
			"SORT_ORDER"=> "100",
			"COUNT"=> "0",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Members",
			"SUBTITLE"=> "I Accepted",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"MESSAGE_RECEIVED"=>Array( 
			"ID"=> "5",
			"APP_TYPE"=> "ANDROID",
			"VERSION"=> "1",
			"SORT_ORDER"=> "100",
			"COUNT"=> "0",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"ACCEPTANCES_RECEIVED"=>Array( 
			"ID"=> "6",
			"APP_TYPE"=> "ANDROID",
			"VERSION"=> "1",
			"SORT_ORDER"=> "100",
			"COUNT"=> "0",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Members",
			"SUBTITLE"=> "Accepted Me",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"JUST_JOINED_MATCHES"=>Array( 
			"ID"=> "13",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "Y",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Just",
			"SUBTITLE"=> "Joined Matches",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"ALL_ACCEPTANCE"=>Array( 
			"ID"=> "16",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "Y",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "All",
			"SUBTITLE"=> "Acceptances",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		);
		self::$MYJSAPP_IOS_1=Array(
		"INTEREST_RECEIVED"=>Array( 
			"ID"=> "7",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "1",
			"COUNT"=> "10",
			"TUPLE"=> "SIZE_120",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "ALL",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "People to Respond to",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "ACCEPT|DECLINE",
			"TRACKING"=> "responseTracking=15",
      "CONTACT_ID"=>"",
		),
		"VISITORS"=>Array( 
			"ID"=> "8",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "2",
			"COUNT"=> "10",
			"TUPLE"=> "ONLY_PIC_TUPLE",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Recent Profile Visitors",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "stype=A11",
      "CONTACT_ID"=>"",
		),
		"MATCH_ALERT"=>Array( 
			"ID"=> "9",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "3",
			"COUNT"=> "10",
			"TUPLE"=> "SIZE_120",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Match Alerts",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "stype=WMM",
      "CONTACT_ID"=>"",
		),
		"MESSAGE_RECEIVED"=>Array( 
			"ID"=> "11",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "100",
			"COUNT"=> "0",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"ACCEPTANCES_RECEIVED"=>Array( 
			"ID"=> "12",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "100",
			"COUNT"=> "0",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Members",
			"SUBTITLE"=> "Accepted Me",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"ACCEPTANCES_SENT"=>Array( 
			"ID"=> "10",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "100",
			"COUNT"=> "0",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Members",
			"SUBTITLE"=> "I Accepted",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"JUST_JOINED_MATCHES"=>Array( 
			"ID"=> "13",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "Y",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Just",
			"SUBTITLE"=> "Joined Matches",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"ALL_ACCEPTANCE"=>Array( 
			"ID"=> "16",
			"APP_TYPE"=> "IOS",
			"VERSION"=> "1",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "Y",
			"VIEW_FLAG"=> "NEW",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "All",
			"SUBTITLE"=> "Acceptances",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		);
		self::$ContactCenterAPP=Array(
		"INTEREST_RECEIVED"=>Array( 
			"ID"=> "1",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "INBOX_EOI_APP",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "People to Respond to",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "ACCEPT|DECLINE",
			"TRACKING"=> "responseTracking=11",
      "KUNAL"=>"1",
		),
		"ACCEPTANCES_RECEIVED"=>Array( 
			"ID"=> "2",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Accepted Members",
			"SUBTITLE"=> "Accepted me",
			"ICONS"=> "",
			"BUTTONS"=> "MESSAGE|CONTACT|CANCEL",
			"TRACKING"=> "",
		),
		"ACCEPTANCES_SENT"=>Array( 
			"ID"=> "3",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Accepted Members",
			"SUBTITLE"=> "Accepted By Me",
			"ICONS"=> "",
			"BUTTONS"=> "MESSAGE|CONTACT|DECLINE",
			"TRACKING"=> "",
		),
		"MY_MESSAGE"=>Array( 
			"ID"=> "4",
			"SORT_ORDER"=> "",
			"COUNT"=> "100000",
			"TUPLE"=> "MYJS_MESSAGE_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "My Messages",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
		),
		"VISITORS"=>Array( 
			"ID"=> "5",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Recent Profile Visitors",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "INITIATE|SHORTLIST|PHOTO|CONTACT",
			"TRACKING"=> "stype=AV",
		),
		"INTEREST_SENT"=>Array( 
			"ID"=> "6",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "INBOX_VIEWED_DATE_NO_MESSAGE",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Interests Sent",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "REMINDER|CANCEL|CONTACT",
			"TRACKING"=> "",
		),
		"MATCH_ALERT"=>Array( 
			"ID"=> "7",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Match Alerts",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "INITIATE|SHORTLIST|PHOTO|CONTACT",
			"TRACKING"=> "stype=AM",
		),
		"SHORTLIST"=>Array( 
			"ID"=> "8",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "SHORTLIST_APP",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Shortlisted Profiles",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "stype=AS&responseTracking=12",
		),
		"PHOTO_REQUEST_RECEIVED"=>Array( 
			"ID"=> "9",
			"SORT_ORDER"=> "",
			"COUNT"=> "100",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Photo Request Received",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
		),
		"ACCEPTANCES_ALL"=>Array( 
			"ID"=> "13",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Accepted Members",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "MESSAGE|CONTACT",
			"TRACKING"=> "",
		),
		"NOT_INTERESTED"=>Array(
			"ID" => "10",
                        "SORT_ORDER"=> "",
                        "COUNT"=> "10",
                        "TUPLE"=> "SHORTLIST_APP",
                        "TUPLE_ORDER"=> "",
                        "ACTIVE_FLAG"=> "Y",
                        "AJAX_FLAG"=> "N",
                        "CALLOUT_MESSAGES"=> "",
                        "VIEW_ALL_LINK"=> "",
                        "TITLE"=> "Declined Members",
                        "SUBTITLE"=> "They Declined",
                        "ICONS"=> "",
                        "BUTTONS"=> "",
                        "TRACKING"=> ""
		),
                "NOT_INTERESTED_BY_ME"=>Array(
                        "ID" => "11",
                        "SORT_ORDER"=> "",
                        "COUNT"=> "10",
                        "TUPLE"=> "SHORTLIST_APP",
                        "TUPLE_ORDER"=> "",
                        "ACTIVE_FLAG"=> "Y",
                        "AJAX_FLAG"=> "N",
                        "CALLOUT_MESSAGES"=> "",
                        "VIEW_ALL_LINK"=> "",
                        "TITLE"=> "Declined Members",
                        "SUBTITLE"=> "I Declined",
                        "ICONS"=> "",
                        "BUTTONS"=> "",
                        "TRACKING"=> ""
                ),
                "FILTERED_INTEREST"=>Array( 
			"ID"=> "12",
			"SORT_ORDER"=> "",
			"COUNT"=> "10",
			"TUPLE"=> "INBOX_EOI_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Filtered Interests",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "ACCEPT|DECLINE",
			"TRACKING"=> "responseTracking=".JSTrackingPageType::FILTERED_INTEREST_ANDROID,
		),

                "CONTACTS_VIEWED"=>Array( 
                       "ID"=> "16",
                       "SORT_ORDER"=> "",
                       "COUNT"=> "10",
                       "TUPLE"=> "INBOX_EOI_APP",
                       "TUPLE_ORDER"=> "",
                       "ACTIVE_FLAG"=> "Y",
                       "AJAX_FLAG"=> "N",
                       "CALLOUT_MESSAGES"=> "",
                       "VIEW_ALL_LINK"=> "",
                       "TITLE"=> "Phonebook",
                       "SUBTITLE"=> "",
                       "ICONS"=> "",
                       "BUTTONS"=> "ACCEPT|DECLINE",
                       "TRACKING"=> "stype=".SearchTypesEnums::CONTACTS_VIEWED_ANDROID."&responseTracking=".JSTrackingPageType::CONTACTS_VIEWED_ANDROID
               ),

                "PEOPLE_WHO_VIEWED_MY_CONTACTS"=>Array( 
                       "ID"=> "17",
                       "SORT_ORDER"=> "",
                       "COUNT"=> "5",
                       "TUPLE"=> "SHORTLIST_APP",
                       "TUPLE_ORDER"=> "",
                       "ACTIVE_FLAG"=> "Y",
                       "AJAX_FLAG"=> "N",
                       "CALLOUT_MESSAGES"=> "",
                       "VIEW_ALL_LINK"=> "",
                       "TITLE"=> "Who Viewed My Contacts",
                       "SUBTITLE"=> "",
                       "ICONS"=> "",
                       "BUTTONS"=> "",
                       "TRACKING"=> "stype=".SearchTypesEnums::CONTACT_VIEWERS_ANDROID."&responseTracking=".JSTrackingPageType::CONTACT_VIEWERS_ANDROID// contact viewers
               ),

            "IGNORED_PROFILES"=>Array( 
                       "ID"=> "20",
                       "SORT_ORDER"=> "",
                       "COUNT"=> "10",
                       "TUPLE"=> "INBOX_EOI_APP",
                       "TUPLE_ORDER"=> "",
                       "ACTIVE_FLAG"=> "Y",
                       "AJAX_FLAG"=> "N",
                       "CALLOUT_MESSAGES"=> "",
                       "VIEW_ALL_LINK"=> "",
                       "TITLE"=> "Blocked Members",
                       "SUBTITLE"=> "",
                       "ICONS"=> "",
                       "BUTTONS"=> "UNBLOCK",
                       "TRACKING"=> "",
               )

		); 
self::$ContactCenterMYJS=Array(
		"INTEREST_RECEIVED_FILTER"=>Array( 
			"ID"=> "1",
			"SORT_ORDER"=> "",
			"COUNT"=> "24",
			"TUPLE"=> "INBOX_EOI_APP",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "People to Respond to",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "ACCEPT|DECLINE",
			"TRACKING"=> "responseTracking=11",
			"SOURCE"=>"ER",
		),
		"ACCEPTANCES_RECEIVED"=>Array( 
			"ID"=> "2",
			"SORT_ORDER"=> "",
			"COUNT"=> "20",
			"TUPLE"=> "SHORTLIST_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Accepted Members",
			"SUBTITLE"=> "Accepted me",
			"ICONS"=> "",
			"BUTTONS"=> "MESSAGE|CONTACT",
			"TRACKING"=> "",
			"SOURCE"=>"AR"
		),
		"MY_MESSAGE_RECEIVED"=>Array( 
			"ID"=> "4",
			"SORT_ORDER"=> "",
			"COUNT"=> "20",
			"TUPLE"=> "MYJS_MESSAGE_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "My Messages",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
			"SOURCE"=>"MR"
		),
		"VISITORS"=>Array( 
			"ID"=> "5",
			"SORT_ORDER"=> "",
			"COUNT"=> "5",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Recent Profile Visitors",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "INITIATE|SHORTLIST|PHOTO|CONTACT",
			"TRACKING"=> "stype=AV",
		),
		"MATCH_ALERT"=>Array( 
			"ID"=> "7",
			"SORT_ORDER"=> "",
			"COUNT"=> "20",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Match Alerts",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "INITIATE|SHORTLIST|PHOTO|CONTACT",
			"TRACKING"=> "stype=AM",
			"SOURCE"=>"MR"
		),
		"SHORTLIST"=>Array( 
			"ID"=> "8",
			"SORT_ORDER"=> "",
			"COUNT"=> "5",
			"TUPLE"=> "SHORTLIST_APP",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Shortlisted Profiles",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "stype=AS&responseTracking=12",
		),
		"PHOTO_REQUEST_RECEIVED"=>Array( 
			"ID"=> "9",
			"SORT_ORDER"=> "",
			"COUNT"=> "5",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Photo Request Received",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
		)

		); 
    self::$ContactCenterDesktop=Array(
		"INTEREST_RECEIVED"=>Array( 
			"ID"=> "1",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_EOI_APP",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "People to Respond to",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "ACCEPT|DECLINE",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"ACCEPTANCES_RECEIVED"=>Array( 
			"ID"=> "2",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Accepted Members",
			"SUBTITLE"=> "Accepted me",
			"ICONS"=> "",
			"BUTTONS"=> "MESSAGE|CONTACT",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"ACCEPTANCES_SENT"=>Array( 
			"ID"=> "3",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Accepted Members",
			"SUBTITLE"=> "Accepted By Me",
			"ICONS"=> "",
			"BUTTONS"=> "MESSAGE|CONTACT",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"MY_MESSAGE"=>Array( 
			"ID"=> "4",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "MYJS_MESSAGE_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "My Messages",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"VISITORS"=>Array( 
			"ID"=> "5",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Recent Profile Visitors",
			"SUBTITLE"=> "",
			"HEADING"=> "Profile Visitors",
			"CCMESSAGE"=> "These members can be your potential match, they have visited your profile in the last 15 days.",
			"ICONS"=> "",
			"BUTTONS"=> "INITIATE|SHORTLIST|PHOTO|CONTACT",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"INTEREST_SENT"=>Array( 
			"ID"=> "6",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_VIEWED_DATE",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Interests Sent",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "REMINDER|CANCEL|CONTACT",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"MATCH_ALERT"=>Array( 
			"ID"=> "7",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Match Alerts",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "INITIATE|SHORTLIST|PHOTO|CONTACT",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"SHORTLIST"=>Array( 
			"ID"=> "8",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "SHORTLIST_APP",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Shortlisted Profiles",
			"SUBTITLE"=> "",
			"HEADING"=> "Shortlisted Profiles",
			"CCMESSAGE"=> "These members can be your potential match, you had shortlisted these profiles earlier.",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"PHOTO_REQUEST_RECEIVED"=>Array( 
			"ID"=> "9",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Photo Request Received",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"PHOTO_REQUEST_SENT"=>Array( 
			"ID"=> "14",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Photo Request Sent",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"HOROSCOPE_REQUEST_SENT"=>Array( 
			"ID"=> "15",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Horroscope Request Sent",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"HOROSCOPE_REQUEST_RECEIVED"=>Array( 
			"ID"=> "18",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "TIME",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Horroscope Request Received",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"ACCEPTANCES_ALL"=>Array( 
			"ID"=> "13",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Accepted Members",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "MESSAGE|CONTACT",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),
		"NOT_INTERESTED"=>Array(
			"ID" => "10",
                        "SORT_ORDER"=> "",
                        "COUNT"=> "25",
                        "TUPLE"=> "SHORTLIST_APP",
                        "TUPLE_ORDER"=> "",
                        "ACTIVE_FLAG"=> "Y",
                        "AJAX_FLAG"=> "N",
                        "CALLOUT_MESSAGES"=> "",
                        "VIEW_ALL_LINK"=> "",
                        "TITLE"=> "Declined Members",
                        "SUBTITLE"=> "They Declined",
                        "ICONS"=> "",
                        "BUTTONS"=> "",
                        "TRACKING"=> "",
                        "CONTACT_ID"=>"",
		),
                "NOT_INTERESTED_BY_ME"=>Array(
                        "ID" => "11",
                        "SORT_ORDER"=> "",
                        "COUNT"=> "25",
                        "TUPLE"=> "SHORTLIST_APP",
                        "TUPLE_ORDER"=> "",
                        "ACTIVE_FLAG"=> "Y",
                        "AJAX_FLAG"=> "N",
                        "CALLOUT_MESSAGES"=> "",
                        "VIEW_ALL_LINK"=> "",
                        "TITLE"=> "Declined Members",
                        "SUBTITLE"=> "I Declined",
                        "ICONS"=> "",
                        "BUTTONS"=> "",
                        "TRACKING"=> "",
                        "CONTACT_ID"=>"",
                ),
                "FILTERED_INTEREST"=>Array( 
			"ID"=> "12",
			"SORT_ORDER"=> "",
			"COUNT"=> "25",
			"TUPLE"=> "INBOX_EOI_APP",
			"TUPLE_ORDER"=> "",
			"ACTIVE_FLAG"=> "Y",
			"AJAX_FLAG"=> "N",
			"CALLOUT_MESSAGES"=> "",
			"VIEW_ALL_LINK"=> "",
			"TITLE"=> "Filtered Interests",
			"SUBTITLE"=> "",
			"ICONS"=> "",
			"BUTTONS"=> "ACCEPT|DECLINE",
			"TRACKING"=> "",
      "CONTACT_ID"=>"",
		),

                "CONTACTS_VIEWED"=>Array( 
                       "ID"=> "16",
                       "SORT_ORDER"=> "",
                       "COUNT"=> "25",
                       "TUPLE"=> "SHORTLIST_APP",
                       "TUPLE_ORDER"=> "",
                       "ACTIVE_FLAG"=> "Y",
                       "AJAX_FLAG"=> "N",
                       "CALLOUT_MESSAGES"=> "",
                       "VIEW_ALL_LINK"=> "",
                       "TITLE"=> "Phonebook",
                       "SUBTITLE"=> "",
                       "ICONS"=> "",
                       "BUTTONS"=> "",
                       "TRACKING"=> "",
                       "CONTACT_ID"=>"",
               ),

                "PEOPLE_WHO_VIEWED_MY_CONTACTS"=>Array( 
                       "ID"=> "17",
                       "SORT_ORDER"=> "",
                       "COUNT"=> "25",
                       "TUPLE"=> "SHORTLIST_APP",
                       "TUPLE_ORDER"=> "",
                       "ACTIVE_FLAG"=> "Y",
                       "AJAX_FLAG"=> "N",
                       "CALLOUT_MESSAGES"=> "",
                       "VIEW_ALL_LINK"=> "",
                       "TITLE"=> "Who Viewed My Contacts",
                       "SUBTITLE"=> "",
                       "ICONS"=> "",
                       "BUTTONS"=> "",
                       "TRACKING"=> "",
                       "CONTACT_ID"=>"",
               ),

            "IGNORED_PROFILES"=>Array( 
                       "ID"=> "20",
                       "SORT_ORDER"=> "",
                       "COUNT"=> "25",
                       "TUPLE"=> "INBOX_EOI_APP",
                       "TUPLE_ORDER"=> "",
                       "ACTIVE_FLAG"=> "Y",
                       "AJAX_FLAG"=> "N",
                       "CALLOUT_MESSAGES"=> "",
                       "VIEW_ALL_LINK"=> "",
                       "TITLE"=> "Blocked Members",
                       "SUBTITLE"=> "",
                       "ICONS"=> "",
                       "BUTTONS"=> "UNBLOCK",
                       "TRACKING"=> "",
                       "CONTACT_ID"=>"",
               ),
            "INTRO_CALLS"=>Array( 
                       "ID"=> "19",
                       "SORT_ORDER"=> "",
                       "COUNT"=> "25",
                       "TUPLE"=> "INBOX_EOI_APP",
                       "TUPLE_ORDER"=> "TIME",
                       "ACTIVE_FLAG"=> "Y",
                       "AJAX_FLAG"=> "N",
                       "CALLOUT_MESSAGES"=> "",
                       "VIEW_ALL_LINK"=> "",
                       "TITLE"=> "Intro Calls",
                       "SUBTITLE"=> "",
                       "ICONS"=> "",
                       "BUTTONS"=> "REMINDER",
                       "TRACKING"=> "",
                       "CONTACT_ID"=>"",
               ),
            "INTRO_CALLS_COMPLETE"=>Array( 
                       "ID"=> "21",
                       "SORT_ORDER"=> "",
                       "COUNT"=> "25",
                       "TUPLE"=> "INBOX_EOI_APP",
                       "TUPLE_ORDER"=> "TIME",
                       "ACTIVE_FLAG"=> "Y",
                       "AJAX_FLAG"=> "N",
                       "CALLOUT_MESSAGES"=> "",
                       "VIEW_ALL_LINK"=> "",
                       "TITLE"=> "Intro Calls",
                       "SUBTITLE"=> "",
                       "ICONS"=> "",
                       "BUTTONS"=> "REMINDER",
                       "TRACKING"=> "",
                       "CONTACT_ID"=>"",
               )
		);
	}
}

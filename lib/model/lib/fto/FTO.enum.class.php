<?php
class FTOStateTypes

{
	const FTO_ELIGIBLE = "ELIGIBLE";
	const FTO_ACTIVE = "ACTIVE";
	const FTO_EXPIRED = "EXPIRED";
	const NEVER_EXPOSED = "NEVER_EXPOSED";
	const PAID = "PAID";
	const DUPLICATE = "DUPLICATE";
}

class FTOSubStateTypes

{
	const FTO_ELIGIBLE_HAVE_PHONE_NO_PHOTO = "C2"; //2
	const FTO_ELIGIBLE_NO_PHONE_HAVE_PHOTO = "C3"; //3
	const FTO_ELIGIBLE_NO_PHONE_NO_PHOTO = "C1"; //1
	const FTO_ACTIVE_LEAST_THRESHOLD = "D1"; //4
	const FTO_ACTIVE_BELOW_LOW_THRESHOLD = "D2"; //5
	const FTO_ACTIVE_BETWEEN_LOW_HIGH_THRESHOLD = "D3"; //6
	const FTO_ACTIVE_ABOVE_HIGH_THRESHOLD = "D4"; //7
	const FTO_EXPIRED_BEFORE_ACTIVATED = "E1"; //9 //5days for now
	const FTO_EXPIRED_AFTER_ACTIVATED = "E2"; //8
	const FTO_EXPIRED_INBOUND_ACCEPT_LIMIT = "E3"; //10
	const FTO_EXPIRED_OUTBOUND_ACCEPT_LIMIT = "E4"; //11
	const FTO_EXPIRED_TOTAL_ACCEPT_LIMIT = "E5"; //12
	const PAID="P";
	const DUPLICATE ="G";
	const NEVER_EXPOSED = "F";
}

class THRESHOLD

{
	const LEAST_THRESHOLD = 0;
	const LOW_THRESHOLD = 15;
	const HIGH_THRESHOLD = 150;
}

class ACCEPTANCE_LIMIT

{
	const FTO_ACCEPTANCE_INBOUND_LIMIT = 3;
	const FTO_ACCEPTANCE_OUTBOUND_LIMIT = 0;
	const FTO_ACCEPTANCE_TOTAL_LIMIT = 3;
}

class ACCEPTANCE_LIMIT_CHECKS_FLAG

{
	const INBOUND_ON = true;
	const TOTAL_ON = false;
}

class FTO_PERIOD

{
	const BEFORE_ACTIVE = 5;
	const AFTER_ACTIVE = 15;
}

class FTOStateUpdateReason

{
	const REGISTER = "REGISTER";
	const SCREEN = "SCREEN";
	const PHOTO = "PHOTO";
	const NUMBER_VERIFY = "NUMBER_VERIFY";
	const NUMBER_UNVERIFY = "NUMBER_UNVERIFY";
	const EOI_SENT = "EOI_SENT";
	const ACCEPT_SENT = "ACCEPT_SENT";
	const ACCEPT_RECEIVED = "ACCEPT_RECEIVED";
	const TAKE_MEMBERSHIP = "TAKE_MEMBERSHIP";
	const MARK_DUPLICATE = "MARK_DUPLICATE";
	const MARK_NON_DUPLICATE = "MARK_NON_DUPLICATE";
	const INCOMPLETE_TO_COMPLETE = "INCOMPLETE_TO_COMPLETE";
}

class FTOLiveFlags
{
	const FTO_LIVE_DATE = "2013-02-26 13:30:00"; //25 December 2012
	const IS_FTO_LIVE = false; 
	//const IS_FTO_LIVE = false;	//FTO offer still exists on website; false if FTO offer is withdrawn
	const SuggestedMatchNoOfResults = 4;
	const FTO_WORTH = 1100;

}
?>

<?php

/**
 * Auto Select actions.
 *
 * @package    jeevansathi
 * @subpackage profile
 * @author     Nikhil dhiman
 * @version    SVN: $Id: actions.class.php 23810 2011-07-14 03:07:44 Nikhil dhiman $
 */
/**
 * Auto Select feature.<p></p>
 * 	
 *  
 * @author Nikhil dhiman
 */

class pageAction extends sfAction
{
	/**
	* Executes index action
	*
	* @param sfRequest $request A request object
	*/
	private $allowed=array("disclaimer"=>1,"privacypolicy"=>2,"thirdparty"=>3,"privacyfeatures"=>4,"fraudalert"=>5);
	private $inner=array(1=>"terms",2=>"policy",3=>"thirdpar",4=>"features",5=>"fraud");
	private $staticPageArray=array("fraudalert"=>"Fraud Alert","disclaimer"=>"Terms & Conditions","thirdparty"=>"Third Party T&C","privacypolicy"=>"Privacy Policy","privacyfeatures"=>"Privacy Features");
	public function execute($request)
	{
		$type=$request->getParameter("type");
		$this->pageName=$type;
		$this->legalPageTabs=$this->staticPageArray;
		//print_r($type);die;
		$this->viewThisPage="jspc".$type;
		$type_index=$this->allowed[$request->getParameter("type")]?$this->allowed[$request->getParameter("type")]:"disclaimer";
		$this->innerTemplate=$this->inner[$type_index];
		//print_r($type_index);die;
		$this->loginData = $request->getAttribute('loginData');
		
		$this->rightPanelStory = IndividualStories::showSuccessPoolStory();
		if(!$type_index)
			$type="disclaimer";
                if(MobileCommon::isNewMobileSite())
                        $type="jsms".$type;
		else if(MobileCommon::isMobile())
			$type="mob".$type;
		$this->setTemplate($type);
		if(MobileCommon::isDesktop())
			$this->setTemplate("_jspcStatic/jspcStaticPage");
			
	}
}
?>

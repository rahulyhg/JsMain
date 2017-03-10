<?php
/**
 * downloadHoroscope
 * this class is called when download horoscope is clicked and it creates a pdf file and downloads it on the system
 * @package    jeevansathi
 * @subpackage api
 * @author     Sanyam Chopra	
 * @date	   16th Feb 2017
 */
class downloadHoroscopeV1Action extends sfActions
{
	/**
	* Executes index action
	*
	* @param sfRequest $request A request object
	*/
	public function execute($request)
	{
		$apiResponseHandlerObj=ApiResponseHandler::getInstance();
		if(!$request->getParameter('profilechecksum'))
		{
			$apiResponseHandlerObj->setHttpArray(ResponseHandlerConfig::$FAILURE);
			$apiResponseHandlerObj->generateResponse();
			die;
		}
		
		$url = "http://mq.jeev.com/profile/horoscope_astro.php?SAMEGENDER=&FILTER=&ERROR_MES=&view_username=ZZTA7026&SIM_USERNAME=ZZTA7026&type=Horoscope&ajax_error=2&checksum=&profilechecksum=4df240233ba9f7e19b88a74558885a15i9376853&randValue=890&showDownload=1&GENDERSAME=";
		
		//$url = "http://vendors.vedic-astrology.net/cgi-bin/JeevanSathi_DrawChart_matchstro.dll?DrawChart?469:563:1980:05:20:01:55:00:Bhandara%20District,%20Maharashtra:328.446833:35.40627:103.367058:131.573784:43.198575:127.486461:68.529836:146.619363:120.909642:300.909642:0:0:1:0:0:-1:1:2";
		
		$file=PdfCreation::PdfFile($url);
		PdfCreation::setResponse("myfile.pdf",$file);

		// header("Content-type: application/pdf");

		// It will be called downloaded.pdf
		// header("Content-Disposition:attachment;filename='downloaded.pdf'");

		// The PDF source is in original.pdf
		// readfile($file);
		// print_R($file);die("SSS");
		return sfView::NONE;
	}
}
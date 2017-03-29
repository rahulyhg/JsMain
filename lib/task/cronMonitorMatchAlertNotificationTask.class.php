<?
/*
This php script is run to create object of rabbitmq Consumer class and call 
the receiveMessage function to let the consumer receive messages  on first server.
*/

class cronMonitorMatchAlertNotificationTask extends sfBaseTask
{
  /**
   * 
   * Configuration details for cron:cronMonitorMatchAlertNotificationTask
   * 
   * @access protected
   * @param none
   */
  protected function configure()
  {
    $this->namespace           = 'notification';
    $this->name                = 'cronMonitorMatchAlertNotification';
    $this->briefDescription    = 'Initialises instance of rabbitmq consumer class to retrieve messages on first server';
    $this->detailedDescription = <<<EOF
     The [cronConsumeQueueMessage|INFO] calls receiveMessage function of consumer class through its instance to retrieve messages on first server:
     [php symfony notification:cronMonitorMatchAlertNotification] 
EOF;
    $this->addOptions(array(
        new sfCommandOption('application', null, sfCommandOption::PARAMETER_OPTIONAL, 'The application name', 'jeevansathi')
    ));
  }

  /**
   * 
   * Function for executing cron- creates consumer class object and calls receiveMessage func to consume messages on FIRST_SERVER.
   * 
   * @access protected
   * @param $arguments,$options
   */
  protected function execute($arguments = array(), $options = array())
  {
    if (!sfContext::hasInstance())
      sfContext::createInstance($this->configuration);
    
    $curTime = date('Y-m-d H:i:s');
    $stTime = date('Y-m-d H:i:s', strtotime($curTime) - 5*60);
    $notificationLogObj = new MOBILE_API_NOTIFICATION_LOG();
    $count = $notificationLogObj->getDataForDuration("MATCHALERT",$stTime,$curTime);
    if($count==0){
        $rmqObj = new RabbitmqHelper();
        $rmqObj->killConsumerForCommand(MessageQueues::CRONNOTIFICATION_CONSUMER_STARTCOMMAND);
    }
  }
}
?>

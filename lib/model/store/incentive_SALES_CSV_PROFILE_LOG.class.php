<?php
class incentive_SALES_CSV_PROFILE_LOG extends TABLE
{
        public function __construct($dbname="")
        {
                parent::__construct($dbname);
        }

	public function insertProfile($profileid,$username,$csvSent,$filterName='',$filterValue='',$campaignName='',$dialStatus='')
        {
                try
                {
                        $sql = "INSERT INTO incentive.SALES_CSV_PROFILE_LOG (PROFILEID, USERNAME, CSV_SENT, CAMPAIGN_NAME, DIAL_STATUS, FILTER_NAME, FILTER_VALUE, ENTRY_DT) VALUES(:PROFILEID, :USERNAME, :CSV_SENT, :CAMPAIGN_NAME, :DIAL_STATUS, :FILTER_NAME, :FILTER_VALUE,NOW())";
                        $prep = $this->db->prepare($sql);
                        $prep->bindValue(":PROFILEID",$profileid,PDO::PARAM_INT);
                        $prep->bindValue(":USERNAME",$username,PDO::PARAM_STR);
                        $prep->bindValue(":CSV_SENT",$csvSent,PDO::PARAM_STR);
                        $prep->bindValue(":CAMPAIGN_NAME",$campaignName,PDO::PARAM_STR);
                        $prep->bindValue(":DIAL_STATUS",$dialStatus,PDO::PARAM_INT);
                        $prep->bindValue(":FILTER_NAME",$filterName,PDO::PARAM_STR);
                        $prep->bindValue(":FILTER_VALUE",$filterValue,PDO::PARAM_STR);
                        $prep->execute();
                }
                catch(Exception $e)
                {
                        throw new jsException($e);
                }
        }
}
?>

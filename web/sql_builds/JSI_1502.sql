use MIS;
CREATE TABLE IF NOT EXISTS `VCD_ATTEMP_TRACKING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VIEWER` int(11) NOT NULL,
  `VIEWED` int(11) NOT NULL,
  `VIEWED_SUBSCRIPTION` varchar(10) DEFAULT NULL,
  `VIEWER_SUBSCRIPTION` varchar(10) NOT NULL,
  `DATE` date NOT NULL,
  `CHANNEL` varchar(3) DEFAULT NULL,
  `CONTACT_TYPE` varchar(1) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `VIEWER` (`VIEWER`),
  KEY `VIEWER_2` (`VIEWER`,`VIEWED`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
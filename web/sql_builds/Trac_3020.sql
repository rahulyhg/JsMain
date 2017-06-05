create database profileInformation;
use profileInformation;
CREATE TABLE `MYJSAPP_CONFIG` (
  `ID` tinyint(1) NOT NULL AUTO_INCREMENT,
  `INFO_TYPE` varchar(30) DEFAULT NULL,
  `SORT_ORDER` tinyint(1) unsigned DEFAULT NULL,
  `COUNT` tinyint(1) unsigned DEFAULT NULL,
  `TUPLE` varchar(25) DEFAULT NULL,
  `TUPLE_ORDER` varchar(25) DEFAULT NULL,
  `ACTIVE_FLAG` char(1) DEFAULT NULL,
  `AJAX_FLAG` char(1) DEFAULT NULL,
  `CALLOUT_MESSAGES` varchar(100) DEFAULT NULL,
  `VIEW_ALL_LINK` varchar(100) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `SUBTITLE` varchar(50) DEFAULT NULL,
  `ICONS` varchar(50) DEFAULT NULL,
  `BUTTONS` varchar(50) DEFAULT NULL,
  `TRACKING` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INFO_TYPE` (`INFO_TYPE`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `MYJSAPP_CONFIG`
-- 

INSERT INTO `MYJSAPP_CONFIG` VALUES (1, 'INTEREST_RECEIVED', 1, 2, 'NO_USERNAME_TUPLE', 'TIME', 'Y', 'N', NULL, NULL, 'People to Respond to', NULL, NULL, NULL, 'responseTracking=19');
INSERT INTO `MYJSAPP_CONFIG` VALUES (2, 'VISITORS', 2, 10, 'ONLY_PIC_TUPLE', 'TIME', 'Y', 'N', NULL, NULL, 'Recent Profile Visitors', NULL, NULL, NULL, 'stype=A11');
INSERT INTO `MYJSAPP_CONFIG` VALUES (4, 'ACCEPTANCES_SENT', 100, 0, NULL, 'TIME', 'Y', 'N', NULL, NULL, 'Members', 'I Accepted', NULL, NULL, NULL);
INSERT INTO `MYJSAPP_CONFIG` VALUES (3, 'MATCH_ALERT', 3, 2, 'NO_USERNAME_TUPLE', 'TIME', 'Y', 'N', NULL, NULL, 'Match Alerts', NULL, NULL, NULL, 'stype=A15');
INSERT INTO `MYJSAPP_CONFIG` VALUES (5, 'MESSAGE_RECEIVED', 100, 0, NULL, 'TIME', 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `MYJSAPP_CONFIG` VALUES (6, 'ACCEPTANCES_RECEIVED', 100, 0, NULL, 'TIME', 'Y', 'N', NULL, NULL, 'Members', 'Accepted Me', NULL, NULL, NULL);

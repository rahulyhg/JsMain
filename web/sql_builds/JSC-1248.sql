use MOBILE_API;

DROP TABLE BROWSER_NOTIFICATION;
DROP TABLE BROWSER_NOTIFICATION_TEMPLATE;

ALTER TABLE BROWSER_NOTIFICATION_REGISTRATION ADD `DISABLED` enum('Y','N') DEFAULT 'N';

CREATE TABLE `BROWSER_NOTIFICATION` (
 `ID` int(11) NOT NULL AUTO_INCREMENT,
 `REG_ID` varchar(255) NOT NULL,
 `NOTIFICATION_KEY` varchar(20) NOT NULL,
 `NOTIFICATION_TYPE` varchar(10) NOT NULL,
 `MESSAGE` varchar(200) NOT NULL,
 `TITLE` varchar(50) NOT NULL,
 `ICON` varchar(100) NOT NULL,
 `TAG` varchar(5) DEFAULT NULL,
 `ENTRY_DT` datetime NOT NULL,
 `REQUEST_DT` datetime NOT NULL,
 `PRIORITY` int(2) NOT NULL,
 `SENT_TO_QUEUE` enum('Y','N') DEFAULT 'N',
 `SENT_TO_GCM` enum('Y','N') NOT NULL DEFAULT 'N',
 `STATUS` enum('S','F','I','E') DEFAULT NULL,
 `RESPONSE` varchar(50) NOT NULL,
 `SENT_TO_CHANNEL` enum('Y','N') DEFAULT 'N',
 `LANDING_ID` varchar(200) DEFAULT NULL,
 `TTL` int(11) DEFAULT '0',
 `MSG_ID` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`ID`),
 KEY `REG_ID` (`REG_ID`),
 KEY `ENTRY_DT` (`ENTRY_DT`),
 KEY `MSG_ID` (`MSG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

CREATE TABLE `BROWSER_NOTIFICATION_TEMPLATE` (
 `ID` int(11) NOT NULL AUTO_INCREMENT,
 `NOTIFICATION_KEY` varchar(20) NOT NULL,
 `MESSAGE` varchar(200) NOT NULL,
 `TITLE` varchar(50) NOT NULL,
 `ICON` varchar(100) NOT NULL,
 `TAG` varchar(5) DEFAULT NULL,
 `CHANNEL` varchar(10) DEFAULT NULL,
 `STATUS` enum('Y','N') DEFAULT NULL,
 `SUBSCRIPTION` varchar(10) NOT NULL,
 `FREQUENCY` varchar(30) DEFAULT NULL,
 `TIME_CRITERIA` varchar(5) NOT NULL,
 `LANDING_ID` int(11) NOT NULL,
 `TTL` int(11) DEFAULT '0',
 `COUNT` varchar(10) NOT NULL,
 PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1
;

CREATE TABLE `BROWSER_NOTIFICATION_BACKUP` (
 `ID` int(11) NOT NULL,
 `REG_ID` varchar(255) NOT NULL,
 `NOTIFICATION_KEY` varchar(20) NOT NULL,
 `NOTIFICATION_TYPE` varchar(10) NOT NULL,
 `MESSAGE` varchar(200) NOT NULL,
 `TITLE` varchar(50) NOT NULL,
 `ICON` varchar(100) NOT NULL,
 `TAG` varchar(5) DEFAULT NULL,
 `ENTRY_DT` datetime NOT NULL,
 `REQUEST_DT` datetime NOT NULL,
 `PRIORITY` int(2) NOT NULL,
 `SENT_TO_QUEUE` enum('Y','N') DEFAULT 'N',
 `SENT_TO_GCM` enum('Y','N') NOT NULL DEFAULT 'N',
 `STATUS` enum('S','F','I','E') DEFAULT NULL,
 `RESPONSE` varchar(50) NOT NULL,
 `SENT_TO_CHANNEL` enum('Y','N') DEFAULT 'N',
 `LANDING_ID` varchar(200) DEFAULT NULL,
 `TTL` int(11) DEFAULT '0',
 `MSG_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (1, 'JUST_JOIN', '{MATCH_COUNT} new matching profile have joined Jeevansathi since you last checked', 'Just Joined Matches	', 'D', 'JJ', 'M,D', 'Y', 'A', 'D', '', 1, 0, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (2, 'JUST_JOIN', '{MATCH_COUNT} new matching profiles have joined Jeevansathi since you last checked	', 'Just Joined Matches	', 'D', 'JJ', 'M,D', 'Y', 'A', 'D', '', 1, 0, 'MUL');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (3, 'AGENT_ONLINE_PROFILE', '{USERNAME_OTHER_1} is now online', 'My online profiles', 'D', NULL, 'CRM_AND', 'Y', 'A', 'D', '', 2, 0, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (4, 'AGENT_FP_PROFILE', '{USERNAME_OTHER_1} has made a failed payment try', 'My FP profiles', 'D', NULL, 'CRM_AND', 'Y', 'A', 'D', '', 2, 0, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (5, 'PENDING_EOI', 'Respond to {USERNAME_OTHER_1}, {USERNAME_OTHER_2} and {EOI_COUNT} more members waiting for your response.', 'Pending Interests', 'D', 'PI', 'M', 'Y', 'A', 'Thu,Sun', '15', 3, 0, 'MUL');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (6, 'PENDING_EOI', 'Respond to {USERNAME_OTHER_1}, {USERNAME_OTHER_2} members waiting for your response.', 'Pending Interests', 'D', 'PI', 'M', 'Y', 'A', 'Thu,Sun', '15', 3, 0, 'DOUBLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (7, 'PENDING_EOI', 'Respond to {USERNAME_OTHER_1} who is waiting for your response.', 'Pending Interests', 'D', 'PI', 'M', 'Y', 'A', 'Thu,Sun', '15', 3, 0, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (8, 'PROFILE_VISITOR', '{MESSAGE_RECEIVED}', 'Recent Profile Visitors', 'D', 'PV', 'M', 'Y', 'A', 'I', '15', 4, 0, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (9, 'MEM_EXPIRE_A5', '{MESSAGE}', 'Renew your Membership', 'D', 'RM', 'M', 'Y', 'A', 'D', '', 5, 86400, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (10, 'MEM_EXPIRE_A10', '{MESSAGE}', 'Renew your Membership', 'D', 'RM', 'M', 'Y', 'A', 'D', '', 5, 86400, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (11, 'MEM_EXPIRE_A15', '{MESSAGE}', 'Renew your Membership', 'D', 'RM', 'M', 'Y', 'A', 'D', '', 5, 86400, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (12, 'MEM_EXPIRE_B1', '{MESSAGE}', 'Renew your Membership', 'D', 'RM', 'M', 'Y', 'A', 'D', '', 5, 86400, 'SINGLE');
INSERT INTO `BROWSER_NOTIFICATION_TEMPLATE` (`ID`, `NOTIFICATION_KEY`, `MESSAGE`, `TITLE`, `ICON`, `TAG`, `CHANNEL`, `STATUS`, `SUBSCRIPTION`, `FREQUENCY`, `TIME_CRITERIA`, `LANDING_ID`, `TTL`, `COUNT`) VALUES (13, 'MEM_EXPIRE_B5', '{MESSAGE}', 'Renew your Membership', 'D', 'RM', 'M', 'Y', 'A', 'D', '', 5, 86400, 'SINGLE');
        

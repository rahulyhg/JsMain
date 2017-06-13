use MOBILE_API;

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
 `STATUS` enum('S','F','I') DEFAULT NULL,
 `RESPONSE` varchar(50) NOT NULL,
 `SENT_TO_CHANNEL` enum('Y','N') DEFAULT 'N',
 `LANDING_ID` varchar(200) DEFAULT NULL,
 `TTL` int(11) DEFAULT '0',
 `MSG_ID` bigint(20) DEFAULT NULL,
 PRIMARY KEY (`ID`),
 KEY `REG_ID` (`REG_ID`),
 KEY `ENTRY_DT` (`ENTRY_DT`)
) ENGINE=InnoDB;

CREATE TABLE `BROWSER_NOTIFICATION_REGISTRATION` (
 `REG_ID` varchar(255) NOT NULL,
 `PROFILEID` int(11) DEFAULT NULL,
 `AGENTID` int(11) DEFAULT NULL,
 `CHANNEL` varchar(10) DEFAULT NULL,
 `ENTRY_DT` datetime NOT NULL,
 `ACTIVATED` enum('Y','N') NOT NULL,
 `USER_AGENT` varchar(255) NOT NULL,
 `FAILURE` int(2) NOT NULL,
 PRIMARY KEY (`REG_ID`),
 KEY `PROFILEID` (`PROFILEID`,`ENTRY_DT`)
) ENGINE=InnoDB;

CREATE TABLE `BROWSER_NOTIFICATION_TEMPLATE` (
 `ID` int(11) NOT NULL,
 `NOTIFICATION_KEY` varchar(20) NOT NULL,
 `MESSAGE` varchar(200) NOT NULL,
 `TITLE` varchar(50) NOT NULL,
 `ICON` varchar(100) NOT NULL,
 `TAG` varchar(5) DEFAULT NULL,
 `CHANNEL` varchar(10) DEFAULT NULL,
 `STATUS` enum('Y','N') DEFAULT NULL,
 `SUBSCRIPTION` varchar(10) NOT NULL,
 `FREQUENCY` varchar(3) NOT NULL,
 `TIME_CRITERIA` varchar(5) NOT NULL,
 `LANDING_ID` int(11) NOT NULL,
 `TTL` int(11) DEFAULT '0',
 `COUNT` varchar(10) NOT NULL,
 PRIMARY KEY (`ID`)
) ENGINE=InnoDB;
use billing;

CREATE TABLE billing.`EXCLUSIVE_SERVICING` (
 `ID` int(11) NOT NULL AUTO_INCREMENT,
 `AGENT_USERNAME` varchar(20) NOT NULL,
 `CLIENT_ID` int(11) NOT NULL,
 `ASSIGNED_DT` date NOT NULL,
 `ENTRY_DT` datetime DEFAULT NULL,
 `SERVICE_DAY` enum('NA','SUN','MON','TUE','WED','THU','FRI','SAT') DEFAULT 'NA',
 `SERVICE_SET_DT` datetime DEFAULT "0000-00-00 00:00:00",
 `BIODATA_LOCATION` varchar(100) DEFAULT NULL,
 `BIODATA_UPLOAD_DT` datetime DEFAULT "0000-00-00 00:00:00",
 `SCREENED_DT` date DEFAULT "0000-00-00",
 `SCREENED_STATUS` enum('Y', 'N') DEFAULT 'N',
 `EMAIL_STAGE` varchar(1) DEFAULT NULL,
 PRIMARY KEY (`ID`),
 UNIQUE COMBINATION(`AGENT_USERNAME`,`CLIENT_ID`,`ASSIGNED_DT`),
 KEY AGENT_USERNAME(`AGENT_USERNAME`),
 KEY CLIENT_ID(`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE billing.`EXCLUSIVE_CLIENT_MEMBER_MAPPING` (
 `ID` int(11) NOT NULL AUTO_INCREMENT,
 `CLIENT_ID` int(11) NOT NULL,
 `MEMBER_ID` int(11) NOT NULL,
 `ENTRY_DT` datetime DEFAULT NULL,
 `SCREENED_STATUS` enum('Y', 'N','P','E') DEFAULT 'N',
 `FAILURE_REASON` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY CLIENT_ID(`CLIENT_ID`),
  KEY SCREENED_STATUS(`SCREENED_STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE billing.`EXCLUSIVE_MAIL_LOG` (
  `PROFILE` int(11) NOT NULL,
  MAIL_TYPE varchar(100) NOT NULL,
  ACPT_COUNT int(10) NOT NULL,
  `DATE` date DEFAULT NULL,
  `STATUS` varchar(1) NOT NULL DEFAULT 'N',
  KEY `PROFILE` (`PROFILE`,MAIL_TYPE)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

use incentive;

CREATE TABLE incentive.`ExclusiveMatchMailer` (
  RECEIVER int(11) NOT NULL,
  AGENT_NAME varchar(50) NOT NULL,
  AGENT_EMAIL varchar(50) NOT NULL,
  ACCEPTANCES varchar(500) NOT NULL,
  AGENT_PHONE varchar(250) NOT NULL,
  `STATUS` enum('N','U','Y','I') DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE billing.`EXCLUSIVE_FOLLOWUPS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AGENT_USERNAME` varchar(20) NOT NULL,
  `CLIENT_ID` int(11) NOT NULL,
  `MEMBER_ID` int(11) NOT NULL,
  `ENTRY_DT` datetime DEFAULT NULL,
  `FOLLOWUP_1` varchar(30) DEFAULT NULL,
  `FOLLOWUP_2` varchar(30) DEFAULT NULL,
  `FOLLOWUP_3` varchar(30) DEFAULT NULL,
  `FOLLOWUP1_DT` date DEFAULT NULL,
  `FOLLOWUP2_DT` date DEFAULT NULL,
  `FOLLOWUP3_DT` date DEFAULT NULL,
 `STATUS` enum('P','Y','N','F1','F2','F3'),
 PRIMARY KEY (`ID`),
 UNIQUE COMBINATION(`AGENT_USERNAME`,`CLIENT_ID`,`MEMBER_ID`),
 KEY AGENT_USERNAME(`AGENT_USERNAME`),
 KEY CLIENT_ID(`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

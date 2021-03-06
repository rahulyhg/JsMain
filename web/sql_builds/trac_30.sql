use MATCHALERT_TRACKING;

CREATE TABLE `MATCHALERT_DISLIKE` (
 `RECEIVER` int(11) NOT NULL,
 `USER` int(11) default NULL,
 `DATE` date NOT NULL,
 `PHOTO` tinyint(4) NOT NULL,
 `DPP` text NOT NULL,
 `REASON` text NOT NULL,
 UNIQUE KEY `RECEIVER` (`RECEIVER`,`USER`),
 KEY `DATE` (`DATE`)
) ENGINE=MyISAM;

CREATE TABLE `MATCHALERT_LIKE` (
  `RECEIVER` int(11) NOT NULL,
  `USER` int(11) default NULL,
  `DATE` date NOT NULL,
  UNIQUE KEY `RECEIVER` (`RECEIVER`,`USER`),
  KEY `DATE` (`DATE`)
) ENGINE=MyISAM;

use matchalerts;

CREATE TABLE `DATEFORMATCHALERTSMAILER` (
  `VALUE` varchar(20) default NULL
) ENGINE=MyISAM;
INSERT INTO `DATEFORMATCHALERTSMAILER` VALUES ('0');

CREATE TABLE LOG_COPY_BKUP LIKE LOG_COPY;
CREATE TABLE `LAST_ACTIVE_LOG` (
  `NO` int(11) NOT NULL,
  `DATE` date NOT NULL
) ENGINE=MyISAM;
INSERT INTO `LAST_ACTIVE_LOG` VALUES (42,'');


ALTER TABLE SEARCH_FEMALE ADD `HIV` CHAR( 1 ) NOT NULL ;
ALTER TABLE SEARCH_MALE ADD `HIV` CHAR( 1 ) NOT NULL ;
ALTER TABLE TRENDS_SEARCH_MALE ADD `HIV` CHAR( 1 ) NOT NULL ;
ALTER TABLE TRENDS_SEARCH_FEMALE ADD `HIV` CHAR( 1 ) NOT NULL ;
ALTER TABLE NOTRENDS_SEARCH_MALE ADD `HIV` CHAR( 1 ) NOT NULL ;
ALTER TABLE NOTRENDS_SEARCH_FEMALE ADD `HIV` CHAR( 1 ) NOT NULL ;




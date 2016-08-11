use newjs;

CREATE TABLE `CHAT_LOG_GET_ID` (
 `ID` int(11) NOT NULL AUTO_INCREMENT,
 `NO_USE_VARIABLE` char(1) NOT NULL,
 PRIMARY KEY (`ID`),
 UNIQUE KEY `NO_USE_VARIABLE` (`NO_USE_VARIABLE`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='Table generate id for MESSAGE_LOG table'



CREATE TABLE `CHAT_LOG` (
 `SENDER` int(8) unsigned DEFAULT '0',
 `RECEIVER` int(8) unsigned DEFAULT '0',
 `DATE` datetime DEFAULT '0000-00-00 00:00:00',
 `IP` varchar(64) DEFAULT NULL,
 `CHATID` varchar(30) DEFAULT '0',
 `ID` int(11) DEFAULT NULL,
 `SEEN` char(1) DEFAULT NULL,
 UNIQUE KEY `ID` (`ID`),
 KEY `SENDER` (`SENDER`,`RECEIVER`),
 KEY `RECEIVER` (`RECEIVER`,`CHATID`),
 KEY `DATE_id` (`DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1


CREATE TABLE `CHATS` (
 `ID` int(11) NOT NULL,
 `MESSAGE` text NOT NULL,
 UNIQUE KEY `ID` (`ID`)
) ENGINE=Innodb DEFAULT CHARSET=latin1




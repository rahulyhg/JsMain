use jeevansathi_mailer;

CREATE TABLE `DAILY_MAILER_COUNT_LOG` (
 `ID` int(11) NOT NULL AUTO_INCREMENT,
 `MAILER_KEY` varchar(50) DEFAULT NULL,
 `TOTAL_COUNT` int(5) DEFAULT '0',
 `SENT` int(5) DEFAULT '0',
 `BOUNCED` int(5) DEFAULT '0',
 `INCOMPLETE` int(5) DEFAULT '0',
 `UNSUBSCRIBE` int(5) DEFAULT '0',
 `ENTRY_DT` date DEFAULT NULL,
 PRIMARY KEY (`ID`),
 KEY `MAILER_KEY` (`MAILER_KEY`),
 KEY `ENTRY_DT` (`ENTRY_DT`)
) ENGINE=InnoDB; 

use incentive;
CREATE TABLE `NEGATIVE_TREATMENT_LIST` (
 `ID` int(11) NOT NULL AUTO_INCREMENT,
 `PROFILEID` int(11) NOT NULL,
 `TYPE` varchar(50) NOT NULL,
 `ENTRY_BY` varchar(40) NOT NULL,
 `ENTRY_DT` date DEFAULT NULL,
 `FLAG_VIEWABLE` char(1) DEFAULT 'N',
 `FLAG_INBOX_EOI` char(1) DEFAULT 'N',
 `FLAG_CONTACT_DETAIL` char(1) DEFAULT 'N',
 `FLAG_OUTBOUND_CALL` char(1) DEFAULT 'N',
 `FLAG_INBOUND_CALL` char(1) DEFAULT 'N',
 `CHAT_INITIATION` char(1) DEFAULT 'N',
 PRIMARY KEY (`ID`),
 UNIQUE KEY `PROFILEID` (`PROFILEID`)
) ENGINE=MyISAM;

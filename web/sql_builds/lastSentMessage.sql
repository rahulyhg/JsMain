use newjs;
CREATE TABLE `LAST_SENT_MESSAGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILEID` int(11) NOT NULL,
  `TYPE` varchar(2) NOT NULL,
  `MESSAGE` text NOT NULL,
  `DATETIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `index2` (`TYPE`,`PROFILEID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;
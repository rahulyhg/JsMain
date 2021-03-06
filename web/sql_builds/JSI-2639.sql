use jsadmin;
CREATE TABLE `OPS_PHONE_VERIFIED_LOG` (
 `ID` mediumint(11) NOT NULL AUTO_INCREMENT,
 `PROFILEID` int(11) unsigned NOT NULL,
 `PHONE_TYPE` char(1) NOT NULL,
 `PHONE_NUM` varchar(20) NOT NULL DEFAULT '',
 `ENTRY_DT` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
 `OPS_USERID` varchar(50) NOT NULL,
 `PHONE_STATUS` varchar(1) NOT NULL,
 PRIMARY KEY (`ID`),
 KEY `PROFILEID` (`PROFILEID`),
 KEY `ENTRY_DT` (`ENTRY_DT`),
 KEY `PHONE` (`PHONE_NUM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1
use newjs;
create table REGISTRATION_PAGE1(
	`REGID` int(11) unsigned NOT NULL AUTO_INCREMENT,
	 `PASSWORD` varchar(40) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
	 `GENDER` char(1) NOT NULL DEFAULT '',
	 `RELIGION` tinyint(3) unsigned NOT NULL DEFAULT '0',
	 `CASTE` smallint(3) unsigned NOT NULL DEFAULT '0',
	 `MTONGUE` tinyint(3) unsigned NOT NULL DEFAULT '0',
	 `MSTATUS` char(2) NOT NULL,
	 `DTOFBIRTH` date NOT NULL DEFAULT '0000-00-00',
	 `COUNTRY_RES` tinyint(3) unsigned NOT NULL DEFAULT '0',
	 `CITY_RES` varchar(4) NOT NULL DEFAULT '',
	 `HEIGHT` tinyint(3) unsigned NOT NULL DEFAULT '0',
	 `EMAIL` varchar(100) NOT NULL DEFAULT '',
	 `IPADD` varchar(16) NOT NULL DEFAULT '',
	 `ENTRY_DT` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
	 `MOD_DT` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
	 `RELATION` char(2) NOT NULL,
	 `SOURCE` varchar(10) NOT NULL DEFAULT '',
	 `PROMO` char(1) NOT NULL DEFAULT '',
	 `HAVECHILD` char(2) NOT NULL DEFAULT '',
	 `ISD` varchar(5) NOT NULL DEFAULT '',
	 `SEC_SOURCE` char(1) DEFAULT NULL,
	 `CONVERTED` char(1) NOT NULL DEFAULT '',
	 PRIMARY KEY (`REGID`),
	 UNIQUE KEY `EMAIL` (`EMAIL`),
	 KEY `ENTRY_DT` (`ENTRY_DT`)
) ENGINE=MyISAM

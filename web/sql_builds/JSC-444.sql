use billing;

ALTER TABLE billing.DISCOUNT_LOOKUP ADD SERVICE char(6) NOT NULL DEFAULT '' AFTER MTONGUE;
ALTER TABLE billing.VARIABLE_DISCOUNT_POOL_TECH DROP COLUMN 3_DISCOUNT,DROP COLUMN 6_DISCOUNT,DROP COLUMN 12_DISCOUNT,DROP COLUMN L_DISCOUNT; 

RENAME TABLE VARIABLE_DISCOUNT_OFFER_DURATION_LOG TO VARIABLE_DISCOUNT_OFFER_DURATION_LOG_20151019;
CREATE TABLE `VARIABLE_DISCOUNT_OFFER_DURATION_LOG` (
 `PROFILEID` int(11) unsigned NOT NULL,
 `SERVICE` char(6) NOT NULL DEFAULT '',
 `3` tinyint(3) DEFAULT '0',
 `6` tinyint(3) DEFAULT '0',
 `12` tinyint(3) DEFAULT '0',
 `L` tinyint(3) DEFAULT '0',
 `EDATE` date DEFAULT NULL,
 KEY `PROFILEID` (`PROFILEID`)
) ENGINE=MyISAM;

ALTER TABLE billing.VARIABLE_DISCOUNT_TEMP ADD SERVICE char(6) NOT NULL DEFAULT '' AFTER EDATE;

DROP table billing.VARIABLE_DISCOUNT_OFFER_DURATION;
CREATE TABLE `VARIABLE_DISCOUNT_OFFER_DURATION` (
 `PROFILEID` int(11) NOT NULL DEFAULT '0',
 `SERVICE` char(6) NOT NULL DEFAULT '',
 `3` tinyint(3) DEFAULT '0',
 `6` tinyint(3) DEFAULT '0',
 `12` tinyint(3) DEFAULT '0',
 `L` tinyint(3) DEFAULT '0',
 UNIQUE KEY `PROFILEID` (`PROFILEID`,`SERVICE`)
) ENGINE=InnoDB;

CREATE TABLE `VARIABLE_DISCOUNT_DURATION_POOL_TECH` (
 `PROFILEID` int(11) NOT NULL DEFAULT '0',
 `SERVICE` char(6) NOT NULL DEFAULT '',
 `3_DISCOUNT` tinyint(3) DEFAULT '0',
 `6_DISCOUNT` tinyint(3) DEFAULT '0',
 `12_DISCOUNT` tinyint(3) DEFAULT '0',
 `L_DISCOUNT` tinyint(3) DEFAULT '0',
 UNIQUE KEY `PROFILEID` (`PROFILEID`,`SERVICE`)
) ENGINE=InnoDB

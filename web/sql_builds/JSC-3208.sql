use billing;

ALTER table billing.VARIABLE_DISCOUNT ADD TYPE varchar(10) DEFAULT NULL;
CREATE INDEX `TYPE` ON billing.VARIABLE_DISCOUNT (`TYPE`);

CREATE TABLE billing.`EXTENDED_VARIABLE_DISCOUNT` (
  `PROFILEID` int(11) NOT NULL,
  `SERVICE` varchar(5) NOT NULL,
  `DISCOUNT` tinyint(3) DEFAULT '0',
  `1` tinyint(3) DEFAULT NULL,
  `2` tinyint(3) DEFAULT '0',
  `3` tinyint(3) DEFAULT '0',
  `6` tinyint(3) DEFAULT '0',
  `12` tinyint(3) DEFAULT '0',
  `L` tinyint(3) DEFAULT '0',
  `SDATE` date NOT NULL,
  `EDATE` date NOT NULL,
  `ENTRY_DT` date NOT NULL,
  UNIQUE KEY `PROFILEID` (`PROFILEID`,`SERVICE`,`SDATE`),
  KEY `SDATE` (`SDATE`),
  KEY `ENTRY_DT` (`ENTRY_DT`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
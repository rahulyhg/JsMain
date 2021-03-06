ALTER TABLE billing.`VARIABLE_DISCOUNT` ADD `SENT_MAIL` enum('Y','N') NOT NULL DEFAULT 'N';
ALTER TABLE billing.`VARIABLE_DISCOUNT_LOG` ADD `SENT_MAIL` enum('Y','N') NOT NULL DEFAULT 'N';
ALTER TABLE billing.`VARIABLE_DISCOUNT_BACKUP_1DAY` ADD `SENT_MAIL` enum('Y','N') NOT NULL DEFAULT 'N';

CREATE TABLE billing.`VARIABLE_DISCOUNT_OFFER_DURATION_LOG` (
  `PROFILEID` int(11) unsigned NOT NULL,
  `3` tinyint(3) DEFAULT '0',
  `6` tinyint(3) DEFAULT '0',
  `12` tinyint(3) DEFAULT '0',
  `L` tinyint(3) DEFAULT '0',
  `EDATE` date DEFAULT NULL,
  KEY `PROFILEID` (`PROFILEID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
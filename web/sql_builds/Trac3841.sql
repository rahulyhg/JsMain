use newjs;
CREATE TABLE `PHOTO_FIRST_UNSCREENED` (
  `PROFILEID` int(11) NOT NULL DEFAULT '0',
  `SOURCE` varchar(20) NOT NULL,
  `ENTRY_DT` date DEFAULT NULL,
  `FLAG` tinyint(11) DEFAULT '0',
  PRIMARY KEY (`PROFILEID`)
) ENGINE=MyISAM;

use twowaymatch;

ALTER TABLE `TRENDS` ADD INDEX (`ENTRY_DT`);

CREATE TABLE `TRENDS_FOR_SPAM` (
 `PROFILEID` mediumint(11) unsigned NOT NULL,
 `USERNAME` varchar(40) character set latin1 collate latin1_bin NOT NULL,
 `GENDER` char(1) NOT NULL,
 `W_CASTE` float NOT NULL,
 `CASTE_VALUE_PERCENTILE` text NOT NULL,
 `W_MTONGUE` float NOT NULL,
 `MTONGUE_VALUE_PERCENTILE` varchar(255) NOT NULL,
 `W_AGE` float NOT NULL,
 `AGE_VALUE_PERCENTILE` varchar(255) NOT NULL,
 `W_INCOME` float NOT NULL,
 `INCOME_VALUE_PERCENTILE` varchar(255) NOT NULL,
 `W_HEIGHT` float NOT NULL,
 `HEIGHT_VALUE_PERCENTILE` varchar(255) NOT NULL,
 `W_EDUCATION` float NOT NULL,
 `EDUCATION_VALUE_PERCENTILE` varchar(255) NOT NULL,
 `W_OCCUPATION` float NOT NULL,
 `OCCUPATION_VALUE_PERCENTILE` varchar(255) NOT NULL,
 `W_CITY` float NOT NULL,
 `CITY_VALUE_PERCENTILE` text NOT NULL,
 `W_MSTATUS` float NOT NULL,
 `MSTATUS_N_P` float NOT NULL,
 `MSTATUS_M_P` float NOT NULL,
 `W_MANGLIK` float NOT NULL,
 `MANGLIK_M_P` float NOT NULL,
 `MANGLIK_N_P` float NOT NULL,
 `MANGLIK_A_P` float NOT NULL,
 `W_NRI` float NOT NULL,
 `NRI_M_P` float NOT NULL,
 `NRI_N_P` float NOT NULL,
 `ENTRY_DT` date NOT NULL,
 `AGE_BUCKET` varchar(100) default NULL,
 `I_VAL` float NOT NULL,
 `I_VAL_CALCULATED_DATE` date NOT NULL,
 PRIMARY KEY  (`PROFILEID`),
 KEY `ENTRY_DT` (`ENTRY_DT`)
) ENGINE=MyISAM;

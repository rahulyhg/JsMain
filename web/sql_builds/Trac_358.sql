ALTER TABLE incentive.NEGATIVE_PROFILE_LIST ADD `USERNAME` varchar(40) NOT NULL,ADD `DOMAIN` varchar(50) NOT NULL,ADD `ISD` varchar(6) NOT NULL AFTER `MOBILE`,ADD `ADDRESS` varchar(60) NOT NULL,ADD `COMMENTS` text NOT NULL,ADD `ENTRY_BY` varchar(40) NOT NULL,ADD `ENTRY_DT` datetime NOT NULL,ADD INDEX (`MOBILE`),ADD INDEX (`LANDLINE`),ADD INDEX (`WEBSITE`),ADD INDEX (`EMAIL`),ADD INDEX (`TYPE`),ADD INDEX (`ENTRY_DT`),ADD INDEX (`USERNAME`);



 

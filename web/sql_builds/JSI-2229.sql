CREATE TABLE  `INAPPROPRIATE_USERS_LOG` (
 `ID` INT( 10 ) NOT NULL ,
 `PROFILEID` INT( 11 ) NOT NULL ,
 `RELIGION_COUNT` MEDIUMINT( 6 ) NOT NULL ,
 `MSTATUS_COUNT` MEDIUMINT( 6 ) NOT NULL ,
 `AGE_COUNT` MEDIUMINT( 6 ) NOT NULL ,
 `DATE` DATE NOT NULL ,
PRIMARY KEY (  `ID` ) ,
INDEX (  `PROFILEID` ,  `DATE` )
);

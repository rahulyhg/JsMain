use newjs;
ALTER TABLE  `JPROFILE_CONTACT` ADD  `ALT_EMAIL` VARCHAR( 100 ) ,
ADD  `ALT_EMAIL_STATUS` VARCHAR( 1 ) DEFAULT 'N' ;


CREATE TABLE  `ALTERNATE_EMAIL_CHANGE_LOG` (
 `ID` INT( 15 ) NOT NULL AUTO_INCREMENT ,
 `PROFILEID` INT( 11 ) UNSIGNED NOT NULL ,
 `EMAIL` VARCHAR( 100 ) NOT NULL ,
 `STATUS` CHAR( 1 ) NOT NULL ,
 `CHANGE_DATE` DATETIME NOT NULL ,
 `VERIFY_DATE` DATETIME NOT NULL ,
INDEX (  `ID` ,  `PROFILEID` ) 
) ENGINE=MYISAM;

USE MAIL;
CREATE TABLE  `ALTERNATE_EMAIL_VER_MAILER` (
 `ID` INT( 11 ) NOT NULL AUTO_INCREMENT ,
 `RECEIVER` INT( 11 ) NOT NULL ,
 `TIME` DATETIME NOT NULL ,
 `SENT` VARCHAR( 4 ) NOT NULL ,
PRIMARY KEY (  `ID` ) ,
INDEX (  `RECEIVER` ) 
) ENGINE=MYISAM;


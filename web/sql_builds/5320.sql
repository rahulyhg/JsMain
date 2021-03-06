//On matchalert database
use matchalerts;
ALTER TABLE SEARCH_MALE CHANGE IS_OFFLINE_PROFILE HAVEPHOTO CHAR( 1 ) DEFAULT 'N';
ALTER TABLE SEARCH_FEMALE CHANGE IS_OFFLINE_PROFILE HAVEPHOTO CHAR( 1 ) DEFAULT 'N';
ALTER TABLE SEARCH_MALE CHANGE FRESHNESS_POINTS PROFILE_SCORE SMALLINT( 6 ) DEFAULT '0';  
ALTER TABLE SEARCH_FEMALE CHANGE FRESHNESS_POINTS PROFILE_SCORE SMALLINT( 6 ) DEFAULT '0'; 

CREATE TABLE `DvDLogs` (
`RECEIVER` INT( 2 ) UNSIGNED NOT NULL ,
`DATE` DATE NOT NULL ,
`MATCHES` TEXT NOT NULL ,
 KEY ( `RECEIVER` )
);

CREATE TABLE `ZERODVD` (
`RECEIVER` INT( 2 ) UNSIGNED NOT NULL ,
`DATE` DATE NOT NULL 
);

CREATE TABLE `DVD_PROFILES` (
`PROFILEID` INT UNSIGNED NOT NULL ,
`SENT` CHAR( 1 ) DEFAULT 'N' NOT NULL ,
 KEY ( `PROFILEID` )
);


ALTER TABLE TRENDS_SEARCH_MALE CHANGE IS_OFFLINE_PROFILE HAVEPHOTO CHAR( 1 ) DEFAULT 'N';
ALTER TABLE TRENDS_SEARCH_MALE CHANGE FRESHNESS_POINTS PROFILE_SCORE SMALLINT( 6 ) DEFAULT '0';  
ALTER TABLE TRENDS_SEARCH_FEMALE CHANGE IS_OFFLINE_PROFILE HAVEPHOTO CHAR( 1 ) DEFAULT 'N';
ALTER TABLE TRENDS_SEARCH_FEMALE CHANGE FRESHNESS_POINTS PROFILE_SCORE SMALLINT( 6 ) DEFAULT '0';  

ALTER TABLE NOTRENDS_SEARCH_MALE CHANGE IS_OFFLINE_PROFILE HAVEPHOTO CHAR( 1 ) DEFAULT 'N';
ALTER TABLE NOTRENDS_SEARCH_MALE CHANGE FRESHNESS_POINTS PROFILE_SCORE SMALLINT( 6 ) DEFAULT '0';  
ALTER TABLE NOTRENDS_SEARCH_FEMALE CHANGE IS_OFFLINE_PROFILE HAVEPHOTO CHAR( 1 ) DEFAULT 'N';
ALTER TABLE NOTRENDS_SEARCH_FEMALE CHANGE FRESHNESS_POINTS PROFILE_SCORE SMALLINT( 6 ) DEFAULT '0';  

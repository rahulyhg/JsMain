use jsadmin;
ALTER TABLE  `PHONE_VERIFIED_LOG` ADD INDEX  `PHONE` (  `PHONE_NUM` );

use duplicates;

DELETE FROM DUPLICATE_PROFILE_LOG WHERE IS_DUPLICATE='PROBABLE';
CREATE TABLE  `DUPLICATE_TEMP_TABLE` (
 `PROFILEID` INT( 11 ) NOT NULL ,
 `STATUS` CHAR( 1 ) NOT NULL ,
PRIMARY KEY (  `PROFILEID` )
);
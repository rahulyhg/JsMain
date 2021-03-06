use matchalerts;

CREATE TABLE  `LOG_AA` (
 `RECEIVER` MEDIUMINT( 11 ) UNSIGNED NOT NULL DEFAULT  '0',
 `USER` MEDIUMINT( 11 ) UNSIGNED NOT NULL DEFAULT  '0',
 `DATE` SMALLINT( 6 ) NOT NULL DEFAULT  '0',
 `LOGICLEVEL` SMALLINT( 2 ) NOT NULL ,
KEY  `RECEIVER` (  `RECEIVER` ) ,
KEY  `USER` (  `USER` )
)PARTITION BY RANGE(
DATE
)(
PARTITION p0 VALUES LESS THAN( 4066 ) , PARTITION p1
VALUES LESS THAN( 4081 ) , PARTITION p2
VALUES LESS THAN( 4096 )
);
use billing;

CREATE TABLE `VARIABLE_DISCOUNT_POOL_TECH_V2`(
  `PROFILEID` int(11) NOT NULL DEFAULT 0,
  `DISCOUNT` tinyint(3) DEFAULT 0,
  UNIQUE KEY `PROFILEID` (`PROFILEID`)
);

CREATE TABLE `VD_GIVEN_LASTTIME_V2` (
  `PROFILEID` int(11) NOT NULL DEFAULT 0,
   UNIQUE KEY `PROFILEID` (`PROFILEID`)				
);




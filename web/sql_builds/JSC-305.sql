use billing;

CREATE TABLE `RENEWAL_DISCOUNT` (
 `PROFILEID` int(11) NOT NULL,
 `DISCOUNT` tinyint(4) DEFAULT NULL,
 `EXPIRY_DT` date DEFAULT NULL,
 PRIMARY KEY (`PROFILEID`)
) ENGINE=InnoDB

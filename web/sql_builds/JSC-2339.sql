use billing;

CREATE TABLE billing.`UPGRADE_ORDERS` (
 `ID` int(11) NOT NULL AUTO_INCREMENT,
 `PROFILEID` int(11) NOT NULL DEFAULT '0',
 `MEMBERSHIP` varchar(20) DEFAULT "MAIN",
 `ORDERID` varchar(25) DEFAULT NULL,
 `BILLID` int(11) DEFAULT '0',
 `OLD_BILLID` int(11) DEFAULT '0',
 `DEACTIVATED_STATUS` enum("PENDING","DONE","FAILED") DEFAULT "PENDING",
 `UPGRADE_STATUS` enum("PENDING","DONE","FAILED") DEFAULT "PENDING",
 `REASON` varchar(50) DEFAULT NULL, 
 `ENTRY_DT` datetime DEFAULT NULL,
 PRIMARY KEY (`ID`),
 KEY `ORDERID` (`ORDERID`),
 KEY `BILLID` (`BILLID`),
 KEY `PROFILEID` (`PROFILEID`),
 UNIQUE `UNIQUE_ORDERID`(`ORDERID`)
);

ALTER TABLE billing.PURCHASES add DISCOUNT_PERCENT double DEFAULT 0;
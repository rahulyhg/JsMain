use MOBILE_API;
CREATE TABLE MOBILE_API.`BROWSER_REGISTRATION` (
 `REG_ID` varchar(255) NOT NULL,
 `PROFILEID` int(11) NOT NULL,
 `ACTIVATED` enum('Y','N') DEFAULT 'Y',
 `CHROME_VERSION` varchar(20) NOT NULL,
 `ENTRY_DT` datetime DEFAULT NULL,
 PRIMARY KEY (`REG_ID`),
 KEY `PROFILEID` (`PROFILEID`,`ENTRY_DT`)
) ENGINE=InnoDB;
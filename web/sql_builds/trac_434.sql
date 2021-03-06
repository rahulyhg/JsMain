use bot_jeevansathi;
CREATE TABLE `CHATACCEPTLIST` (
 `SENDER` varchar(200) NOT NULL,
 `RECEIVER` varchar(200) NOT NULL
);
	CREATE TABLE `CHATTINGWITHWHOM` (
 `SENDER` varchar(200) NOT NULL,
 `RECEIVER` varchar(200) NOT NULL,
 `STARTCHAT` bigint(20) DEFAULT '0',
 KEY `SENDER` (`SENDER`,`RECEIVER`)
);
CREATE TABLE `TIMELASTCHAT` (
 `WHO` varchar(200) NOT NULL,
 `TIME` bigint(20) NOT NULL DEFAULT '0',
 KEY `WHO` (`WHO`)
);
CREATE TABLE `user_online_new` (
 `USER` int(10) unsigned NOT NULL DEFAULT '0',
 `TYPE` char(1) DEFAULT NULL,
 UNIQUE KEY `USER` (`USER`)
);
CREATE TABLE `user_online_sathi` (
 `USER` int(10) unsigned NOT NULL DEFAULT '0',
 `TYPE` char(1) DEFAULT NULL,
 UNIQUE KEY `USER` (`USER`)
);

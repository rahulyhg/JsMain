USE billing;

ALTER TABLE `DISCOUNT_OFFER` CHANGE `DISCOUNT` `DISCOUNT` FLOAT DEFAULT NULL;

CREATE TABLE `MEMBERSHIPS` (
  `SERVICE` varchar(5) DEFAULT NULL,
  `MAIN` enum('Y','N') NOT NULL DEFAULT 'N',
  `SERVICE_NAME` varchar(255) NOT NULL,
  UNIQUE KEY `SERVICE` (`SERVICE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `MEMBERSHIPS` VALUES ('P', 'Y', 'eRishta');
INSERT INTO `MEMBERSHIPS` VALUES ('C', 'Y', 'eValue');
INSERT INTO `MEMBERSHIPS` VALUES ('D', 'Y', 'eClassifieds');
INSERT INTO `MEMBERSHIPS` VALUES ('ESP', 'Y', 'eSathi');
INSERT INTO `MEMBERSHIPS` VALUES ('X', 'Y', 'JS Exclusive');
INSERT INTO `MEMBERSHIPS` VALUES ('T', 'N', 'Response Booster');
INSERT INTO `MEMBERSHIPS` VALUES ('A', 'N', 'Astro Compatibility');
INSERT INTO `MEMBERSHIPS` VALUES ('R', 'N', 'Featured Profile');
INSERT INTO `MEMBERSHIPS` VALUES ('I', 'N', 'We Talk For You');
INSERT INTO `MEMBERSHIPS` VALUES ('M', 'N', 'Matri Profile');
INSERT INTO `MEMBERSHIPS` VALUES ('B', 'N', 'Profile Highlighting');
use newjs;
CREATE TABLE `SUNSIGN` (
	 `ID` int(3) NOT NULL AUTO_INCREMENT,
	 `LABEL` varchar(50) DEFAULT NULL,
	 `VALUE` int(3) DEFAULT NULL,
	 PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1
INSERT INTO `SUNSIGN` VALUES (1, 'Don''t Know', 1);
INSERT INTO `SUNSIGN` VALUES (2, 'Aries', 2);
INSERT INTO `SUNSIGN` VALUES (3, 'Taurus', 3);
INSERT INTO `SUNSIGN` VALUES (4, 'Gemini', 4);
INSERT INTO `SUNSIGN` VALUES (5, 'Cancer', 5);
INSERT INTO `SUNSIGN` VALUES (6, 'Leo', 6);
INSERT INTO `SUNSIGN` VALUES (7, 'Virgo', 7);
INSERT INTO `SUNSIGN` VALUES (8, 'Libra', 8);
INSERT INTO `SUNSIGN` VALUES (9, 'Scorpio', 9);
INSERT INTO `SUNSIGN` VALUES (10, 'Sagittarius', 10);
INSERT INTO `SUNSIGN` VALUES (11, 'Capricorn', 11);
INSERT INTO `SUNSIGN` VALUES (12, 'Aquarius', 12);
INSERT INTO `SUNSIGN` VALUES (13, 'Pisces', 13);

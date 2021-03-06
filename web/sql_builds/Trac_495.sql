use billing;

INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES3', 'P3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES3', 'A3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES3', 'R3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES3', 'T3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES3', 'I30');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES6', 'A6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES6', 'I60');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES6', 'P6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES6', 'R6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES6', 'T6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES12', 'P12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES12', 'A12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES12', 'R12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES12', 'T12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PES12', 'I120');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP3', 'P3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP3', 'A3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP3', 'R3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP3', 'T3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP3', 'D3');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP3', 'I30');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP6', 'P6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP6', 'A6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP6', 'R6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP6', 'T6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP6', 'D6');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP6', 'I60');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP12', 'P12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP12', 'A12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP12', 'R12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP12', 'T12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP12', 'D12');
INSERT INTO `PACK_COMPONENTS` VALUES ('', 'PESP12', 'I120');

INSERT INTO `SERVICES` VALUES ('', 'ES3', 'eSathi - 3 Months', '', 3, 3535.81, 3900, 95, 'Y', '', 'PES3', 'N', 0, 'N', 'Y');
INSERT INTO `SERVICES` VALUES ('', 'ES6', 'eSathi - 6 Months', '', 6, 5802.36, 6400, 175, 'Y', '', 'PES6', 'N', 0, 'N', 'Y');
INSERT INTO `SERVICES` VALUES ('', 'ES12', 'eSathi - 12 Months', '', 12, 8975.52, 9900, 245, 'Y', '', 'PES12', 'N', 0, 'N', 'Y');
INSERT INTO `SERVICES` VALUES ('', 'ESP3', 'eSathiPlus - 3 Months', '', 3, 3535.81, 3900, 95, 'Y', '', 'PESP3', 'N', 0, 'N', 'Y');
INSERT INTO `SERVICES` VALUES ('', 'ESP6', 'eSathiPlus - 6 Months', '', 6, 5802.36, 6400, 175, 'Y', '', 'PESP6', 'N', 0, 'N', 'Y');
INSERT INTO `SERVICES` VALUES ('', 'ESP12', 'eSathiPlus - 12 Months', '', 12, 8975.52, 9900, 245, 'Y', '', 'PESP12', 'N', 0, 'N', 'Y');

INSERT INTO `COMPONENTS` VALUES ('', 'I120', 'IntroCalls-120', '', 12, 100, 2, 'I', 'C', 120);

//New
INSERT INTO `COMPONENTS` VALUES ('', 'T12', 'Auto-apply - 12 months', '', 12, 100, 2, 'T', 'D', 0);
INSERT INTO `SERVICES` VALUES ('', 'I120', 'IntroCalls-120', '', 12, 6518.58, 7190, 240, 'N', 'I120', '', 'Y', 0, 'N', 'Y');
INSERT INTO `SERVICES` VALUES ('', 'T12', 'Response Booster - 12 months', '', 0, 1622.84, 1790, 54, 'N', 'T12', '', 'Y', 0, 'Y', 'Y');

use billing;

update billing.SERVICES SET DURATION='1' WHERE SERVICEID='I10';
update billing.SERVICES SET DURATION='2' WHERE SERVICEID='I20';
update billing.SERVICES SET DURATION='3' WHERE SERVICEID='I30';
update billing.SERVICES SET DURATION='4' WHERE SERVICEID='I40';
update billing.SERVICES SET DURATION='5' WHERE SERVICEID='I50';
update billing.SERVICES SET DURATION='6' WHERE SERVICEID='I60';
update billing.SERVICES SET DURATION='7' WHERE SERVICEID='I70';
update billing.SERVICES SET DURATION='8' WHERE SERVICEID='I80';
update billing.SERVICES SET DURATION='9' WHERE SERVICEID='I90';
update billing.SERVICES SET DURATION='10' WHERE SERVICEID='I100';
update billing.SERVICES SET DURATION='12',PRICE_RS_TAX='7195' WHERE SERVICEID='I120';

INSERT INTO `SERVICES` (`ID`, `SERVICEID`, `NAME`, `DESCRIPTION`, `DURATION`, `PRICE_RS`, `PRICE_RS_TAX`, `PRICE_DOL`, `PACKAGE`, `COMPID`, `PACKID`, `ADDON`, `SORTBY`, `SHOW_ONLINE`, `ACTIVE`, `MOST_POPULAR`, `FREEBIES`, `ENABLE`) VALUES ('', 'I1W', 'IntroCalls-2', '', 0, 0, 295, 10, 'N', 'I1W', '', 'Y', 0, 'N', 'Y', 'N', NULL, 'Y');
INSERT INTO `SERVICES` (`ID`, `SERVICEID`, `NAME`, `DESCRIPTION`, `DURATION`, `PRICE_RS`, `PRICE_RS_TAX`, `PRICE_DOL`, `PACKAGE`, `COMPID`, `PACKID`, `ADDON`, `SORTBY`, `SHOW_ONLINE`, `ACTIVE`, `MOST_POPULAR`, `FREEBIES`, `ENABLE`) VALUES ('', 'I2W', 'IntroCalls-5', '', 0, 0, 445, 15, 'N', 'I2W', '', 'Y', 0, 'N', 'Y', 'N', NULL, 'Y');
INSERT INTO `SERVICES` (`ID`, `SERVICEID`, `NAME`, `DESCRIPTION`, `DURATION`, `PRICE_RS`, `PRICE_RS_TAX`, `PRICE_DOL`, `PACKAGE`, `COMPID`, `PACKID`, `ADDON`, `SORTBY`, `SHOW_ONLINE`, `ACTIVE`, `MOST_POPULAR`, `FREEBIES`, `ENABLE`) VALUES ('', 'I110', 'IntroCalls-110', '', 11, 0, 6595, 220, 'N', 'I110', '', 'Y', 0, 'N', 'Y', 'N', NULL, 'Y');

UPDATE SERVICES SET PRICE_RS=ROUND(PRICE_RS_TAX/(1+(12.36/100)),2) WHERE SERVICEID IN('I1W','I2W','I110');
UPDATE SERVICES SET SORTBY=ID WHERE SERVICEID IN('I1W','I2W','I110');


update billing.COMPONENTS SET DURATION='1' WHERE COMPID='I10';
update billing.COMPONENTS SET DURATION='2' WHERE COMPID='120';
update billing.COMPONENTS SET DURATION='3' WHERE COMPID='I30';
update billing.COMPONENTS SET DURATION='4' WHERE COMPID='I40';
update billing.COMPONENTS SET DURATION='5' WHERE COMPID='I50';
update billing.COMPONENTS SET DURATION='6' WHERE COMPID='I60';
update billing.COMPONENTS SET DURATION='7' WHERE COMPID='I70';     
update billing.COMPONENTS SET DURATION='8' WHERE COMPID='I80';
update billing.COMPONENTS SET DURATION='9' WHERE COMPID='I90';
update billing.COMPONENTS SET DURATION='10' WHERE COMPID='I100';
update billing.COMPONENTS SET DURATION='12' WHERE COMPID='I120';

INSERT INTO `COMPONENTS` (`ID`, `COMPID`, `NAME`, `DESCRIPTION`, `DURATION`, `PRICE_RS`, `PRICE_DOL`, `RIGHTS`, `TYPE`, `ACC_COUNT`) VALUES ('', 'I1W', 'IntroCalls-2', '', 0.07, 100, 2, 'I', 'C', 2);
INSERT INTO `COMPONENTS` (`ID`, `COMPID`, `NAME`, `DESCRIPTION`, `DURATION`, `PRICE_RS`, `PRICE_DOL`, `RIGHTS`, `TYPE`, `ACC_COUNT`) VALUES ('', 'I2W', 'IntroCalls-5', '', 0.5, 100, 2, 'I', 'C', 5);
INSERT INTO `COMPONENTS` (`ID`, `COMPID`, `NAME`, `DESCRIPTION`, `DURATION`, `PRICE_RS`, `PRICE_DOL`, `RIGHTS`, `TYPE`, `ACC_COUNT`) VALUES ('', 'I110', 'IntroCalls-110', '', 11, 100, 2, 'I', 'C', 110);

UPDATE billing.COMPONENTS SET TYPE='D' WHERE COMPID LIKE 'I%' 










       
 

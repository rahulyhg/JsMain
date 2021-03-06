use billing;

UPDATE SERVICES SET PRICE_RS_TAX=895,PRICE_DOL=20,PRICE_RS=ROUND(PRICE_RS_TAX/1.103,2) WHERE SERVICEID='P6W';
UPDATE SERVICES SET PRICE_RS_TAX=999,PRICE_DOL=25,PRICE_RS=ROUND(PRICE_RS_TAX/1.103,2) WHERE SERVICEID='C6W';

UPDATE `DIRECT_CALL_COUNT` SET `COUNT` = '3' WHERE CONVERT( `SERVICEID` USING utf8 ) = 'P6W' AND `COUNT` = '4' LIMIT 1 ;
UPDATE `DIRECT_CALL_COUNT` SET `COUNT` = '5' WHERE CONVERT( `SERVICEID` USING utf8 ) = 'C6W' AND `COUNT` = '4' LIMIT 1 ;

INSERT INTO `SERVICES` ( `ID` , `SERVICEID` , `NAME` , `DESCRIPTION` , `DURATION` , `PRICE_RS` , `PRICE_RS_TAX` , `PRICE_DOL` , `PACKAGE` , `COMPID` , `PACKID` , `ADDON` , `SORTBY` , `SHOW_ONLINE` , `ACTIVE` )
VALUES (
'', 'P1W', 'e-Rishta -5 days', '', '0', '0', '0', '0', 'Y', '', 'PF1W', 'N', '0', 'N', 'Y'
), (
'', 'C1W', 'e-Value Pack -5 days ', '', '0', '0', '0', '0', 'Y', '', 'PC1W ', 'N', '0', 'N', 'Y'
);

INSERT INTO `PACK_COMPONENTS` ( `ID` , `PACKID` , `COMPID` )
VALUES (
'', 'PC1W', 'D1W'
), (
'', 'PC1W', 'F1W'
);

INSERT INTO `PACK_COMPONENTS` ( `ID` , `PACKID` , `COMPID` )
VALUES (
'', 'PF1W', 'F1W'
);

INSERT INTO `COMPONENTS` ( `ID` , `COMPID` , `NAME` , `DESCRIPTION` , `DURATION` , `PRICE_RS` , `PRICE_DOL` , `RIGHTS` , `TYPE` , `ACC_COUNT` )
VALUES (
'', 'F1W', 'Full Membership-5 days', '', '0.17', '0', '0', 'F', 'D', '0'
), (
'', 'D1W', 'Display -5 days ', '', '0.17', '0', '0', 'D', 'D', '0'
);

UPDATE SERVICES SET PRICE_RS_TAX=500,PRICE_DOL=10,PRICE_RS=ROUND(PRICE_RS_TAX/1.103,2) WHERE SERVICEID='P1W';
UPDATE SERVICES SET PRICE_RS_TAX=895,PRICE_DOL=20,PRICE_RS=ROUND(PRICE_RS_TAX/1.103,2) WHERE SERVICEID='C1W';

INSERT INTO `DIRECT_CALL_COUNT` ( `SERVICEID` , `COUNT` ) VALUES ( 'P1W', '1'), ('C1W', '3');


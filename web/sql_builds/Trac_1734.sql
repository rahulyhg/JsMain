UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'P2' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'B2' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'D2' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'C2' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'A2' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'T2' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'M2' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'L2' LIMIT 1 ;

UPDATE `SERVICES` SET `SHOW_ONLINE` = 'Y' WHERE `SERVICEID` = 'P3' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'Y' WHERE `SERVICEID` = 'B3' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'Y' WHERE `SERVICEID` = 'D3' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'Y' WHERE `SERVICEID` = 'C3' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'Y' WHERE `SERVICEID` = 'A3' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'Y' WHERE `SERVICEID` = 'T3' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'Y' WHERE `SERVICEID` = 'M3' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'Y' WHERE `SERVICEID` = 'L3' LIMIT 1 ;

UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'P4' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'B4' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'D4' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'C4' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'A4' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'T4' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'M4' LIMIT 1 ;
UPDATE `SERVICES` SET `SHOW_ONLINE` = 'N' WHERE `SERVICEID` = 'L4' LIMIT 1 ;

UPDATE `SERVICES` as a,`SERVICES` as b SET a.PRICE_RS_TAX=b.PRICE_RS_TAX,a.PRICE_DOL=b.PRICE_DOL,a.PRICE_RS=b.PRICE_RS WHERE a.SERVICEID='P3' and b.SERVICEID='P2';
UPDATE `SERVICES` as a,`SERVICES` as b SET a.PRICE_RS_TAX=b.PRICE_RS_TAX,a.PRICE_DOL=b.PRICE_DOL,a.PRICE_RS=b.PRICE_RS WHERE a.SERVICEID='B3' and b.SERVICEID='B2';
UPDATE `SERVICES` as a,`SERVICES` as b SET a.PRICE_RS_TAX=b.PRICE_RS_TAX,a.PRICE_DOL=b.PRICE_DOL,a.PRICE_RS=b.PRICE_RS WHERE a.SERVICEID='D3' and b.SERVICEID='D2';
UPDATE `SERVICES` as a,`SERVICES` as b SET a.PRICE_RS_TAX=b.PRICE_RS_TAX,a.PRICE_DOL=b.PRICE_DOL,a.PRICE_RS=b.PRICE_RS WHERE a.SERVICEID='C3' and b.SERVICEID='C2';
UPDATE `SERVICES` as a,`SERVICES` as b SET a.PRICE_RS_TAX=b.PRICE_RS_TAX,a.PRICE_DOL=b.PRICE_DOL,a.PRICE_RS=b.PRICE_RS WHERE a.SERVICEID='A3' and b.SERVICEID='A2';
UPDATE `SERVICES` as a,`SERVICES` as b SET a.PRICE_RS_TAX=b.PRICE_RS_TAX,a.PRICE_DOL=b.PRICE_DOL,a.PRICE_RS=b.PRICE_RS WHERE a.SERVICEID='T3' and b.SERVICEID='T2';
UPDATE `SERVICES` as a,`SERVICES` as b SET a.PRICE_RS_TAX=b.PRICE_RS_TAX,a.PRICE_DOL=b.PRICE_DOL,a.PRICE_RS=b.PRICE_RS WHERE a.SERVICEID='M3' and b.SERVICEID='M2';
UPDATE `SERVICES` as a,`SERVICES` as b SET a.PRICE_RS_TAX=b.PRICE_RS_TAX,a.PRICE_DOL=b.PRICE_DOL,a.PRICE_RS=b.PRICE_RS WHERE a.SERVICEID='L3' and b.SERVICEID='L2';


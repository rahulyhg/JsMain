use billing;
update billing.SERVICES SET SERVICEID='I2',COMPID='I2',NAME='We Talk For You - 2 Profiles' WHERE SERVICEID='I1W';
update billing.SERVICES SET SERVICEID='I5',COMPID='I5',NAME='We Talk For You - 5 Profiles' WHERE SERVICEID='I2W';
UPDATE billing.COMPONENTS SET COMPID='I2' WHERE COMPID='I1W';
UPDATE billing.COMPONENTS SET COMPID='I5' WHERE COMPID='I2W';


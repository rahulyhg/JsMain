use billing;

alter table REV_MASTER add SHIP_TO_ADDRESS VARCHAR(200), add SHIP_TO_PIN INT(10), ADD SHIP_TO_COUNTRY VARCHAR(50), ADD SHIP_TO_PHONE VARCHAR(15),ADD SHIP_TO_EMAIL VARCHAR(40),ADD SALE_TYPE VARCHAR(40),ADD SERVICE_TAX_CONTENT VARCHAR(250);

alter table REV_PAYMENT add BILL_TO_ADDRESS VARCHAR(200), add BILL_TO_PIN INT(10), ADD BILL_TO_COUNTRY VARCHAR(50), ADD BILL_TO_PHONE VARCHAR(15),ADD BILL_TO_EMAIL VARCHAR(40),ADD BILL_TO_NAME VARCHAR(30);

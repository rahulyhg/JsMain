use incentive;

ALTER TABLE incentive.PAYMENT_COLLECT ADD `PREFIX_NAME` varchar(5) NOT NULL, ADD `LANDMARK` varchar(250) NOT NULL;
ALTER TABLE incentive.LOG ADD `PREFIX_NAME` varchar(5) NOT NULL, ADD `LANDMARK` varchar(250) NOT NULL;


ALTER TABLE `SALES_CSV_DATA_FAILED_PAYMENT` ADD COLUMN `USERNAME` varchar(60) NOT NULL AFTER `PHONE_NO4`,ADD COLUMN `SERVICE_SELECTED` varchar(250) DEFAULT NULL AFTER `USERNAME`,ADD COLUMN `FP_ENTRY_DT` datetime DEFAULT NULL AFTER `SERVICE_SELECTED`,ADD COLUMN `DISCOUNT` int(4) DEFAULT NULL AFTER `FP_ENTRY_DT`,ADD COLUMN `ONLINE_STATUS` char(1) NOT NULL AFTER `DISCOUNT`,ADD COLUMN `LAST_AMOUNT_TRIED` int(4) DEFAULT NULL AFTER `ONLINE_STATUS`,ADD COLUMN `COUNTRY` varchar(60) DEFAULT NULL AFTER `LAST_AMOUNT_TRIED`;



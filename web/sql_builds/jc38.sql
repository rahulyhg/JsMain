USE billing;

ALTER TABLE `TRACKING_FAILED_PAYMENT_LOG` ADD `SOURCE` VARCHAR( 16 ) DEFAULT NULL ;

ALTER TABLE `TRACKING_FAILED_PAYMENT` ADD `SOURCE` VARCHAR( 16 ) DEFAULT NULL ;
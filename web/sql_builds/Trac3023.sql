use matchalerts;

ALTER TABLE  `MAILER` ADD  `FREQUENCY` TINYINT( 1 ) UNSIGNED NOT NULL ;

ALTER TABLE  `MAILER_TEMP` ADD  `FREQUENCY` TINYINT( 1 ) UNSIGNED NOT NULL ;

ALTER TABLE  `TOP_VIEW_COUNT` ADD  `SENT_DATE` SMALLINT( 6 ) ,ADD  `FREQUENCY` TINYINT( 1 ) UNSIGNED;

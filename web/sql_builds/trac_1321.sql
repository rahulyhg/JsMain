use duplicates;

ALTER TABLE  `DUPLICATE_CHECKS_FIELDS` ADD  `CASTE` SMALLINT UNSIGNED
NOT NULL ,
ADD  `MTONGUE` TINYINT UNSIGNED NOT NULL ;

ALTER TABLE  `DUPLICATE_CHECKS_FIELDS` ADD INDEX (  `CASTE` ,
`MTONGUE` );

ALTER TABLE  `DUPLICATE_CHECKS_FIELDS_LEGACY` ADD  `CASTE` SMALLINT
UNSIGNED NOT NULL ,
ADD  `MTONGUE` TINYINT UNSIGNED NOT NULL ;

ALTER TABLE  `DUPLICATE_CHECKS_FIELDS_LEGACY` ADD INDEX (  `CASTE` ,
`MTONGUE` );

use viewSimilar;

ALTER TABLE viewSimilar.TEMP_CONTACTS_CACHE_LEVEL2_MALE_RENAME ADD COLUMN  `AGE` TINYINT( 4 ) DEFAULT  '0',
ADD COLUMN  `PRIORITY` TINYINT( 4 ) DEFAULT  '0'

ALTER TABLE viewSimilar.TEMP_CONTACTS_CACHE_LEVEL2_FEMALE_RENAME ADD COLUMN  `AGE` TINYINT( 4 ) DEFAULT  '0',
ADD COLUMN  `PRIORITY` TINYINT( 4 ) DEFAULT  '0'


ALTER TABLE viewSimilar.CONTACTS_CACHE_LEVEL2_MALE ADD COLUMN  `AGE` TINYINT( 4 ) DEFAULT  '0',
ADD COLUMN  `PRIORITY` TINYINT( 4 ) DEFAULT  '0'

ALTER TABLE viewSimilar.CONTACTS_CACHE_LEVEL2_FEMALE ADD COLUMN  `AGE` TINYINT( 4 ) DEFAULT  '0',
ADD COLUMN  `PRIORITY` TINYINT( 4 ) DEFAULT  '0'



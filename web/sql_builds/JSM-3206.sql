use matchalerts;

ALTER TABLE  `MATCHALERTS_TO_BE_SENT` ADD  `MATCH_LOGIC` ENUM(  'O',  'N' ) DEFAULT  'N';

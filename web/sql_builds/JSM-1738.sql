ALTER TABLE newjs.OLDEMAIL DROP INDEX uni1;
ALTER TABLE newjs.OLDEMAIL ADD UNIQUE unique_index(PROFILEID,OLD_EMAIL);
 

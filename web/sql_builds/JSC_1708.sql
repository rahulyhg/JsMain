USE billing;

ALTER TABLE billing.EXCLUSIVE_MEMBERS CHANGE BILLING_DT BILLING_DT DATETIME DEFAULT '0000-00-00 00:00:00';
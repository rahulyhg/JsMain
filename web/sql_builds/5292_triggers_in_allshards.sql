use newjs;

DELIMITER |

CREATE TRIGGER CONTACTS_TRIGGER_I AFTER INSERT ON CONTACTS
FOR EACH ROW
BEGIN
INSERT IGNORE INTO test.CONTACTS_ACTIVE values(NEW.CONTACTID,NEW.SENDER,NEW.RECEIVER,NEW.TYPE,NEW.TIME,NEW.COUNT,NEW.MSG_DEL,NEW.SEEN,NEW.FILTERED,NEW.FOLDER);
END; |

CREATE TRIGGER CONTACTS_TRIGGER_U AFTER UPDATE ON CONTACTS
FOR EACH ROW
BEGIN
REPLACE INTO test.CONTACTS_ACTIVE values(NEW.CONTACTID,NEW.SENDER,NEW.RECEIVER,NEW.TYPE,NEW.TIME,NEW.COUNT,NEW.MSG_DEL,NEW.SEEN,NEW.FILTERED,NEW.FOLDER);
IF OLD.TIME<'2010-02-20' THEN
REPLACE INTO test.CONTACTS6_MONTHS_OLD_RECORD VALUES(NEW.SENDER,NEW.RECEIVER);
REPLACE INTO test.MESSAGE_LOG_ACTIVE SELECT * FROM MESSAGE_LOG WHERE SENDER=NEW.SENDER AND RECEIVER=NEW.RECEIVER;
REPLACE INTO test.MESSAGE_LOG_ACTIVE SELECT * FROM MESSAGE_LOG WHERE SENDER=NEW.RECEIVER AND RECEIVER=NEW.SENDER;
REPLACE INTO test.MESSAGES_ACTIVE SELECT A.ID, MESSAGE FROM MESSAGE_LOG A, MESSAGES B WHERE SENDER =NEW.SENDER AND RECEIVER =NEW.RECEIVER AND A.ID=B.ID;
REPLACE INTO test.MESSAGES_ACTIVE SELECT A.ID, MESSAGE FROM MESSAGE_LOG A, MESSAGES B WHERE SENDER=NEW.RECEIVER AND RECEIVER=NEW.SENDER AND A.ID=B.ID;
REPLACE INTO test.EOI_VIEWED_LOG_ACTIVE SELECT * FROM EOI_VIEWED_LOG WHERE VIEWER=NEW.RECEIVER AND VIEWED=NEW.SENDER;
REPLACE INTO test.EOI_VIEWED_LOG_ACTIVE SELECT * FROM EOI_VIEWED_LOG WHERE VIEWER=NEW.SENDER AND VIEWED=NEW.RECEIVER;
END IF;
END; |

CREATE TRIGGER CONTACTS_TRIGGER_D AFTER DELETE ON CONTACTS
FOR EACH ROW
BEGIN
DELETE FROM test.CONTACTS_ACTIVE WHERE CONTACTID=OLD.CONTACTID;
END; |

CREATE TRIGGER EOI_VIEWED_LOG_TRIGGER_I AFTER INSERT ON EOI_VIEWED_LOG
FOR EACH ROW
BEGIN
INSERT IGNORE INTO test.EOI_VIEWED_LOG_ACTIVE values(NEW.VIEWER,NEW.VIEWED,NEW.DATE);
END; |


CREATE TRIGGER EOI_VIEWED_LOG_TRIGGER_U AFTER UPDATE ON EOI_VIEWED_LOG
FOR EACH ROW
BEGIN
REPLACE INTO test.EOI_VIEWED_LOG_ACTIVE values(NEW.VIEWER,NEW.VIEWED,NEW.DATE);
END; |

CREATE TRIGGER EOI_VIEWED_LOG_TRIGGER_D AFTER DELETE ON EOI_VIEWED_LOG
FOR EACH ROW
BEGIN
DELETE FROM test.EOI_VIEWED_LOG_ACTIVE WHERE VIEWER=OLD.VIEWER AND VIEWED=OLD.VIEWED;
END; |

CREATE TRIGGER MESSAGE_LOG_TRIGGER_I AFTER INSERT ON MESSAGE_LOG
FOR EACH ROW
BEGIN
INSERT IGNORE INTO test.MESSAGE_LOG_ACTIVE values(NEW.SENDER,NEW.RECEIVER,NEW.DATE,NEW.IP,NEW.RECEIVER_STATUS,NEW.FOLDERID,NEW.MSG_OBS_ID,NEW.SENDER_STATUS,NEW.TYPE,NEW.ID,NEW.OBSCENE,NEW.IS_MSG,NEW.SEEN );
INSERT IGNORE INTO test.MESSAGE_LOG_6_TRACKING values(NEW.SENDER,NEW.RECEIVER,NEW.ID);
END; |

CREATE TRIGGER MESSAGE_LOG_TRIGGER_U AFTER UPDATE ON MESSAGE_LOG
FOR EACH ROW
BEGIN
REPLACE INTO test.MESSAGE_LOG_ACTIVE values(NEW.SENDER,NEW.RECEIVER,NEW.DATE,NEW.IP,NEW.RECEIVER_STATUS,NEW.FOLDERID,NEW.MSG_OBS_ID,NEW.SENDER_STATUS,NEW.TYPE,NEW.ID,NEW.OBSCENE,NEW.IS_MSG,NEW.SEEN );
END; |

CREATE TRIGGER MESSAGE_LOG_TRIGGER_D AFTER DELETE ON MESSAGE_LOG
FOR EACH ROW
BEGIN
DELETE FROM test.MESSAGE_LOG_ACTIVE WHERE ID=OLD.ID;
END; |

CREATE TRIGGER MESSAGES_TRIGGER_I AFTER INSERT ON MESSAGES
FOR EACH ROW
BEGIN
INSERT IGNORE INTO test.MESSAGES_ACTIVE values(NEW.ID,NEW.MESSAGE);
END; |

CREATE TRIGGER MESSAGES_TRIGGER_U AFTER UPDATE ON MESSAGES
FOR EACH ROW
BEGIN
REPLACE INTO test.MESSAGES_ACTIVE values(NEW.ID,NEW.MESSAGE);
END; |


CREATE TRIGGER MESSAGES_TRIGGER_D AFTER DELETE ON MESSAGES
FOR EACH ROW
BEGIN
DELETE FROM test.MESSAGES_ACTIVE WHERE ID=OLD.ID;
END; |

DELIMITER ;


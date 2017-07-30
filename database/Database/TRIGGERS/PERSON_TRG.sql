--------------------------------------------------------
--  DDL for Trigger PERSON_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "IMS"."PERSON_TRG" 
BEFORE INSERT ON PERSON 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.PID IS NULL THEN
      SELECT PERSONSEQ.NEXTVAL INTO :NEW.PID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "IMS"."PERSON_TRG" ENABLE;
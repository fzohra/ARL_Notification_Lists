-- Generated by Oracle SQL Developer Data Modeler 4.0.3.853
--   at:        2015-04-24 14:48:23 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g




DROP TABLE ARL_Division CASCADE CONSTRAINTS ;

DROP TABLE ARL_Document CASCADE CONSTRAINTS ;

DROP TABLE ARL_Employees CASCADE CONSTRAINTS ;

DROP TABLE ARL_Lab CASCADE CONSTRAINTS ;

DROP TABLE ARL_Members CASCADE CONSTRAINTS ;

DROP TABLE ARL_NL CASCADE CONSTRAINTS ;

DROP TABLE ARL_Subs CASCADE CONSTRAINTS ;

CREATE TABLE ARL_Division
  (
    division_id INTEGER NOT NULL ,
    code        VARCHAR2 (4),
    ARL_Lab_lab_id INTEGER
  ) ;
ALTER TABLE ARL_Division ADD CONSTRAINT ARL_Division_PK PRIMARY KEY ( division_id ) ;

CREATE TABLE ARL_Document
  (
    document_id   INTEGER NOT NULL ,
    filename      VARCHAR2 (4000) ,
    file_mimetype VARCHAR2 (512) ,
    file_charset  VARCHAR2 (512) ,
    file_data BLOB ,
    file_comments         VARCHAR2 (4000) ,
    tags                  VARCHAR2 (4000) ,
    ARL_Members_member_id INTEGER
  ) ;
ALTER TABLE ARL_Document ADD CONSTRAINT ARL_Document_PK PRIMARY KEY ( document_id ) ;

CREATE TABLE ARL_Employees
  (
    employee_id       INTEGER NOT NULL ,
    employee_name     VARCHAR2 (250) ,
    employee_lab      VARCHAR2 (4) ,
    employee_division VARCHAR2 (4) ,
    employee_status   VARCHAR2 (1) ,
    status_eff_date   DATE ,
    admin             VARCHAR2 (1)
  ) ;
ALTER TABLE ARL_Employees ADD CONSTRAINT ARL_Employees_PK PRIMARY KEY ( employee_id ) ;

CREATE TABLE ARL_Lab
  ( lab_id INTEGER NOT NULL , code VARCHAR2 (4)
  ) ;
ALTER TABLE ARL_Lab ADD CONSTRAINT ARL_Lab_PK PRIMARY KEY ( lab_id ) ;

CREATE TABLE ARL_Members
  (
    member_id                 INTEGER NOT NULL ,
    date_added                DATE ,
    ARL_Employees_employee_id INTEGER
  ) ;
ALTER TABLE ARL_Members ADD CONSTRAINT ARL_Members_PK PRIMARY KEY ( member_id ) ;

CREATE TABLE ARL_NL
  (
    list_seq_id             INTEGER NOT NULL ,
    list_name               VARCHAR2 (255) ,
    ownership_division_code VARCHAR2 (4) ,
    list_description        VARCHAR2 (3500) ,
    external_view_name      VARCHAR2 (50) ,
    list_status             VARCHAR2 (1) ,
    status_effective_date   DATE
  ) ;
ALTER TABLE ARL_NL ADD CONSTRAINT ARL_NL_PK PRIMARY KEY ( list_seq_id ) ;

CREATE TABLE ARL_Subs
  (
    sub_id                INTEGER NOT NULL ,
    ARL_NL_list_seq_id    INTEGER ,
    ARL_Members_member_id INTEGER ,
    ARL_NL_list_seq_id1   INTEGER
  ) ;
ALTER TABLE ARL_Subs ADD CONSTRAINT ARL_Subs_PK PRIMARY KEY ( sub_id ) ;

ALTER TABLE ARL_Division ADD CONSTRAINT ARL_Division_ARL_Lab_FK FOREIGN KEY ( ARL_Lab_lab_id ) REFERENCES ARL_Lab ( lab_id ) ;

ALTER TABLE ARL_Document ADD CONSTRAINT ARL_Document_ARL_Members_FK FOREIGN KEY ( ARL_Members_member_id ) REFERENCES ARL_Members ( member_id ) ;

ALTER TABLE ARL_Members ADD CONSTRAINT ARL_Members_ARL_Employees_FK FOREIGN KEY ( ARL_Employees_employee_id ) REFERENCES ARL_Employees ( employee_id ) ON DELETE CASCADE;

ALTER TABLE ARL_Subs ADD CONSTRAINT ARL_Subs_ARL_Members_FK FOREIGN KEY ( ARL_Members_member_id ) REFERENCES ARL_Members ( member_id ) ;

ALTER TABLE ARL_Subs ADD CONSTRAINT ARL_Subs_ARL_NL_FK FOREIGN KEY ( ARL_NL_list_seq_id ) REFERENCES ARL_NL ( list_seq_id ) ;

ALTER TABLE ARL_Subs ADD CONSTRAINT ARL_Subs_ARL_NL_FKv1 FOREIGN KEY ( ARL_NL_list_seq_id1 ) REFERENCES ARL_NL ( list_seq_id ) ;

ALTER TABLE ARL_Subs ADD CONSTRAINT One_Subscriber CHECK (
  (ARL_NL_list_seq_id1 IS NOT NULL AND ARL_Members_member_id IS NULL)
  or (ARL_Members_member_id IS NOT NULL AND ARL_NL_list_seq_id1 IS NULL)
);

-- Oracle SQL Developer Data Modeler Summary Report:
--
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ERRORS                                   0
-- WARNINGS                                 0

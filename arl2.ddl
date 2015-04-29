DROP SEQUENCE ARL_Division_seq ; 
create sequence ARL_Division_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Division_PK_trig 
; 

create or replace trigger ARL_Division_PK_trig 
before insert on ARL_Division
for each row 
begin 
select ARL_Division_seq.nextval into :new.division_id from dual; 
end; 
/

DROP SEQUENCE ARL_Document_seq ; 
create sequence ARL_Document_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Document_PK_trig 
; 

create or replace trigger ARL_Document_PK_trig 
before insert on ARL_Document
for each row 
begin 
select ARL_Document_seq.nextval into :new.document_id from dual; 
end; 
/

DROP SEQUENCE ARL_Employees_seq ; 
create sequence ARL_Employees_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Employees_PK_trig 
; 

create or replace trigger ARL_Employees_PK_trig 
before insert on ARL_Employees
for each row 
begin 
select ARL_Employees_seq.nextval into :new.employee_id from dual; 
end; 
/

DROP SEQUENCE ARL_Lab_seq ; 
create sequence ARL_Lab_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Lab_PK_trig 
; 

create or replace trigger ARL_Lab_PK_trig 
before insert on ARL_Lab
for each row 
begin 
select ARL_Lab_seq.nextval into :new.lab_id from dual; 
end; 
/

DROP SEQUENCE ARL_Members_seq ; 
create sequence ARL_Members_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Members_PK_trig 
; 

create or replace trigger ARL_Members_PK_trig 
before insert on ARL_Members
for each row 
begin 
select ARL_Members_seq.nextval into :new.member_id from dual; 
end; 
/

DROP SEQUENCE ARL_NL_seq ; 
create sequence ARL_NL_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_NL_PK_trig 
; 

create or replace trigger ARL_NL_PK_trig 
before insert on ARL_NL
for each row 
begin 
select ARL_NL_seq.nextval into :new.list_seq_id from dual; 
end; 
/

DROP SEQUENCE ARL_Subs_seq ; 
create sequence ARL_Subs_seq 
start with 100 
increment by 1 
nomaxvalue 
;
DROP TRIGGER ARL_Subs_PK_trig 
; 

create or replace trigger ARL_Subs_PK_trig 
before insert on ARL_Subs
for each row 
begin 
select ARL_Subs_seq.nextval into :new.sub_id from dual; 
end; 
/

DROP INDEX ARL_Members_member_id_FK_0 ;
CREATE INDEX ARL_Members_member_id_FK_0 ON ARL_Document(ARL_Members_member_id) ;
DROP INDEX ARL_Employees_employee_FK_1 ;
CREATE INDEX ARL_Employees_employee_FK_1 ON ARL_Members(ARL_Employees_employee_id) ;
DROP INDEX ARL_Members_member_id_FK_2 ;
CREATE INDEX ARL_Members_member_id_FK_2 ON ARL_Subs(ARL_Members_member_id) ;
DROP INDEX ARL_NL_list_seq_id_FK_3 ;
CREATE INDEX ARL_NL_list_seq_id_FK_3 ON ARL_Subs(ARL_NL_list_seq_id) ;
DROP INDEX ARL_NL_list_seq_id1_FK_4 ;
CREATE INDEX ARL_NL_list_seq_id1_FK_4 ON ARL_Subs(ARL_NL_list_seq_id1) ;

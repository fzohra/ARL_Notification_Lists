DROP SEQUENCE ARL_Division_seq ; 
create sequence ARL_Division_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Division_PK_trig 
before insert on ARL_Division
for each row 
begin 
select ARL_Division_seq.nextval into :new.division_id from dual; 
end; 
/
alter table ARL_Division add created date ; 
alter table ARL_Division add created_by VARCHAR2 (255) ; 
alter table ARL_Division add row_version_number integer ; 
alter table ARL_Division add updated date ; 
alter table ARL_Division add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Division_AUD_trig 
before insert or update on ARL_Division 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE ARL_Document_seq ; 
create sequence ARL_Document_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Document_PK_trig 
before insert on ARL_Document
for each row 
begin 
select ARL_Document_seq.nextval into :new.document_id from dual; 
end; 
/
alter table ARL_Document add created date ; 
alter table ARL_Document add created_by VARCHAR2 (255) ; 
alter table ARL_Document add row_version_number integer ; 
alter table ARL_Document add updated date ; 
alter table ARL_Document add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Document_AUD_trig 
before insert or update on ARL_Document 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE ARL_Employees_seq ; 
create sequence ARL_Employees_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Employees_PK_trig 
before insert on ARL_Employees
for each row 
begin 
select ARL_Employees_seq.nextval into :new.employee_id from dual; 
end; 
/
alter table ARL_Employees add created date ; 
alter table ARL_Employees add created_by VARCHAR2 (255) ; 
alter table ARL_Employees add row_version_number integer ; 
alter table ARL_Employees add updated date ; 
alter table ARL_Employees add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Employees_AUD_trig 
before insert or update on ARL_Employees 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE ARL_Lab_seq ; 
create sequence ARL_Lab_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Lab_PK_trig 
before insert on ARL_Lab
for each row 
begin 
select ARL_Lab_seq.nextval into :new.lab_id from dual; 
end; 
/
alter table ARL_Lab add created date ; 
alter table ARL_Lab add created_by VARCHAR2 (255) ; 
alter table ARL_Lab add row_version_number integer ; 
alter table ARL_Lab add updated date ; 
alter table ARL_Lab add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Lab_AUD_trig 
before insert or update on ARL_Lab 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE ARL_Members_seq ; 
create sequence ARL_Members_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Members_PK_trig 
before insert on ARL_Members
for each row 
begin 
select ARL_Members_seq.nextval into :new.member_id from dual; 
end; 
/
alter table ARL_Members add created date ; 
alter table ARL_Members add created_by VARCHAR2 (255) ; 
alter table ARL_Members add row_version_number integer ; 
alter table ARL_Members add updated date ; 
alter table ARL_Members add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Members_AUD_trig 
before insert or update on ARL_Members 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE ARL_NL_seq ; 
create sequence ARL_NL_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_NL_PK_trig 
before insert on ARL_NL
for each row 
begin 
select ARL_NL_seq.nextval into :new.list_seq_id from dual; 
end; 
/
alter table ARL_NL add created date ; 
alter table ARL_NL add created_by VARCHAR2 (255) ; 
alter table ARL_NL add row_version_number integer ; 
alter table ARL_NL add updated date ; 
alter table ARL_NL add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_NL_AUD_trig 
before insert or update on ARL_NL 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
end; 
/

DROP SEQUENCE ARL_Subs_seq ; 
create sequence ARL_Subs_seq 
start with 100 
increment by 1 
nomaxvalue 
;

create or replace trigger ARL_Subs_PK_trig 
before insert on ARL_Subs
for each row 
begin 
select ARL_Subs_seq.nextval into :new.sub_id from dual; 
end; 
/
alter table ARL_Subs add created date ; 
alter table ARL_Subs add created_by VARCHAR2 (255) ; 
alter table ARL_Subs add row_version_number integer ; 
alter table ARL_Subs add updated date ; 
alter table ARL_Subs add updated_by VARCHAR2 (255) ; 
/
create or replace trigger ARL_Subs_AUD_trig 
before insert or update on ARL_Subs 
for each row 
begin 
  if inserting then 
    :new.created := localtimestamp; 
    :new.created_by := nvl(wwv_flow.g_user,user); 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
    :new.row_version_number := 1; 
  elsif updating then 
    :new.row_version_number := nvl(:old.row_version_number,1) + 1; 
  end if; 
  if inserting or updating then 
    :new.updated := localtimestamp; 
    :new.updated_by := nvl(wwv_flow.g_user,user); 
  end if; 
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

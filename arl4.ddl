CREATE OR REPLACE TRIGGER  "ARL_NL_SET_SEDATE"
BEFORE
insert on "ARL_NL"
for each row
begin
:new.status_effective_date := localtimestamp;
end;

/
ALTER TRIGGER  "ARL_NL_SET_SEDATE" ENABLE
/

CREATE OR REPLACE TRIGGER  "ARL_NL_SET_STATUS"
BEFORE
insert on "ARL_NL"
for each row
begin
:new.list_status := 'A';
end;

/
ALTER TRIGGER  "ARL_NL_SET_STATUS" ENABLE
/

CREATE OR REPLACE TRIGGER  "ARL_MEMBERS_DATE_ADDED"
BEFORE
insert on "ARL_MEMBERS"
for each row
begin
:new.date_added := localtimestamp;

end;

/
ALTER TRIGGER  "ARL_MEMBERS_DATE_ADDED" ENABLE
/

-- create function to check if a user is an admin
create or replace function "IS_ADMIN"
(user_name in VARCHAR2,
group_count in NUMBER default 0)
return BOOLEAN
is
begin
SELECT count(*) into GROUP_COUNT
FROM   apex_workspace_group_users awgu
WHERE awgu.GROUP_NAME = 'Admins' AND awgu.USER_NAME=USER_NAME;

RETURN (GROUP_COUNT > 0);

end;
/

-- constraint that status must be A or I
alter table "ARL_EMPLOYEES" add constraint
"ARL_EMPLOYEES_STATUS" check ( "EMPLOYEE_STATUS" ='A' or "EMPLOYEE_STATUS"='I')
/

alter table "ARL_NL" add constraint
"ARL_NL_LIST_NAME" check ( "LIST_NAME" IS NOT NULL)
/
alter table "ARL_NL" add constraint
"ARL_NL_LIST_DESCRIPTION" check ( "LIST_DESCRIPTION" IS NOT NULL)
/



-- create function to get logged in user's division
create or replace function "GET_USER_DIVISION"
(user_name in VARCHAR2)
return VARCHAR2
is
begin
DECLARE
e_id number;
e_div_id number;
div_code varchar2(4);
BEGIN
select am.employee_id into e_id from ARL_MEMBERS am
where am.user_name=user_name;

select employee_division into e_div_id from ARL_EMPLOYEE where employee_id=e_id;
select code into div_code from ARL_division where division_id = e_div_id;

return div_code;
END;
end;
/


alter table "ARL_SUBS" add constraint
"ARL_SUBS_ONE_TYPE" check ( ("ARL_NL_LIST_SEQ_ID1" IS NOT NULL AND "ARL_MEMBERS_MEMBER_ID" IS NULL)
  or ("ARL_MEMBERS_MEMBER_ID" IS NOT NULL AND "ARL_NL_LIST_SEQ_ID1" IS NULL))
/


alter table "ARL_SUBS" add constraint
"ARL_SUBS_NOT_SELF" check ( ("ARL_NL_LIST_SEQ_ID1" != "ARL_NL_LIST_SEQ_ID"))
/

alter table "ARL_MEMBERS" modify
("ARL_EMPLOYEES_EMPLOYEE_ID" NUMBER(38, 0) NOT NULL)
/

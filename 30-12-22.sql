create table my_users (
user_id number,
user_name varchar2(20),
user_password varchar2(20),
user_activated number default 0,
primary key(user_id));
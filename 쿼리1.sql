select * from actor;
alter table actor add column age int(5) not null default 0 after last_name;
desc actor;
alter table actor change age nai int(5);
desc actor;
alter table actor modify nai varchar(10);
desc actor;
alter table actor rename kactor;
desc kactor;
alter table kactor drop nai;
desc kactor;

create table actor as
select *
from kactor;

drop table kactor;
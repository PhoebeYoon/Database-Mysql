desc actor;
insert into actor
(actor_id,first_name, last_name, last_update)
values (201,'Hong',"Gildong", now());
select * from actor;

insert into actor
values(202,'전','우치', now());
select * from actor;


insert into actor
(actor_id,first_name)
values (203, '김철수');
select * from actor;
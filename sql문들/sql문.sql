SELECT * FROM testdb.actor;
select last_name , count(last_name) from testdb.actor 
group by last_name ;


select last_name ,count(last_name) from testdb.actor group by last_name;
select last_name ,count(last_name) from testdb.actor group by last_name order by last_name desc; 

-- 아래 2개의 결과는 동일합니다 
select last_name ,first_name from testdb.actor  group by last_name, first_name order by last_name; 
select last_name ,first_name from testdb.actor  order by last_name, first_name;
-- first_name으로 그룹화하는 의미가 없습니다. 

select last_name ,first_name from testdb.actor  order by last_name desc, first_name;
select last_name ,first_name from testdb.actor  order by last_name desc, first_name desc;


-- last_name으로 그룹화하고 first_name으로 다시 그룹화하고 싶다면 아래 구문처럼 적으면 에러가 납니다. 
-- 다다음줄처럼 기술해야 합니다. 
-- select last_name ,first_name from testdb.actor  group by last_name order by first_name; 
select last_name ,first_name from testdb.actor  group by last_name, first_name order by last_name, first_name;


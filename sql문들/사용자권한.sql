-- use mysql;
-- show tables;
select * from user;
create user 'general1'@'localhost' identified by '1234';
create user 'admin'@'%' identified by 'admin1234';
grant all privileges on testdb.* to 'general1'@'localhost';

-- 사용자 권한 삭제
revoke delete on testdb.* from 'general1'@'localhost' ;
use mysql;
select * from user;
-- 사용자 권한조회
show grants for 'general1'@'localhost';

-- 사용자 삭제
drop user 'general1'@'localhost';
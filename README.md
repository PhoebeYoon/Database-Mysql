###### :cactus:  Mysql 

우리는 이미 테이블을 생성하고 데이터를 입력하면서 기본키와 외래키를 사용해 보았습니다.  
아래의 예제는 해당 부분만 포커스를 맞춰서 다시 한번 실행해 


``` 
-- 기본키를 가진 테이블 생성

CREATE TABLE member_girl(
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    PRIMARY KEY (mem_id)
);

drop table member_girl;


-- 기본키없이 테이블 생성
CREATE TABLE member_girl (
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);

alter table member_girl add constraint primary key(mem_id)

CREATE TABLE member_girl(
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    PRIMARY KEY (mem_id)
);

drop table member_girl;


-- 기본키없이 테이블 생성
CREATE TABLE member_girl (
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);

alter table member_girl add constraint primary key(mem_id)

```
delete문 사용시 에러가 발생하면 edit > preferences > sql editor 선택 > 오른쪽맨하단에 Safe Updates ~~ 체크해제 합니다


### delete문 vs truncate 문으로 삭제하기



### select 문 + limit 문

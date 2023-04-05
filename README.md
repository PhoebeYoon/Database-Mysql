###### :cactus:  Mysql


workbench실행 후 원하는 스키마를 선택할때 use 명령대신 해당 스카마를 더블클릭해서 선택할 수도 있습니다. 선택되었다면 <b>굵은글자</b>로 표시됩니다.   

### select 문
```
모든 내용을 보고 싶을 때  
select * from wellknowpeople;
테이블이름이 좀 길죠 그래서 'as' 별칭으로 해도 됩니다 
select * from wellknowpeople  as wp;

select * from actor;
select first_name, last_name from actor;
```
> 별칭을 사용할때는 as를 사용한다고 외웁시다

### 컬럼 추가
```
alter table [테이블명] add [컬럼명] [타입] [옵션]; 
ex) alter table [테이블명] add [컬럼명] varchar(100) not null default '0'; 
```
###  컬럼 삭제
``` alter table [테이블명] drop [컬럼명];```


###  컬럼명 변경 및 타입 변경
``` alter table [테이블명] change [컬럼명] [변경할컬럼명] varchar(12);```

###  컬럼 타입 수정
``` alter table [테이블명] modify [컬럼명] varchar(14);```

### 테이블명 수정
``` alter table [테이블명] rename [변경할테이블명];```
### 테이블 삭제
```drop table [테이블명]; ```



#### 아래의 내용을 따라해 보세요
``` 
alter table actor add column age int(5) not null default 0 after last_name;
desc actor;
```    
actor 테이블에 age라는 칼럼을 생성하되 int(5)의 크기로 하고 디폴트값은 0으로 주고, 순서는 last_name전에 생성한다는 뜻이다.  
<img width="337" alt="스크린샷 2023-04-04 오후 3 22 54" src="https://user-images.githubusercontent.com/48478079/229705426-bb8fee1b-2819-4493-9a58-87125f387be2.png">

```
alter table actor change age nai int(5);
desc actor;
alter table actor modify nai varchar(10);
desc actor;
alter table actor rename kactor;
desc kactor;

create table actor as
select *
from kactor;

drop table kactor;
``` 

이미 만들어진 테이블에서 데이터를 가져다가 새로운 테이블을 생성했습니다.  


이제까지 우리는 이미 만들어진 데이터들을 사용했습니다. 이제 우리가 직접만들고 데이터를 넣으려고 합니다. 
테이블에 데이터를 넣을때 다음의 내용에 주의하세요 몇가지 기억해야 할 것들이 있습니다.

| 키워드 |	설명 |
|---|---|
| AUTO_INCREMENT	|새 행 생성시마다 자동으로 1씩 증가 |
| PRIMARY KEY	|중복 입력 불가, NULL(빈 값) 불가 |
| UNIQUE|	중복 입력 불가 |
| NOT NULL|	NULL(빈 값) 입력 불가 |
| UNSIGNED	|(숫자일시) 양수만 가능 |
| DEFAULT	|값 입력이 없을 시 기본값 |




### 테이블에 테이터넣기 insert into
```
desc actor;
insert into actor
(actor_id,first_name, last_name, last_update)
values (201,'Hong',"Gildong", now());
select * from actor;

insert into actor
values(202,'전','우치', now());
select * from actor;
```    
모든 필드에 내용을 넣고자한다면 필드명을 생략할 수 있다.   


#### 첨부된 sql문으로 실습해봅시다 

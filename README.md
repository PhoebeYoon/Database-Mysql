###### :cactus:  Mysql

## 가장 중요한 SQL 명령 중 일부
- SELECT - 데이터베이스에서 데이터를 추출합니다   
- UPDATE - 데이터베이스의 데이터를 업데이트합니다   
- DELETE - 데이터베이스에서 데이터를 삭제합니다   
- INSERT INTO - 데이터베이스에 새 데이터를 삽입합니다    
- CREATE DATABASE  - 새 데이터베이스를 만듭니다   
- ALTER DATABASE - 데이터베이스를 수정합니다   
- CREATE TABLE - 새 테이블을 만듭니다   
- ALTER TABLE - 테이블을 수정합니다   
- Drop TABLE - 테이블을 삭제합니다     
- CREATE INDEX - 인덱스(검색 키)를 만듭니다    
- Drop INDEX - 인덱스를 삭제합니다     


## workbench를 이용하여 다음을 실행해봅시다. 

### 새로운 데이터베이스, 새로운 테이블을 만들어보겠습니다.  
``` 
create database testdb;
show databases ;  
그리고 아래 명령을 바로 주면 에러가 뜹니다. 왜냐고요? 테이블을 어디에 만들어야 되는지 모르니까요?
(use testdb; )
CREATE TABLE Persons ( 
    PersonID int, 
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);
desc Persons;
show tables;
drop table persons;  <-- drop table Persons 라고 입력해도 지워집니다.
```  
실행결과를 확인하세요 
위의 명령을 반복할때는 블록으로 지정한 뒤 번개모양 아이콘을 클릭하시면 됩니다.   
>한 줄 실행할때는 ctrl + enter ,   
>여러줄을 할때는 블록으로 지정한 후 번개아이콘을 클릭합니다.  
> 명령문앞에 '-- ' 붙이면 주석처리되어 실행되지 않습니다.   
 
#### 실행후 결과가 안 보인다고 생각하시면 왼쪽패널의 리플레시 아이콘을 클릭합니다 
### 이제 기존 테이블을 이용해서 새로운 테이블을 만들어보겠습니다. 
```  
create table student as
select firstname, city
from person;
desc student;
```

<img width="450" alt="스크린샷 2023-04-04 오후 1 59 33" src="https://user-images.githubusercontent.com/48478079/229691145-e07ddd28-92a4-46a8-b536-e786187542f6.png">

### 다른 디비에 있는 테이블에서 칼럼을 가져와 테이블을 만듭니다. 
```
create table othertable as
select actor_id
from sakila.actor;
```




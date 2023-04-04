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


## 외부에 있는 sql로 된 파일을 import해 봅시다
1. 첨부된 파일의 압축을 풀면 'sakila'라는 이름으로 되어 있습니다. 그 폴더안에는 많은 .sql 파일을 모두 불러올 예정입니다.
2. workbench를 실행시키고 같은 이름의 스키마를 만듭니다. 
3. 왼쪽패널 > 'Administration' > Data Import / Restore 
4. 'Import from Dump Project Folder'에서 압축해제한 폴더를 선택합니다.  그러면 아래쪽에 스키마에 'sakila' 나타납니다.
5. 이름을 클릭하면 오른쪽 칸에 sql 파일이 쭈욱 나타납니다.
6. 우측 아래쪽의 'Start Import' 버튼을 클릭합니다. 

<img width="671" alt="스크린샷 2023-04-04 오후 2 24 19" src="https://user-images.githubusercontent.com/48478079/229698052-699e9fae-a427-4e94-86f3-028656fbc75c.png">

<img width="124" alt="스크린샷 2023-04-04 오후 2 43 07" src="https://user-images.githubusercontent.com/48478079/229698326-a933c53a-fc81-4e4e-8af7-b2ed702bc199.png">

전체가 아닌 일부만 import할 수도 있습니다.   

<img width="452" alt="스크린샷 2023-04-04 오후 2 30 09" src="https://user-images.githubusercontent.com/48478079/229698749-2aefc6f3-defd-4027-b57d-d56fc0e07022.png">


이때 중요한 것은 임폴트하려는 스키마를 먼저 생성해놓고 import 시킵니다. 그렇지 않으면 
'ERROR 1049 (42000): Unknown database' 가 발생합니다. 

여기까지 잘 실습이 되었다면 아래의 명령을 실습해보겠습니다. 

```
-- 현재 testdb에 있습니다.
create tabel wellknownpeople as
select title, release_year, rating
from sakila.film;
```    
결과를 확인해보십시요.   
이렇게해서 스카마 생성, 삭제, 테이블삭제, 다른 디비에서 테이블가져오기, 외부파일가져오기등을 실습했습니다.
다음 레슨에서는 테이블안의 내용을 가지고 실습해보도록 하겠습니다




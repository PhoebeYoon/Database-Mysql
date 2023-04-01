###### :cactus:  Mysql

## 커맨드라인에서 mysql 사용해보기
### mysql 접속 및 종료, 비번변경
``` 
mysql -uroot -p
Enter password:  비번 입력합니다 
mysql> <-- 요렇게 프롬프트가 나오는지 확인하세  
(mysql설치시 샘플용 디비가 있습니다 이것을 사용해 보겠습니다)
mysql>SHOW DATABASES; <-- 끝에 's' 있습니다  
```    
<img width="200" alt="스크린샷 2023-04-01 오전 10 39 10" src="https://user-images.githubusercontent.com/48478079/229259769-b92a8161-bcb9-469a-8feb-45efbcfad5d9.png">

```  mysql>exit  <-- 종료합니다  ```

👮 mysql는 대소문자를 구분하지 않지만 명령어끝에 세미콜론(;) 잊지마세요   
👮 명령프롬프트에는 모양이 여러개 있을 수 있습니다 
```  
mysql> 새로운 명령어를 위한 준비
-> 다중 라인 명령어의 다음 라인 대기 상태으로 세미콜론을 빠드리면 이런 기호가 나옵니다 이때 ';'를 입력하고 빠져나옵니다 
> 이런모양이 나오면 같은 것으로 시작한 것의 완결을 기다리는 것입니다. 
```    
#### 비번을 변경해 보겠습니다 
내 mysql의 상태를 알려면  ``` mysql> status;  ```    
내 mysql의 패스워드를 바꿔보겠습니다. 이것은 비번을 이미 알고 있는 상태로  mysql에 접속한 후에 아래와 같이 실행합니다. 
``` 
mysql>ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '새비번';
mysql> select authentication_string from user;
``` 
여기서 2번째 문장은 비번을 그냥 글자그대로 저장하면 안되겠지요.  어떤 상태로 비번이 저장되어 있는지 보여주는 것입니다.  
해쉬화되어서 즉 암호화되어서 저장되어 있는 상태라고 보시면 됩니다.   
<img width="300" alt="스크린샷 2023-04-01 오전 11 11 12" src="https://user-images.githubusercontent.com/48478079/229260997-9d7f6915-95d8-4520-be68-fb7f24cd292b.png">   
(해쉬화는... 다음 기회에 설명드리겠습니다. 몇줄로 설명하기에는 좀... )   


### 특정 데이터베이스의 내용을 보겠습니다.
```
mysql>use information_schema; <-- use 데이터베이스이름 
Database changed 라고 메시지가 나옵니다 
mysql>show tables;  <-- 데이터베이스안에 있는 테이블들을 볼수 있습니다. 
mysql>use sys;
Database changed 라고 메시지가 나옵니다 
mysql> show tables;  <-- 출력내용이 다른것을 확인합니다
``` 

이제까지 mysql 실행, 종료, 데이타베이스들 보기, 특정 데이터베이스 선택, 선택한 데이터베이스안에 있는 테이블들 보기 까지 실습하셨습니다.
여기에 사용된 명령어들 몇개되지 않으니 기억하시겠죠! 



## SQL이란? (Structured Query Language)
RDBMS의 데이터를 관리하기 위해 만들어진 언어입니다.  DB 권한설정, 테이블 CRUD, 데이터 CRUD는 SQL을 통해 이루어진다고 할 수 있습니다. 

1. DCL (Data Control Language):
데이터베이스에 접근할 수 있는 사용자들의 권한을 관리하는 명령어입니다. (grant, revoke) 비유하자면 학년 정보(데이터베이스)에는 담임 선생님만 접근할 수 있게...

2. DDL (Data Definition Language):
테이블 CRUD를 위한 명령어입니다. (create, alter, drop, rename ..) 비유하자면 출석부엔 어떤 컬럼을 넣을 것인가.. (학번, 이름, 출석여부 등..)

3. DML (Data Manipulation Language):
실제 테이블에 있는 데이터를 CRUD하기 위한   명령어입니다. (select, insert, update, delete...) 비유하자면 실제 출석부에 데이터를 넣는 것.   


## SQL 기본은 CRUD ( Create Read Update Delete )

SQL도 관계형 데이터베이스에서 CRUD를 하기 위해 존재합니다.  

### 생성 (insert)
INSERT INTO 테이블이름(컬럼이름1, 컬럼이름2, 컬럼이름3, ...) VALUES (데이터값1, 데이터값2, 데이터값3, ...)
### 수정 (update)
UPDATE 테이블이름 SET 컬럼이름1=데이터값1, 컬럼이름2=데이터값2, ... WHERE 필드이름=데이터값
### 삭제 (delete)
DELETE FROM 테이블이름 WHERE 필드이름=데이터값  

### 조회 (select)
select 컬럼 from 테이블 where 조건
- select
- join
- sub query
- group query
- condition



## DB 외부접속 
<img width="450" alt="스크린샷 2023-03-30 오후 6 48 27" src="https://user-images.githubusercontent.com/48478079/228798278-82a1cd37-188c-46c7-86aa-b18e84f40e2d.png"> 
      
      
      
```
var mysql = require('mysql');
var connection = mysql.createConnection({
      host :'localhost',
      user:'root',
      password :'비번',
      database :'데이터베이스이름'
});

connection.connect();

connection.query(' SELECT * FROM topic', function(err, results, fields){
      if(err){
            console.log(err)
      } 
      console.log(results);
})
connection.end();
-----------------------------------
터미널에서 >npm install mysql 엔터
터미널에서 >node mysql 엔터 (터미널에 테이블의 내용이 출력되는지 확인)
```

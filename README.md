###### :cactus:  Mysql

## 커맨드라인에서 mysql 사용해보기
### mysql 접속 및 종료, 비번변경
``` 
mysql -uroot -p
Enter password:  비번 입력합니다 
mysql> <-- 요렇게 프롬프트가 나오는지 확인하세요  
(mysql설치시 샘플용 디비가 있습니다 이것을 사용해 보겠습니다, 명령어는 대소문자를 구분하지 않고 명령어끝에 세미콜론을 꼭 입력해야 합니다)
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
#### 일반적인 설치환경을 알아봅시다   
- 내 mysql의 상태를 알려면  ``` mysql> status;  ```   



### 특정 데이터베이스로 이동하고 그 안의 테이블들을 보겠습니다.
```
mysql>use information_schema; <-- use 데이터베이스이름 
Database changed 라고 메시지가 나옵니다 
mysql>show tables;  <-- 데이터베이스안에 있는 테이블들을 볼수 있습니다. 
mysql>use sys;
Database changed 라고 메시지가 나옵니다 
mysql> show tables;  <-- 출력내용이 다른것을 확인합니다
``` 

- information_schema 스카마는  MySQL서버가 운영하는 모든 다른 데이터베이스에 대한 정보를 저장하는 장소입니다. 그 중에는 데이터베이스 이름, 테이블 이름, 컬럼의 자료형, 접근 권한 처럼 SQL Injection공격에 이용될 정도로 민감한 정보도 포함되어 있습니다.   
- sys 스카마 : . MySQL 서버가 실행될 때 필요한 정보를 저장하는 테이블이 포함되어 있습니다.




```  
test>show databases;
test>use 데이터베이스 중 하나 선택해서 이름을 적고
test> show tables; <-- 어떤 table이 있는지 확인만 하세요
```    
mysql 데이터베이스의 테이블들을 보면 아래와 같은 테이블명이 있습니다.   
- mysql테이블은 시스템 데이터베이스로 mysql서버가 운영될때 필요한 정보들을 가지고 있습니다.
- user 테이블 : 사용자와 각 사용자의 디비 접근할 수 있는 권한에 대한 내용을 갖고 있습니다.   
- db 테이블 : 각 디비에 대한 사용자 사용권한에 대한 내용을 갖고 있습니다.


#### 비번을 변경해 보겠습니다 
내 mysql의 패스워드를 바꿔보겠습니다. 이것은 비번을 이미 알고 있는 상태로  mysql에 접속한 후에 아래와 같이 실행합니다. 

``` 
mysql>use mysql;
mysql>show tables;
mysql>ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '새비번';
mysql> select authentication_string from user;  <-- 현재 mysql 데이터베이스 이용중입니다 이곳에 user 이 있습니다 
```  

여기서  비번을 그냥 글자그대로 저장하면 안되겠지요.  어떤 상태로 비번이 저장되어 있는지 보여주는 것입니다.  
해쉬화되어서 즉 암호화되어서 저장되어 있는 상태라고 보시면 됩니다.   
<img width="400" alt="스크린샷 2023-04-01 오전 11 11 12" src="https://user-images.githubusercontent.com/48478079/229260997-9d7f6915-95d8-4520-be68-fb7f24cd292b.png">    




이제까지 mysql 실행, 종료, 데이타베이스들 보기, 특정 데이터베이스 선택, 선택한 데이터베이스안에 있는 테이블들 보기 까지 실습하셨습니다.
여기에 사용된 명령어들 몇개되지 않으니 기억하시겠죠! 

## 해쉬코드는 함호화 해시 함수를 이용합니다.
아래는 해쉬함수를 뭔지를 체험할 수 있는 사이트입니다. 그냥 재미삼아 해보세요   
https://sha256algorithm.com/

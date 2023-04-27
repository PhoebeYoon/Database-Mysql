###### :cactus:  Mysql

RDBMS에서의 스키마는 테이블의 구조를 정의합니다. noSql의 장점중 하나는 스키마가 없다는 것인데 즉 데이터구조가 RDMBS처럼, 정해진 테이블구조가 없다는 의미입니다.   
RDMBS에서는 데이터를 효율적으로 다루기 위해서는 규칙, 형식 즉 스키마라는 필요하고 이것에 따라 데이터를 입력해야 합니다.  
만약 데이터베이스에 전화번호와 이름을 저장하고자 한다면 이름을 몇글자까지 저장할지? 전화번호를 숫자형식으로 할지 정수인지 실수인지등을 미리 정해야 한다는 것입니다.  
해당 데이터베이스를 사용하다가 필요가 있어서 '직업'(예)항목을 추가하고자 한다면 몇 사람에게만 해당 항목을 적용할 수는 없고 전체 테이블에 적용해야 합니다.  그러니 테이블을 생성할때는 여러가지를 고려해서 결정해야 합니다.

또한 스키마라는 것이 mysql에만 있는 것이 아닙니다.json, xml에서도 스키마가 있습니다.   
더 자세한 내용은 실습을 진행하면서 또 설명드리겠습니다.  

## 현재 데이터베이스와 현재 사용자 확인하기
```
mysql>select database();
mysql>select user();
```

## 데이터베이스 생성 및 삭제
```
mysql>CREATE database db1; <-- 디비이름은 유일한것으로 지정합니다
mysql>Create database db2;
mysql>create database db3; 
mysql>show databases;

mysql>DROP database db1;
mysql>Drop database db2;
mysql>drop database db3;
mysql>SHOW databases;
```

## 터미널에서 테이블생성, 삭제   
테이블 생성 형식은 다음과 같습니다. 테이블을 생성하기 전에 데이터베이스를 지정해야 합니다. 새로운 데이터베이스, <b>webdb</b>를 생성합니다. 

1. CREATE
```
CREATE TABLE table_name (
                column1 datatype,
                column2 datatype,
                ....); 
```  

Example 
```
CREATE TABLE EMPLOYEE (
  empId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  dept TEXT NOT NULL
); 
```    

터미널에서 무조건 하나를 만들어 보겠습니다.   
```
mysql> use webdb;
Database changed 
mysql> create table stdent_info(
    -> code char(5) not null,
    -> title varchar(50) not null,
    -> writer varchar(20),
    -> price int(8) not null,
    -> primary key(code)
    -> );
```
여기까지 하면 'Query OK, ~ ' 라는 메시지가 나옵니다. 

```
mysql> show tables; 
mysql> desc stdent_info # 테이블의 구조를 알고 싶을때 desc 명령을 사용합니다   
```   
실행결과는 아래와 같습니다.  
<img width="465" alt="스크린샷 2023-04-01 오후 6 51 45" src="https://user-images.githubusercontent.com/48478079/229279114-372bfd1c-57b8-4574-a0a1-90f511e09139.png">

위의 내용을 잘 실행했다면 테이블이름에 'u'가 빠져있을 것입니다. 그래서 테이블의 이름을 변경해보겠습니다.  

```   
mysql>alter table stdent_info rename student_info;
mysql>show tables;
# 이제 name , tel, address 칼럼을 가진 형식은 모두 char(50)인 테이블을 3개를 만들어봅니다. 테이블이름은 임의로 지정합니다
# 이제 여러개의 테이블의 이름을 한꺼번에 변경해보겠습니다
mysql>rename table 기존테이블이름 to newtable1, 기존테이블이름 to newtable2, 기존테이블이름 to newtable3;
mysql>show tables;
mysql>drop table newtabel1, newtable2, newtable3;  <-- 테이블을 삭제합니다   
mysql>show tables;
```
 




## mysql 데이터타입  

| 문자형 데이터타입 |  설명 | 
|---|---|
|CHAR(n)	|고정 길이 데이터 타입(최대 255byte)- 지정된 길이보다 짦은 데이터 입력될 시 나머지 공간 공백으로 채워진다. |
|VARCHAR(n)|	가변 길이 데이터 타입(최대 65535byte)- 지정된 길이보다 짦은 데이터 입력될 시 나머지 공간은 채우지 않는다.|
|TINYTEXT(n)|문자열 데이터 타입(최대 255byte) |
|TEXT(n)|	문자열 데이터 타입(최대 65535byte) |
|MEDIUMTEXT(n)	| 문자열 데이터 타입(최대 16777215byte) |
|LONGTEXT(n)|	문자열 데이터 타입(최대 4294967295byte) |
|JSON	|문자열 데이터 타입 - JSON 형태의 포맷을 꼭 준수해야 한다.|

|숫자형 데이터 타입 |  설명 |
|---|---|
|TINYINT(n)	| 정수형 데이터 타입(1byte) -128 ~ +127 또는 0 ~ 255수 표현할 수 있다. |
|MALLINT(n)	| 정수형 데이터 타입(2byte) -32768 ~ 32767 또는 0 ~ 65536수 표현할 수 있다.|
|INT(n)	| 정수형 데이터 타입(4byte) -2147483648 ~ +2147483647 또는 0 ~ 4294967295수 표현할 수 있다. |
|FLOAT(길이, 소수)	| 부동 소수형 데이터 타입(4byte) -고정 소수점을 사용 형태이다. |


|날짜형 데이터 타입 |  설명 |
|---|---|
| DATE	| 날짜(년도, 월, 일) 형태의 기간 표현 데이터 타입(3byte) |
|TIME	| 시간(시, 분, 초) 형태의 기간 표현 데이터 타입(3byte) |
|YEAR	| 년도 표현 데이터 타입(1byte) |
| DATETIME| 	날짜와 시간 형태의 기간 표현 데이터 타입(8byte)|
| 이진 데이터유형 | 설명 |
|BINARY(n) & BYTE(n)	| CHAR의 형태의 이진 데이터 타입 (최대 255byte) |
|VARBINARY(n)	| VARCHAR의 형태의 이진 데이터 타입 (최대 65535byte)|
|BLOB(n)	| 이진 데이터 타입 (최대 65535byte) |


이외에도 데이터타입이 있으니 지금은 이 정도까지만 알고 넘어가겠습니다.   

## Mysql cheat Sheet 
브라우저에 'mysql cheat sheet' 로 검색하시면 매우 많은 검색결과가 있습니다. 그중에서 원하시는 것을 선택하여 사용하셔도 좋습니다. 또는 온라인으로도 제공되는 것도 있습니다    
예) https://devhints.io/mysql 


🛰️ 여기서 우리는 왜 이렇게 데이터형을 지정해야 하는지 잠시 살펴보겠습니다.  
사용자는 데이터를 마음대로 입력합니다. 예를들어 이름을 입력할때도 '홍길동', '홍 길동', '홍 길 동','Hong Gil Dong','hong gil dong','HONG KIL DDong' 등등 같은이름인데도 이렇게 다양하게 사용자는 입력할 수 있습니다. 이것을 일일이 처리한다는 것은 쉽지않고 해야할일이 너무 많습니다.   
그렇기 때문에 어떻게 입력해야 하는지를 딱 정해놓으면 편리할뿐 아니라 관리가 편해진다는 것은 분명한 사실이며 더욱 대용량의 데이터를 처리할때는 시간과 노력을 상당히 절약할 수 있습니다.   

## 다른 테이블을 생성해 보겠습니다.
```
mysql> create table sample(
    -> student_id int(10) not null auto_increment,
    -> student_name varchar(30) not null,
    -> kor int(5) null,
    -> eng int(5) null,
    -> mat int(5) null,
    -> primary key(student_id)
    -> );
Query OK, 0 rows affected, 4 warnings (0.01 sec)
mysql>desc tables;
```   

```    
mysql>create tabel test(
   -> id int primary key,
   -> name varchar(30),
   -> reservation date,
   -> room_num int
   -> );
 
Query OK, 0 rows affected
mysql> show tables;
mysql> desc test;
mysql> desc sample;
```

위의 예제에서 primary key 라는 것을 사용했습니다.   
create문에서 테이블을 생성할때 primary key 제약조건을 설정할 수 있습니다. 
PRIMARY KEY로 설정된 해당 필드는 NOT NULL과 UNIQUE 제약 조건의 특징을 모두 가져야합니다.    
이게 뭐냐면 해당 필드는 다른 레코드와의 구별을 하기 위해 사용되기 때문에 NULL 값을 가질 수 없고, 또 중복된 값을 가져서도 안된다는 의미입니다.  
그리고 이것이 PRIMARY KEY 제약 조건입니다. PRIMARY KEY를 기본 키라고 부릅니다.

위의 결과화면에서 ,

<img width="350" alt="스크린샷 2023-04-27 오후 3 42 35" src="https://user-images.githubusercontent.com/48478079/234780766-b86e4402-ef4c-45f4-9031-27d52043064e.png">




## primary key란
primary key는 한개 또는 여러개의 칼럼으로 테이블내의 <b>각 행들을 구별하는 목적으로 사용됩니다.</b> 그래서 primary key로 설정된 필드는 null 값을 가질 수 없고 unique(유일)해야 합니다. 

#### 기존 primary key삭제 후 다른 컬럼으로 지정
```   
mysql>desc test;
mysql>alter tabel test drop primary key;
mysql>desc test;
mysql>alter table test add primary key(room_num);
mysql>desc test;
```





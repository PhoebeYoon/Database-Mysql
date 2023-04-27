###### :cactus:  Mysql

## 스스로 테이블을 생성해 보세요
1. grade 라는 데이터베스를 생성하시오. 
2. student, author 테이블을 생성하시오. 
 
[ student 테이블]    
<img width="566" alt="스크린샷 2023-04-01 오후 7 45 45" src="https://user-images.githubusercontent.com/48478079/229284155-a4884b24-42f9-4e2d-afc0-1215275910e6.png">   
[author 테이블]    
<img width="566" alt="스크린샷 2023-04-01 오후 7 48 13" src="https://user-images.githubusercontent.com/48478079/229284369-d7b54514-bae1-47be-804e-c34aab33e6bb.png">    
[employee 테이블]    

<img width="566" alt="스크린샷 2023-04-01 오후 8 23 12" src="https://user-images.githubusercontent.com/48478079/229285888-9321fa7c-798e-4aad-bf2c-a30da04a6c00.png">    
[pet 테이블]   

<img width="566" alt="스크린샷 2023-04-01 오후 9 23 54" src="https://user-images.githubusercontent.com/48478079/229288430-6d40fc1d-41d9-464a-b193-90f2115574c1.png">

## table의 이름 변경
형식: 
#### alter table 이전테이블명 rename 새테이블명;

```
mysql> alter table author rename books;
```
## table 삭제 
#### drop table 테이블명;


## table 필드추가

#### alter table 테이블명 add 새로운필드명   새로운필드타입   [first 또는 after 필드명];
```
mysql>alter table books add  publication date after writer; 
mysql>desc books;
```
## 필드삭제
#### alter table 테이블명 drop 삭제할 필드명 1, 삭제할 필드명 2, ....;
```
mysql> alter table books drop publication;
mysql>desc books;
```

## 필드명수정
#### alter table 테이블명 change 이전필드명 새로운 필드명 이전필드의자료형;
```
mysql> desc books;
mysql> alter table books change title NameofTitle varchar(50);
mysql> desc books;
```


## 필드타입 수정
####  alter table 테이블명 change 이전필드명 새로운 타입 새로운자료형; 
```
mysql> alter table books change  writer author char(30);
mysql> desc books;

``` 

🧑‍🚀 employee, author, student 테이블 생성은 아래와 같습니다 ( 보지말고 직접해보세요 ) 
```
mysql> create table employee( 
    -> id int(11), 
    -> name varchar(16) not null,
    -> department_id varchar(16),
    -> primary key(id)
    -> );
```

```
mysql> create table author(
    -> code char(5) not null,
    -> title varchar(50) not null,
    -> writer varchar(20),
    -> price int not null,
    -> primary key(code)
    -> );
```

```
create table student(
    -> student_id int not null auto_increment,
    -> student_name varchar(30) not null,
    -> kor int null,
    -> eng int null,
    -> mat int null,
    -> primary key(student_id)
    -> );

```

🧑‍🚀 pet 테이블생성 쿼리는 아래와 같고, primary key는 생성하지 않습니다
```
# pet table
mysql> create table pet(
    -> name varchar(20), 
    -> owner varchar(20),
    -> species varchar(20), 
    -> sex char(1), 
    -> birth date 
    ->);
```

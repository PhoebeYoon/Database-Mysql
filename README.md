###### :cactus:  Mysql

## 스스로 테이블을 생성해 보세요
1. test 라는 데이터베스를 생성하시오. 
2. student, author 테이블을 생성하시오. 
 
[ student 테이블]    
<img width="566" alt="스크린샷 2023-04-01 오후 7 45 45" src="https://user-images.githubusercontent.com/48478079/229284155-a4884b24-42f9-4e2d-afc0-1215275910e6.png">   
[author 테이블]    
<img width="566" alt="스크린샷 2023-04-01 오후 7 48 13" src="https://user-images.githubusercontent.com/48478079/229284369-d7b54514-bae1-47be-804e-c34aab33e6bb.png">

## table의 이름 변경
형식: 
#### alter table 이전테이블명 rename 새테이블명;

```
mysql> alter table author rename books;
```
## table 삭제 
#### drop table 테이블명;


## table 필드추가
#### alter table 테이블명 add 새로운 필드명 타입 [first 또는 after 필드명];
## 필드삭제
#### alter table 테이블명 drop 삭제할 필드명 1, 삭제할 필드명 2, ....;

## 필드수정
#### alter table 테이블명 change 이전 필드명, 새로운 필드명 타입;

## 필드타입수정
####  alter table 테이블명 modify 필드명, 새로운 타입; 

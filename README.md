###### :cactus:  Mysql

RDBMS에서의 스키마는 테이블의 구조를 정의합니다. noSql의 장점중 하나는 스키마가 없다는 것인데 즉 데이터구조가 RDMBS처럼, 정해진 테이블구조가 없다는 의미입니다.   
RDMBS에서는 데이터를 효율적으로 다루기 위해서는 규칙, 형식 즉 스키마라는 필요하고 이것에 따라 데이터를 입력해야 합니다.  
만약 데이터베이스에 전화번호와 이름을 저장하고자 한다면 이름을 몇글자까지 저장할지? 전화번호를 숫자형식으로 할지 정수인지 실수인지등을 미리 정해야 한다는 것입니다.  
해당 데이터베이스를 사용하다가 필요가 있어서 '직업'(예)항목을 추가하고자 한다면 몇 사람에게만 해당 항목을 적용할 수는 없고 전체 테이블에 적용해야 합니다.  그러니 테이블을 생성할때는 여러가지를 고려해서 결정해야 합니다.

또한 스키마라는 것이 mysql에만 있는 것이 아닙니다.json, xml에서도 스키마가 있습니다.   
더 자세한 내용은 실습을 진행하면서 또 설명드리겠습니다.  


## 터미널에서 테이블생성, 삭제   
형식은 다음과 같습니다.  

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

터미널에서 실행해보겠습니다.   
```
mysql> use webdb
Database changed
mysql> create table student_info(
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
mysql> desc student_info
```   
실행결과는 아래와 같습니다.  
<img width="465" alt="스크린샷 2023-04-01 오후 6 51 45" src="https://user-images.githubusercontent.com/48478079/229279114-372bfd1c-57b8-4574-a0a1-90f511e09139.png">




2. ALTER
``` ALTER TABLE Table_name ADD column_name datatype;```   

Example
```INSERT INTO EMPLOYEE VALUES (0001, 'Dave', 'Sales');```     

3. TRUNCATE
```TRUNCATE table table_name;```    

4. DROP
```DROP TABLE table_name;```    

5. RENAME
```RENAME TABLE table_name1 to new_table_name1; ```      

6. COMMENT
Single-Line Comments:  ``` --Line1; ```    
Multi-Line comments:
 ```
 /* Line1,
   Line2 */ 
   ```      
   
### DML Commands
1. INSERT
``` INSERT INTO table_name (column1, column2, column3, ...) VALUES (value1, value2, value3, ...);```
Note: Column names are optional.

Example
``` INSERT INTO EMPLOYEE VALUES (0001, 'Ava', 'Sales'); ```   
2. SELECT
``` 
SELECT column1, column2, ...
FROM table_name
[where condition]; 
```  

Example
``` SELECT * FROM EMPLOYEE where dept ='sales'; ```    

3. UPDATE  
``` 
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition; 
```   

Example    
``` UPDATE EMPLOYEE SET dept = 'Sales' WHERE empId='0001'; ```   

4. DELETE   
``` DELETE FROM table_name where condition; ```    
Example   
``` DELETE from EMPLOYEE where empId='0001'; ```    

### Indexes
1. CREATE INDEX
  ``` CREATE INDEX index_name on table_name(column_name);  ```
To Create Unique index:    
  ``` CREATE UNIQUE INDEX index_name on table_name(column_name); ```  
2. DROP INDEX
``` DROP INDEX index_name ON table_name; ```    

### Views
1. Create a View   
Creating a View:
``` 
CREATE VIEW View_name AS 
Query; 
```

2. How to call view  
``` SELECT * FROM View_name; ```   

3. Altering a View
``` 
ALTER View View_name AS 
Query;  
```

4. Deleting a View    
``` DROP VIEW View_name; ```


### Joins
1. INNER JOIN
``` SELECT * FROM TABLE1 INNER JOIN TABLE2 where condition;```
2. LEFT JOIN
```SELECT * FROM TABLE1 LEFT JOIN TABLE2 ON condition;```
3. RIGHT JOIN
```SELECT * FROM TABLE1 RIGHT JOIN TABLE2 ON condition;```
4. CROSS JOIN
```SELECT select_list from TABLE1 CROSS JOIN TABLE ```

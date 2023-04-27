###### :cactus:  Mysql

## 관리자 권한 다루기


이전 수업내용에서 우리는 
```
mysql>mysql -uroot -p
``` 
로그인을 했습니다. 우리가 사용했던 -uroot에 대해 자세히 알아보겠습니다.   
위 코드의 mysql를 실행할때 데이타베이스를 접속하고 수정등의 권한을 가질 수 있는 권리자가 필요한데  그런 관리자로 'root'를 사용하겠다는 의미입니다. 'root'관리자는 최상위관리자를 말합니다.
이 'root' 관리자외에 다른 관리자도 존재합니다.   workbench를 실행시켜서 'root' 사용자로 접속합니다.  
```
use mysql;
show tables;
select * from user;
```
실행결과를 보면    
<img width="400" alt="스크린샷 2023-04-05 오후 6 30 38" src="https://user-images.githubusercontent.com/48478079/230041137-a55a69d7-50c6-419d-8b90-f45366fb332c.png">   


workbench 프로그램에서 왼쪽메뉴 중 'Administration' 탭을 찾아 선택합니다.  

root 사용자가 있고 그 옆의 내용중 'Administrative Roles'탭을 클릭해보면 모두 'Y'로 되어 있어서 모든 권한을 가진것을 알 수 있습니다.  

다른 방법으로 유저에 대한 정보를 알고자 하면   
<img width="400" alt="스크린샷 2023-04-05 오후 6 33 12" src="https://user-images.githubusercontent.com/48478079/230043074-ff528e2d-d995-44ec-8c8b-db57b7fc6767.png">    
위의 이미지에서 빨간색 테두리를 보면 'From Host' 의 'localhost'라고 되어 있습니다. 즉 localhost이니까 내 컴을 얘기하는 것입니다. 내 컴퓨터에서 디비에 접속하는 것을 말합니다. 


디비를 접속하는 모든 자가 똑같은 권한을 갖는 것은 자칫 실수로 디비에 손상을 입힐수도 있고 필요치 않은 권한까지 갖게 하는 것도 좋은 생각이 아닙니다. 그래서 사용자별로 권한을 필요한만큼만 부여하는 것이 좋을 듯합니다.  

이제 다른 사용자를 만들고 권한도 다르게 부여해 보겠습니다.     
아까 실행했던 쿼리탭에서 다음을 실행합니다    
```
create user 'general1'@'localhost' identified by '1234';
```   
'Administration' 탭 > 'Administrative Roles'탭 열어보면 
general1이라는 유저를 생성되어 있습니다. 그리고 이 사용자가 사용할 비번으로 '1234', 접속하는 위치는 로컬컴으로 등록했습니다. 


<img width="161" alt="스크린샷 2023-04-05 오후 6 48 41" src="https://user-images.githubusercontent.com/48478079/230045672-97b18853-5b5e-4cba-84b4-881396763fb7.png">

이렇게 사용자를 만들고 나면 이 general1 사용자가 갖는 권한을 지정해야 합니다. 권한을 지정하지않고 사용자만 만들면 소용이 없습니다.
우리는 이 general1 사용자가 사용한 데이터베이스 testdb를 만들고 table하나를 생성할 것입니다.   
아까 열어놓았던 쿼리탭을 다시 열어서 스스로 만들어보세요. 우리가 이전 수업에서 충분히 연습했으니 하실 수 있다고 생각합니다. 

testdb와 테이블이 생성되었다면 아래의 명령를 실행합니다.  
```
grant all privileges on testdb.* to 'general1'@'localhost';
```
'general1' 사용자는 testdb라는 디비에 관한 모든 권한을 부여한다는 것입니다. 



이제 workbench프로그램의 상단왼쪽의 🏠 클릭해서 'MySQL Connections'화면으로 넘어갑니다.  
➕ 클릭하여 'general1' 유저가 사용할 접속을 만들어보겠습니다.   

<img width="400" alt="스크린샷 2023-04-05 오후 6 56 22" src="https://user-images.githubusercontent.com/48478079/230047781-4c17c573-b354-4044-a4f7-4f2308590560.png">

'general1'사용자로 접속해서 왼쪽패널의 'Administration' 탭을 클릭하고 'User Accounts'에서 'general1'를 선택합니다.   
그리고 오른쪽 화면에 'Administrative Roles'를 선택하면 아래와 같이 보일것입니다.   


<img width="550" alt="스크린샷 2023-04-05 오후 7 18 29" src="https://user-images.githubusercontent.com/48478079/230053604-17009314-c3fd-4593-89bf-9cef968a69d7.png">

참고로 아래는 'root' 사용자의권한입니다.   
<img width="550" alt="스크린샷 2023-04-05 오후 7 22 52" src="https://user-images.githubusercontent.com/48478079/230053806-15b761a5-5723-41d7-8cb1-eaa725392764.png">


### 데이터를 삽입해 보세요 ( 쿼리탭에서 실행)
```
INSERT INTO 테이블이름(필드명, 필드명, 필드명...) VALUES(숫자데이터, '문자데이터', 숫자데이터);
-- 여러개 입력하고   
select * from 테이블명; 
```


#### 권한 조회하기
```
show grants for 'general1'@'localhost';
```
#### 권한 삭제
```
revoke delete on testdb.* from 'general1'@'localhost' ;
```    
#### 사용자 삭제 
```
drop user 'general1'@'localhost';
```   










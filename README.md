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
<img width="350" alt="스크린샷 2023-04-05 오후 6 30 38" src="https://user-images.githubusercontent.com/48478079/230041137-a55a69d7-50c6-419d-8b90-f45366fb332c.png">

root 사용자가 있고 그 옆의 내용을 보면 모두 'Y'로 되어 있어서 모든 권한을 가진것을 알 수 있습니다. 
다른 방법으로 유저에 대한 정보를 알고자 하면   
<img width="400" alt="스크린샷 2023-04-05 오후 6 33 12" src="https://user-images.githubusercontent.com/48478079/230043074-ff528e2d-d995-44ec-8c8b-db57b7fc6767.png">    
위의 이미지에서 빨간색 테두리를 보면 'From Host' 의 'localhost'라고 되어 있습니다. 즉 localhost이니까 내 컴을 얘기하는 것입니다. 내 컴퓨터에서 디비에 접속하는 것을 말합니다. 


디비를 접속하는 모든 자가 똑같은 권한을 갖는 것은 자칫 실수로 디비에 손상을 입힐수도 있고 필요치 않은 권한까지 갖게 하는 것도 좋은 생각이 아닙니다. 그래서 사용자별로 권한을 필요한만큼만 부여하는 것이 좋을 듯합니다.  

이제 다른 사용자를 만들고 권한도 다르게 부여해 보겠습니다.     
다음과 같은 쿼리를 실행합니다    
```
create user 'general1'@'localhost' identified by '1234';
select * from user;
```
general1이라는 유저를 생성하고 이 사용자가 사용할 비번으로 '1234'를 접속하는 위치는 로컬컴으로 등록했습니다. 






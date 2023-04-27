###### :cactus:  Mysql


## 실습을 위한 준비로 mysql를 설치하겠습니다 
1. 실습을 위해 제어판 - 프로그램 추가/삭제에서 mysql이 들어가 있는 항목을 선택하고 삭제합니다  
2. 구글에서 'mysql download for windows' 로 검색하거나 mySql 다운로드 https://dev.mysql.com/downloads/installer/ 접속합니다
3. 윈도우 또는 맥 선택 - 본인 컴퓨터에 맞는 운영체제와 버전를 선택하고 다운로드 후 나오는 화면을 읽고 진행하시면 됩니다. (윈도우와 맥의 화면이 다릅니다)
- 윈도우는 접속하면 아래쪽에 있는 'MySQL Community(GPL) Downloads'를 선택하고
- 맥은 자신의 프로세스가 M1 버전 종류인지를 아닌지를 구별해서 선택합니다 ( 참고 Intel 프로세서 아키텍처는 x86_64이고 Apple Silicon M1은 arm64 )

특별히 어려운 부분이 없고 Install complete 부분으로 넘어갔을때  Start MySQL Workbench after Setup 부분이 체크되어 있는지 확인하시면 됩니다.    


[경로설정 ]
```
C:\Program Files\MySQL\MySQL Server 8.0\bin (설치경로 복사) ->
   내 pc – 우클릭 – '정보탭' 아래 '고급시스템 정보' > 환경변수 > 
   시스템변수 : path 찾아서 우측에서 새로만들기 클릭하고 붙여넣기한 후 확인
```
[설치확인]    
```
cmd > mysql mysql-uroot –p   (설명 –u 는 root  아이디로 로그인 , -p 는 패스워드 사용한다)
```    

4. macOS -
```
> brew -v 
Homebrew 4.0.0  ( 이렇게 버전이 나오는지 확인 )
> brew install mysql  그럼 아래 이미지처럼 ==> 이런 기호나오면서 글자가 쭈욱 나오면 설치되는 것입니다. 
  그리고 좀 있으면 맥주잔 아이콘도 나옵니다.
mysql>  이렇게 나오면 설치가 완료된 것입니다.   
mysql>exit ( 종료하고 빠져나옵니다 )
```
<img width="501" alt="스크린샷 2023-03-30 오후 7 58 05" src="https://user-images.githubusercontent.com/48478079/228815456-54cb8131-33ae-4a38-858e-eee0bbbb95f1.png">

```  
최상위루트에서 다음을 실행합니다
cd usr/local/mysql/bin 
./mysql -uroot -p ( 엔터후에 비번을 물어봅니다. 여기서의 비번은 mysql에서 사용할 비번으로 영문자포함 8자리를 입력합니다 기억해두십시오)

Welcome to the MySQL monitor.  Commands end with ; or \g. <-- 요런 메시지가 나옵니다 
mysql> 
```   
참고로  아래와 같이 커맨드창에서 mysql를 접속할 수 있습니다.  
```
>mysql -uroot -p -hlocalhost
>mysql -uroot -p -h127.0.0.1
>mysql -uroot -p 엔터
```


자 그럼 설치는 완료했지만 커맨드라인으로 명령을 입력해서 사용하기 어렵잖아요.    

#### 📝 mySql 설치로는 여기까지만 하면 됩니다 아래 내용은 workbench를 설치할때 하시면 됩니다 

4. 그래서 윈도우에서처럼 Workbench를 설치하도록 하겠습니다.  
(참고로 저는 최신버전 8.0.30 입니다. 8.0.31버전도 있지만 이 버전은 workbench 실행이 원할하지 않습니다 )
https://dev.mysql.com/downloads/workbench/ 이동해서 다운로드합니다.  다운로드후 설치하려고 하는데 '허용되지 않는다 뭐 그러면서 중단되면   
:apple:  -> 시스템설정 -> 개인정보 보호 및 보안 -> 아래이미지처럼 허용해 줍니다    

<img width="353" alt="스크린샷 2023-03-30 오후 8 06 05" src="https://user-images.githubusercontent.com/48478079/228817315-1df42b70-b717-40a7-9171-332ce2441a84.png">   
그후에 돌고래 아이콘을 '응용프로그램'으로 드래그하라고 나옵니다.   
설명화면에서 보이는 그 '돌고래아이콘'을 드래그하여 '응용프로그램'으로가서 마우스를 놓으면 됩니다.    
<img width="357" alt="스크린샷 2023-03-31 오후 8 11 06" src="https://user-images.githubusercontent.com/48478079/229105436-54f78807-38bb-457b-8f31-75a411b56182.png">

<img width="526" alt="스크린샷 2023-03-30 오후 8 21 43" src="https://user-images.githubusercontent.com/48478079/228820753-d1833e32-b546-4c9b-87a9-5daa98c4d18a.png">

5. 그리고 더블클릭하여 실행합니다.   


###### :cactus:  Mysql

## 데이타베이스에 다루는 기본개념들
데이타베이스, 간단하게 '디비'라고도 부릅니다. 
1. 데이터란
2. 정보란
3. DBMS이란
4. RDBMS에서의 관계란
5. Sql이란
6. mySql이란

## 왜 필요한가 
### 데이터 ( Data ) 란 
데이터에 대한 다양한 설명들이 있겠지만 모두 동일한 것을 가리키고 있습니다. 우리 주변에 있는 모든 것이 데이터입니다. 컴퓨터에 저장된 내용 뿐 아니라 우리를 포함한 모든 것들이 '데이터' 입니다. 다만 이런 데이터들이 특정한 상황과 만나서 '정보'로 거듭나는 것입니다. 
### 정보 (infomation)란  
홍길동의 핸드폰은 010-1111-2222 라고 가정한다면 '010-1111-2222' 자체로는 별의미가 없는 데이터입니다. 그러나 이 데이터가 결제시스템과 만난다면 이 숫자들은 '인증'에 사용되는 정보가 될 것이고 '핸드폰결제'에 이용될 수 있는 유용한 정보가 될 것이다. 
그럼 이 많은 정보를 어떻게 저장하고 관리해야 할까요?  사람들의 머리속에 모두 외울수는 없는 일입니다. 
그래서 이것들을 저장하고 관리하는 <b>개념</b>과 <b>시스템</b>이 필요한 것입니다    


또한 정보는 매우 다양한 형태로 이루어져 있습니다. 예를 들어 '1588-1000' 과 '일오팔팔-천'을 우리는 동일하다고 생각할 수 있지만 이 둘을 같은 그룹에 넣은 것은 좋은 생각이 아닙니다. 그래서 정보의 <b>형태</b>를 구분하고 어떤식으로 <b>저장할지</b> 또 어떻게 <b>관리할지를</b> 지정하고 이런 데이터가 필요한 모든 사람이 <b>같은 방식</b>으로 이용하도록 해야 합니다.    


그렇지 않으면 데이터가 변형되거나 변경될때 어떤 사람은 알고있지만 어떤 사람은 모르는 경우가 발생할 수도 있고 사람마다 사용하는 언어와 동일한 데이터도 표현하는 방식이 다르니 혼선이 있을 것입니다 여기에 관리해주는 시스템으로써 <b>DBMS(Database Management System) </b>가 등장한 것입니다.   
우리가 이미 접했을수도 있는 마이크로소프트의 '액세스'가 작은 규모의 데이데베이스 관리프로그램중의 하나입니다. 

### DMBS란
데이터베이스는 <b>구조화된 정보</b> 또는 <b>데이터의 조직화된 모음</b>으로서 일반적으로 컴퓨터 시스템에 <b>전자적으로 저장</b>됩니다 데이터베이스는 일반적으로 <b>데이터베이스 관리 시스템(DBMS)</b>에 의해 제어됩니다.   
오늘날 운영되고 있는 가장 일반적인 유형의 데이터베이스에서 데이터는 일반적으로 처리 및 데이터 쿼리를 효율적으로 수행하기 위해 일련의 테이블에서 행과 열로 모델링됩니다.    

데이터베이스 유형으로는 <b>관계형데이터베이스</b>, 객체지향 데이터베이스, 분산 데이터베이스, 데이터웨어하우스, <b>NoSql데이터베이스</b>, 그래프 데이터베이스, 오픈 소스 데이터베이스, 클라우드 데이터베이스,다중 모델 데이터베이스,문서/JSON 데이터베이스,자율 운영 데이터베이스 등이 있습니다. 이렇게 나누는 기준은 주로 데이터를 어떻게저장하고 어떻게 관리할지에 따라 달라집니다.      

우리가 다루게 될 mySql는 관계형 데이타베이스에 속하며, 몽고디비는 NoSql데이터베이스에 속합니다.  


### RDBMS에서의 관계란?
관계형 데이터베이스 관리 시스템(relational database management system, RDBMS)은 IBM 산호세 연구소의 에드거 F. 커드가 도입한 관계형 모델을 기반으로 하는 데이터베이스 관리 시스템입니다. 

우리는 RDBMS를 알아볼 것이며 그중 mySql이라는 프로그램을 이용할 것입니다.  여기서 말하는  관계형이라는 말을 잠시 살펴보겠습니다.   

아래의 이미지처럼 '출석부'와 '학생기록부'는 서로 다른 물리적인 서류가 있다면 이둘은 서로 <b>관계</b>를 맺고 있습니다.  우리는 서로 다른 정보를 갖고 있는 테이블들을 어떤 관계로 맺어주는지를 주목하면 됩니다. 

두 서류에서 말하는 '홍길동'이라는 학생은 모두 같은 사람을 지칭함합니다. 그래서 이 두 테이블에서 '홍길동'이라는 정보를 이용하여 두 테이블에 어떤 관계를 맺어주면 됩니다. 이것이 바로 여기서 말하는 관계형의 의미입니다.  또한 우리가 이미 사용해본 관계형 데이터베이스와 비슷한 것은 엑셀일 것입니다.   

 <img width="380" alt="스크린샷 2023-03-30 오후 6 26 33" src="https://user-images.githubusercontent.com/48478079/228792387-188f8c0e-f71a-4f17-bbd3-c2189dafb193.png">   
 <img width="380" alt="스크린샷 2023-03-30 오후 6 26 41" src="https://user-images.githubusercontent.com/48478079/228793347-80cabc42-c67a-4781-9675-4307f30b5496.png">

요약해서 말하자면 데이터베이스는  
'자료의 중복을 배제한 ', ' 컴퓨터가 접근할 수 있는 저장매체에 저장된 ' , '고유한 업무를 수행하는데 반드시 필요한','여러 응용시스템이 공동으로 소유하고 유지하는 자료' 입니다. 
그럼 이제 다음으로 필요한 것은 이러한 데이터베이스를 만들기 위해 '어떤식으로' 만들지를 정할 필요가 있습니다.  
이쯤해서 등장하는 것이 <b>RDMBS 와 NoSQL ( Not Only SQL ) </b>입니다.  
RDMBS는 관계형 데이터베이스를 말하는데 여러개의 테이블이 특정한 <b>'관계'</b> 로 이루어져있는 구조를 가진 데이터베이스이며,   
NoSQL(Not Only SQL): 데이터-테이블간의 관계를 정의하지 않는 데이터베이스입니다. 
그런데 NoSQL를 말하면서 '스키마가 없다'라는 말이 붙어다니는 것을 보실 수 있습니다. 스키마가 뭔지 설명해 보겠습니다. 
### 스키마란 데이터베이스의 구조를 전반적으로 기술한 것을 말합니다.
스키마는 데이터베이스의 구조를 개체(Entity), 속성(Attribute), 관계(Relationship)로 정의하고 있습니다. 
- 외부스키마: 사용자 입장에서 정의한 데이터베이스의 논리적구조로 데이터들을 어떤 형식, 구조, 어떤 화면을 통해 사용자에게 보여줄지에 대한 정의입니다. 
- 개념스키마 : 데이터베이스의 전체적인 논리적 구조를 말합니다.
- 내부스키마 : 물리적 저장장치의 입장에서 본 데이터베이스의 구조입니다.     

이렇게까지만 설명하겠습니다.   일단 실습을 위해서는 이런 정도로만 이해해도 될듯합니다. (더 자세히한것은 lesson03에서 다시 설명합니다 )   
그럼 sql이라는 것은 뭘까요 ?    
### SQL(Structured Query Language)로 데이터베이스에서 데이터를 정의, 조작, 제어하기 위해 사용되는 언어입니다.   
즉 <b>구조화된 질문을 하는 언어</b>라는 뜻입니다 무슨 말이냐하면 데이터베이스에서 원하는 정보를 꺼내올때 그냥 아무렇게나 물어보면 안된다는 것입니다. 사람의 뇌는 글자가 조금 틀려도 문장의 앞뒤가 바뀌어도 이해하지만 이것은그렇지 않다는 것입니다. 주어진 형식대로 질문을 해야 이해하고 답변을 한다는 것입니다. 

SQL은 데이터를 쿼리, 조작 및 정의하고 액세스 제어를 제공하기 위해 거의 모든 관계형 데이터베이스에서 사용되는 프로그래밍 언어입니다. SQL은 1970년대에 IBM에서 처음 개발었으며 Oracle의 적극적인 공헌으로 SQL ANSI 표준이 수립되기에 이르렀습니다.

## 그럼 우리가 다룰  mySql는 뭔가요?
데이터베이스를 종이에 적어서 관리할 수는 없잖아요. 그래서 관리해주는 프로그램을 만들었는데 이걸 DBMS라고 부릅니다. 
대표적으로 MySQL, 오라클(Oracle), SQL 서버, MariaDB 등이 있습니다.    

| DBMS|	제작사|	작동운영체제	| 기타 |
|----|---|---|---|
| MySQL	|Oracle	|Unix, Linux, Windows, Mac	|오픈 소스(무료), 상용|
| MariaDB|MariaDB	 |Unix, Linux, Windows	|오픈 소스(무료),MySQL 초기 개발자들이 독립해서 만듦|
|Oracle|	Oracle	|Unix, Linux, Windows|	상용 시장 점유율 1위|
| Access |	Microsoft|	Windows	|PC용|
| SQLite	|SQLite	|Android, iOS	|모바일 전용, 오픈 소스(무료)|



참조 : https://www.oracle.com/kr/database/what-is-database/    

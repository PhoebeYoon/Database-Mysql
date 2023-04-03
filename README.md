###### :cactus:  Mysql

## 터미널에서 연산자에 대해 알아보겠습니다.  
c언에서는 print문으로 웹의 개발자도구에서는 console.log 명령을 이용하듯이 여기서는 select문을 사용해야 합니다. 
### 사칙연산 ( +  - * / % , mod )
```
mysql>select 10+20; 
mysql>select 10-20;
mysql>select 10*20;
mysql>select 10/20;
mysql>select 10%3; ( 나머지 연산자 )
mysql> select 10 mod 4;
```    
실행결과시에 표처럼 나옵니다. 첫번째 행에는 우리가 적은 명령어가 타이틀처럼 나옵니다.   
<img width="200" alt="스크린샷 2023-04-03 오후 9 34 24" src="https://user-images.githubusercontent.com/48478079/229510989-00184b4b-2acd-4157-98bc-88f55b11a9f6.png">

### 문자와 숫자를 함께 사용하면 
``` 
mysql> select 10 + 'A';
mysql> select 10 - 'A';
mysql> select 10 * 'A';
mysql> select 10 / 'A';
```  
의 결과는  
10 , 10, 0 , NULL 이라고 나옵니다. 
이것은 연산에서 문자는 0 으로 취급된다는 것을 알 수 있습니다. 다른언어에서 '+'는 주로 문자를 연결해 주는 기능을 하지만 mysql에서는 그렇지 않습니다. 그래서 10 *'A'에서 10을 0으로 곱하니까 결과가 0 으로 나온것ㅇ비니다.   


### 문자로 된 숫자는 어떻게 계산되는가
흔히 프로그램언어에서 '숫자' , "숫자" 이런식으로 표현하면 숫자는 숫자로써의 기능이 아니라 문자가 됩니다. 그래서 사칙연산이 되질 않습니다. 그러나 mysql에서는 좀 다릅니다. 아래의 예제를 보시기 바랍니다.  
```
mysql> select '10' *3;  <-- 문자인 숫자와 숫자가 섞여있지만 결과는 30입니다.
mysql> select '10' +"031" + 2 ; <--- 결과는 10+31+2 = 43
```

### True(참) / False(거짓) / not (!)연산자

```
mysql> select true;
mysql> select True;  <-- mysql에서는 대소문자를 구분하지 않습니다 
mysql> selct false;
mysql> select !true;
mysql> select !False;
mysql> select !(!false);
mysql> select not 1;
````    
<img width="200" alt="스크린샷 2023-04-03 오후 10 18 05" src="https://user-images.githubusercontent.com/48478079/229521733-c8a9d790-565a-41ac-a048-da2d883131d5.png"> <img width="200" alt="스크린샷 2023-04-03 오후 10 18 16" src="https://user-images.githubusercontent.com/48478079/229521497-81ddd175-ef75-47aa-9c81-fe7c8aed5036.png">    

위의 결과에서 보듯이 true는 1 , false는 0으로 간주됩니다.   

<img width="200" alt="스크린샷 2023-04-03 오후 10 22 57" src="https://user-images.githubusercontent.com/48478079/229522675-4fdfe557-134c-4e90-be3b-282bdf6befb4.png"> <img width="200" alt="스크린샷 2023-04-03 오후 10 23 11" src="https://user-images.githubusercontent.com/48478079/229522686-2d5cfadb-16de-4c63-8c8a-cc11fa18f615.png">   
부정연산자(!)는 반대의 의미로 해석하시면 됩니다. 부정의 부정은 원래값입니다.   
<img width="200" alt="스크린샷 2023-04-03 오후 10 27 43" src="https://user-images.githubusercontent.com/48478079/229523875-59bb68e2-b27a-4e3b-ae03-c9540d7c8fd1.png"> <img width="170" alt="스크린샷 2023-04-03 오후 10 29 23" src="https://user-images.githubusercontent.com/48478079/229524299-7cb8364b-3c9b-48f2-96c5-9342c8c0d490.png">

## 기초 연산자 
|연산자 | 설명 |
|---|---|
| and,&&| 피연산자가 모두 참일때만 결과가 참 |
| or,| 피연산자 중 하나라도 참이면 결과는 참, 피연산자 모두 거짓이면 결과는 거짓 |


|연산자 | 설명 |
|---|---|
| > | 좌변이 우변의 값보다 크다|
| < | 좌변이 우변보다 작다 |
| = |  좌우의 값이 같다 |
|>=| 좌변의 값이 우변의 값보다 크거나 같다| 
|<=| 좌변의 값이 우변의 값보다 작거나 같다| 
| = |  좌우의 값이 같다 |
| != , <> | 좌변와 우변이 같지않다 |
```
mysql> select  10>2;
mysql> select  10<2;
mysql> select  10=2;
mysql> select  10=10;
mysql> select  10>=10;
mysql> select  10 !=2;
mysql> select 10 <>10;
mysql> select 'A' ='a';  <-- 결과는 1
mysql> select 'A' !='a'; <-- 결과는 0
mysql> select 'A' > 'b';
mysql> select 'A' < 'b';
mysql> select 'A' < 'B'; <-- 결과는 1
mysql> select 'A' > 1;   <-- 결과는 0
mysql> select 'A' < '1'; <-- 결과는 1
```
'A' 와 'a'의 비교에서 대소문자를 구분하지 않으니 아스키코드값으로 계산하면 문자가 숫자보다 코드값이 더 높다.  
그렇지만 숫자와문자가 섞여서 계산될때 문자는 0으로 처리되기 때문에 'A'> 1 의 결과는 0이다. 


##  in,  not in , between , is, is not 연산자

|연산자 | 설명 |
|---|---|
| in() | 괄호안에 값들 중이 있다 |
| not in() | 괄호안에 값들 중이 없다|
|between 최소값 and 최대값 | 괄호안에 값들 중이 있다 |
| is | is의 양쪽의 값이 모두 true 또는 false 일때 결과는 true |
| is not| is의 양쪽의 값이 true 와 false일때 결과는 true |


```
mysql> select 10 in (10,13,15);
mysql> select 10 not in (10,13,15);
mysql> select 20 not in (10,13,15);
mysql> select 'apple' in ('apple','peach','banana');
mysql> select 'apple' not in ('apple','peach','banana');
mysql> select 'b' between 'a' and 'c';
mysql> select 'd' between 'a' and 'c';
mysql> select 'life' between 'B' and 'D';
mysql> select 5 between 4 and 10;
mysql> select 2  between 4 and 10;
mysql> select true is true;
mysql> select false is false;
mysql> select false is not true;
mysql> select false is not false;
mysql> select true is not false;
```    

## LIKE (% , _ ) 
LIKE 연산자와 함께 사용하는 와일드카드는 % , _ (언더바)입니다.   
%는 1개의 문자이상을, _ 는 1개의 문자를 대치합니다 주로 LIKE 연산자와 함께 사용합니다. 
```
mysql> select 'hello' like 'h%'; <-- 결과는 1
mysql> select 'good' like 'h%';   <-- 결과는 0, 로 h시작하지 않고 g시작
mysql> select 'good' like '_o__'; <-- 결과는 1
mysql> select 'good' like '_o_'; <-- 결과는 0 자릿수가 모잘랍니다
```
LIKE 연산자는 나중에 쿼리문과 함께 더 실습해 보겠습니다. 



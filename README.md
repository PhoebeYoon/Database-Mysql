###### :cactus:  Mysql

## 날짜, 시간 함수들 
| 함수 | 설명 |
|---|---|
| date |문자열에 따라 날짜 생성 | 
| time |문자열에 따라 날짜 생성 |
| year	| 주어진 DATETIME값의 년도 반환 |
| monthname	| 주어진 DATETIME값의 월(영문) 반환 |
| month| 주어진 DATETIME값의 월 반환 |
| weekday	| 주어진 DATETIME값의 요일값 반환(월요일: 0) |
| dayname	| 주어진 DATETIME값의 요일명 반환 |
| dayofmonth, day	| 주어진 DATETIME값의 날짜(일) 반환 | 
| hour | 주어진 DATETIME의 시 반환 |
| minute |	주어진 DATETIME의 분 반환 |
| second |	주어진 DATETIME의 초 반환 |
| adddate , date_add	 |시간/날짜 더하기 |
| subdate, date_sub |시간/날짜 빼기 |
| date_diff | 두 시간/날짜 간 일수차 |
| time_diff |두 시간/날짜 간 시간차 |
| last_day| 해당 달의 마지막 날짜 |
| date_format |	시간/날짜를 지정한 형식으로 반환 |
| STR _ TO _ DATE(S, F)	|S를 F형식으로 해석하여 시간/날짜 생성 |

| 형식	| 설명 |
|---|---|
| %Y	| 년도 4자리 |
| %y	| 년도 2자리|
| %M	| 월 영문|
| %m	| 월 숫자|
| %D	| 일 영문(1st, 2nd, 3rd...)|
| %d, %e	| 일 숫자 (01 ~ 31)|
| %T	| hh:mm:ss|
| %r	| hh:mm:ss AM/PM|
| %H, %k	| 시 (~23)|
| %h, %l| 	시 (~12)|
| %i	| 분|
| %S, %s| 초|
| %p	| AM/PM|


```
mysql> select adddate('2020-04-05', interval 1 year);
mysql> select adddate('2020-04-05', interval 2 month);
mysql> select adddate('2020-04-05', interval -5 month);
mysql> select adddate('2020-04-05', interval -2 month);
mysql> select adddate('2020-04-05', interval -5 day);
mysql> select adddate('2020-04-05', interval 5 week);
mysql> select hour(now()), minute(now()), second(now());

mysql> select now();
mysql> select date_format( now(), '%y,%m,%d,%T');
mysql> select date_format( now(), '%Y,%M,%D,%T');
mysql> select date_format( now(), '%Y년,%M월 ,%D일 ,시간: %T');

mysql> Select timediff ('2021-06-21 15:20:35', '2023-04-05 16:34:41');
```

<img width="350" alt="스크린샷 2023-04-04 오전 11 54 27" src="https://user-images.githubusercontent.com/48478079/229675053-cf0facb1-fe0d-4b3c-9cea-9b5610972ae9.png">

<img width="350" alt="스크린샷 2023-04-04 오전 11 54 39" src="https://user-images.githubusercontent.com/48478079/229675068-235d280d-115f-4a95-8946-3a97b2243aee.png">


## 조건문  
if(조건, 만족했을때, 불만족했을때) : 간단한 조건문에 사용합니다  
ifnull(m,n) : m이 null 이라면 n을 출력합니다  
```
mysql> select if(10>12 , 'ten','twelve');
mysql> select ifnull(null,'ok');
mysql> select ifnull('','ok'); <-- 공백은 null 이 아닙니다 
```    
복잡한 조건을 사용해야 할때는, case문을 사용합니다.    
형식은,   
```
case when 조건1  then 결과값1
         when 조건2  then 결과값2
         when 조건3  then 결과값3
         when 조건4  then 결과값4
         else 결과값5
end
```   
자세한 실습은 터미널에서가 아닌 workbench에서 해보겠습니다.  
여기까지 잘 따라오셨습니다 

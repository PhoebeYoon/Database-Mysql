###### :cactus:  Mysql


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

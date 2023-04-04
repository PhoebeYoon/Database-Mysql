###### :cactus:  Mysql


## 숫자와 문자열 관련함수

| 함수 | 설명 |함수| 설명|
|---|---|---|---|
| round | 반올림 | ucase, upper | 주어진 문자를 모두 대문자로 바꿉니다 |
| ceil | 올림| lcase, lower | 주어진 문자를 모두 소문자로 바꿉니다 |
| floor | 내림|concat() | 괄호안의 내용을 이어붙입니다  |
|abs | 절대값|concat_ws(s, ... ) | 괄호안의 내용을 s로 이어붙입니다 | 
| greatest| ()값중 제일 큰 값을 반환 | substr, substring |주어진 값에 따라 문자열 자름 |
| least | ()값중 제일 작은 값을 반환 |left |왼쪽부터 n개의 글자 추출합니다 |
| max | 가장 큰 값을 반환 |right |	오른쪽부터 n개의 글자를 추출합니다 |
| min |가장 작은 값을 반환 |length|문자열의 바이트 길이 |
| count	 |갯수 (NULL값 제외)|char_lenght, character_length| 문자열의 문자 길이 |
| sum|합계를 구합니다|trim	|양쪽 공백 제거|
| avg	 | 평균값을 구합니다 |ltrim	|왼쪽 공백 제거 |
| sqrt | 제곱근을 구합니다 |rtrim| 오른쪽 공백 제거 |
| truncate(m,n) | m을 소숫점 n자리까지 선택합니다 |lpad(s, n, p)|	S가 N글자가 될 때까지 P를 이어붙임 |
| rpad(s, n, p)	|S가 N글자가 될 때까지 P를 이어붙임 |instr(S, s)	| S중 s의 첫 위치 반환, 없을 시 0 |
| REPLACE(S, A, B)| 	S중 A를 B로 변경 |cast(a as t)	|A를 T 자료형으로 변환 |
| REPLACE(S, A, B)| 	S중 A를 B로 변경 |cast(a as t)	|A를 T 자료형으로 변환 |
| convert(a, t)	| A를 T 자료형으로 변환 |  |


```
mysql> select round(4.4),round(4.5), round(4.6);
mysql> select ceil(4.4),ceil(4.5), ceil(4.6);
mysql> select floor(4.4),floor(4.5), floor(4.6);
```

<img width="200" alt="스크린샷 2023-04-04 오전 9 25 46" src="https://user-images.githubusercontent.com/48478079/229655224-a3e653b4-7490-471b-bbf8-9ef1a620df9b.png"> <img width="200" alt="스크린샷 2023-04-04 오전 9 25 53" src="https://user-images.githubusercontent.com/48478079/229655248-b87bf124-7e7a-4f9f-aed5-60c7c1069cf6.png"> <img width="200" alt="스크린샷 2023-04-04 오전 9 26 00" src="https://user-images.githubusercontent.com/48478079/229655254-a888c5d8-e26a-49f9-b4fe-9e11cce42b38.png">





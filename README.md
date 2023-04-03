###### :cactus:  Mysql


## 숫자와 문자열 관련함수

| 함수 | 설명 |
|---|---|
| round | 반올림 |
| ceil | 올림|
| floor | 내림|
|abs | 절대값|
| greatest| ()값중 제일 큰 값을 반환 |
| least | ()값중 제일 작은 값을 반환 |
| max | 가장 큰 값을 반환 |
| min |가장 작은 값을 반환 |
| count	 |갯수 (NULL값 제외)|
| sum|합계를 구합니다|
| avg	 | 평균값을 구합니다 |
| sqrt | 제곱근을 구합니다 |
| truncate(m,n) | m을 소숫점 n자리까지 선택합니다 |
| ucase, upper | 주어진 문자를 모두 대문자로 바꿉니다 |
| lcase, lower | 주어진 문자를 모두 소문자로 바꿉니다 |
| concat() | 괄호안의 내용을 이어붙입니다  |
|concat_ws(s, ... ) | 괄호안의 내용을 s로 이어붙입니다 | 
| substr, substring |주어진 값에 따라 문자열 자름 |
| left |왼쪽부터 n개의 글자 추출합니다 |
| right |	오른쪽부터 n개의 글자를 추출합니다 |
| length|문자열의 바이트 길이 |
| char_lenght, character_length| 문자열의 문자 길이 |
| trim	|양쪽 공백 제거|
| ltrim	|왼쪽 공백 제거 |
| rtrim| 오른쪽 공백 제거 |
| lpad(s, n, p)|	S가 N글자가 될 때까지 P를 이어붙임 |
| rpad(s, n, p)	|S가 N글자가 될 때까지 P를 이어붙임 |
| REPLACE(S, A, B)| 	S중 A를 B로 변경 |
| instr(S, s)	| S중 s의 첫 위치 반환, 없을 시 0 |
| cast(a as t)	|A를 T 자료형으로 변환 |
| convert(a, t)	| A를 T 자료형으로 변환 |

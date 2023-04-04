###### :cactus:  Mysql


workbench실행 후 원하는 스키마를 선택할때 use 명령대신 해당 스카마를 더블클릭해서 선택할 수도 있습니다. 선택되었다면 <b>굵은글자</b>로 표시됩니다.   

## select 문
```
모든 내용을 보고 싶을 때  
select * from wellknowpeople;
테이블이름이 좀 길죠 그래서 'as' 별칭으로 해도 됩니다 
select * from wellknowpeople  as wp;

select * from actor;
select first_name, last_name from actor;

```
> 별칭을 사용할때는 as를 사용한다고 외웁시다

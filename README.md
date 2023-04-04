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

#### 기존테이블에 칼럼을 추가해봅시다 
``` 
alter table actor add column age int(5) not null default 0 after last_name;
desc actor;
```    
actor 테이블에 age라는 칼럼을 생성하되 int(5)의 크기로 하고 디폴트값은 0으로 주고, 순서는 last_name전에 생성한다는 뜻이다.  
<img width="337" alt="스크린샷 2023-04-04 오후 3 22 54" src="https://user-images.githubusercontent.com/48478079/229705426-bb8fee1b-2819-4493-9a58-87125f387be2.png">

###### :cactus:  Mysql 

#### 우리는 이미 테이블을 생성하고 데이터를 입력하면서 기본키와 외래키를 사용해 보았습니다.  
아래의 예제는 해당 부분만 포커스를 맞춰서 다시 한번 실행해보겠습니다.



``` 
-- testdb

CREATE TABLE member_girl(
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL,
    PRIMARY KEY (mem_id)
);

drop table member_girl;


-- 기본키없이 테이블 생성
CREATE TABLE member_girl (
    mem_id CHAR(8) NOT NULL,
    mem_name VARCHAR(10) NOT NULL,
    height TINYINT UNSIGNED NULL
);

-- TINYINT 는 tiny( 아주 작은 , 미세한 ) int (정수) : 1byte으로 0~255사이의 값 

-- 외래키는 두 테이블 사이의 관계를 연결해주고 그 결과 데이터의 무결성을 보장해주는 보장해주는 역할을 합니다
-- 외래키로 설정된 컬럼은 다른 테이블의 기본키로 되어 있어야 합니다.

CREATE TABLE buy (
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL,
    FOREIGN KEY(mem_id) REFERENCES member_girl(mem_id)
);

desc buy;
``` 

#### 위에서 기본키, 외래키 설정을 배웠으니 간단하게 이를 이용해 조회해 보겠습니다.

아래 예제에서 member와 buy테이블은 외래키로 연결되어 있기 때문에 두 테이블의 값으로 '무엇이 무엇과 같을경우 찾아달라' 뭐 이런식으로 검색이 가능합니다.   
그러나 외래키로 연결되어 있지 않은 경우에는 이런식으로 검색해봐야 소용이 없겠죠.  
```

use market_db;
desc member;
desc buy;
desc orders;

alter table buy add foreign key (mem_id) references member(mem_id);

select * from member;
select * from buy;

select  member.*, buy.*  from member join buy where member.mem_id =buy.mem_id;


desc orders;
select  member.*, orders.*  from member join orders  where member.mem_id =orders.id;
```

### select 문 + limit 문
limit n : n개 만큼 출력합니다   
limint m,n : m행부터 n개 출력합니다    

```
limit n; :  n으로 지정된 숫자만큼 행이 출력된다.
use market_db;
select * from member;
-- limit n; :  n으로 지정된 숫자만큼 행이 출력된다.
select * from member limit 1;
select * from member limit 3;

-- limit m, n (m행부터 n개 출력, m을 offset이라고 한느데 기본값은 0 입니다 )
select * from member limit 3, 3;

```


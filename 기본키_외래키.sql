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

alter table member_girl add constraint primary key(mem_id)

-- 외래키는 두 테이블 사이의 관계를 연결해주고 그 결과 데이터의 무결성을 보장해주는 보장해주는 역할을 합니다comment
-- 외래키로 설정된 컬럼은 다른 데이블의 기본키로 되어 있어야 합니다.

CREATE TABLE buy (
    num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    mem_id CHAR(8) NOT NULL,
    prod_name CHAR(6) NOT NULL,
    FOREIGN KEY(mem_id) REFERENCES member_girl(mem_id)
);

desc buy;
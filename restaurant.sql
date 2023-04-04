CREATE TABLE business (
  business_id INT AUTO_INCREMENT PRIMARY KEY,
  fk_section_id INT NOT NULL,
  business_name VARCHAR(10) NOT NULL,
  status CHAR(3) DEFAULT 'OPN' NOT NULL,
  can_takeout TINYINT DEFAULT 1 NOT NULL
);

INSERT INTO business(fk_section_id, business_name, status, can_takeout)
VALUES  (3, '화룡각', 'OPN', 1),
        (2, '철구분식', 'OPN', 1),
        (5, '얄코렐라', 'RMD', 1),
        (2, '바른떡볶이', 'OPN', 1),
        (1, '북극냉면', 'OPN', 0),
        (1, '보쌈마니아', 'OPN', 1),
        (5, '에그사라다', 'VCT', 1),
        (6, '달다방', 'OPN', 1),
        (7, '마카오마카롱', 'OPN', 1),
        (2, '김밥마라', 'OPN', 1),
        (7, '소소스윗', 'OPN', 1),
        (4, '사사서셔소쇼스시', 'VCT', 1),
        (3, '린민짬뽕', 'CLS', 1),
        (7, '파시조아', 'OPN', 1),
        (1, '할매장국', 'CLS', 0),
        (5, '노선이탈리아', 'OPN', 1),
        (6, '커피앤코드', 'OPN', 1),
        (2, '신림동백순대', 'VCT', 1);

select * from business;
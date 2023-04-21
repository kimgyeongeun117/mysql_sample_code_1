SELECT * FROM member;
-- member 테이블에서 id가 3인 행 삭제
DELETE FROM member WHERE id = 3;

-- member 테이블에서 gender가 'F'이고 age가 20보다 큰 행 삭제
DELETE FROM member WHERE gender = 'F' AND age > 20;

drop table product;

CREATE TABLE product (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price INT NOT NULL,
  description VARCHAR(200)
);

INSERT INTO product (id, name, price, description) 
VALUES
(1, '아이폰 13', 1300000, 'Apple의 최신 모델 스마트폰'),
(2, '갤럭시 S21', 1200000, '삼성의 최신 모델 스마트폰'),
(3, '맥북 에어', 1500000, 'Apple의 대표적인 노트북'),
(4, 'LG 그램', 1300000, 'LG전자의 대표적인 노트북'),
(5, '아이패드', 800000, 'Apple의 태블릿'),
(6, '갤럭시 탭', 700000, '삼성의 태블릿'),
(7, '애플 워치', 500000, 'Apple의 스마트 워치'),
(8, '갤럭시 워치', 400000, '삼성의 스마트 워치'),
(9, '에어팟 프로', 300000, 'Apple의 무선 이어폰'),
(10, '갤럭시 버즈', 200000, '삼성의 무선 이어폰');

select * from product;

delete from product where id = 5;
delete from product where name = '맥북 에어';

-- 가격이 1,000,000원 이상인 제품을 삭제
delete from product where price >= 1000000;

-- id가 2 또는 3인 제품을 삭제
select * from product;
delete from product where id in(2,3);

-- like 갤럭시
select * from product where name like '갤럭시%';
delete from product where name like '갤럭시%';

-- 이름이 '에어팟 프로'이거나 설명이 '삼성'을 포함하는 제품 삭제
delete from product where name = '에어팟 프로' or description like '삼성%';











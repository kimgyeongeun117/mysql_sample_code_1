show create table `order`;

-- drop table `order`;

CREATE TABLE `order` (
  id INT PRIMARY KEY,
  customer_order VARCHAR(50) NOT NULL,
  product_name VARCHAR(20) NOT NULL,
  quantity INT NOT NULL,
  order_date DATE NOT NULL
);

-- 데이터 타입 형식에 DATE 값 입력에 이해
-- 데이터를 입력하는 쿼리 구문을 작성해 주세요
INSERT INTO `order` (id,customer_order,product_name,quantity,order_date)
values (1,'빠른 배송 바람','신라면',2,'2022-02-25');
SELECT * FROM `order`;

INSERT INTO `order` (id,customer_order,product_name,quantity,order_date)
values (3,'빠른 배송 바람','신라면',2,20220225);

-- DATE 타입에 값을 넣을 때 작은따옴표나 큰따옴표를 사용해도 되고
-- 정수값을 입력하여도 된다. 단 날짜 형식에 맞는 값이어야 한다.
-- 1년은 12개월인데 13이라는 값을 넣으면 알아서 오류를 일으켜 준다.
INSERT INTO `order` (id,customer_order,product_name,quantity,order_date)
values (4,'빠른 배송 바람','신라면',2,20222225);

INSERT INTO `order` (id,customer_order,product_name,quantity,order_date)
values (4,'빠른 배송 바람','신라면',2,'20222225');

-- YYYY-MM-DD : mysql 기본 DATE의 데이터 타입 기본 포멧
-- YYYY/MM/DD
-- YYYYMMDD

DROP table customer;

-- AUTO_INCREMENT 사용하기
-- 고객 테이블 생성

CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    address VARCHAR(100) NOT NULL
);

insert into customer (name,email,address)
values 
	('김철수','A@naver.com','서울시 강남구 역삼동'),
	('박영희','B@naver.com','서울시 강동구 천호동'),
	('김철수','C@naver.com','서울시 강남구 역삼동');

SELECT * FROM customer;


-- alter 문제
-- 문제1. cafe 테이블을 생성하시오 id는 primary key에 email은 default로 '미정'
create table cafe(
	id int auto_increment primary key,
    name varchar(20) not null,
    email varchar(20) default '미정',
    address varchar(20) not null
);
-- 문제2. cafe 테이블의 brand 속성을 추가하시오
alter table cafe add brand varchar(20);
-- 문제3. cafe 테이블의 brand 속성에 not null 제약 조건을 적용하시오
alter table cafe modify brand varchar(20) not null;
-- 문제4. cafe 테이블의 brand 속성을 삭제하시오
alter table cafe drop brand;
-- 문제5. cafe 테이블의 address 속성의 제약사항을 default로 ''를 추가하시오 
alter table cafe modify address varchar(20) default '' not null;

-- insert문제
-- 문제1. cafe 테이블에 auto_increment와 디폴트 제약을 사용하여 3행을 입력하시오
Insert into cafe(name,email,address)
values 
	('김경은','uki117@naver.com','화명'),
	('김채은',default,'화명'),
	('김성일',default,'연제');

select * from cafe;
desc cafe;

















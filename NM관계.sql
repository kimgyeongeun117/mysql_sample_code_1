CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    major VARCHAR(50) NOT NULL
);

CREATE TABLE subject (
    subject_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

-- 학생과 수강 테이블의 관계는 1:N
-- 과목 : 수강 테이블의 관계는 1:N
CREATE TABLE enrollment(
	enrollment_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student (student_id),
    FOREIGN KEY (subject_id) REFERENCES subject (subject_id)
);

-- 한 사람이 여러 개의 도시에서 여러 번 여행을 다녀온 경우를 테이블로 구축해보세요.
-- 여기서 사람, 도시의 관계를 관계차수 표현해보세요
-- 도시 <--- 방문한 사람의 이력 저장 가능
-- 한 사람이 여러 도시 방문 가능, 한 도시에 여러 사람이 방문을 한다.
-- person, city, travel
CREATE TABLE person(
	person_id INT PRIMARY KEY,
    name VARCHAR(20) not null
);

CREATE TABLE city(
	city_id INT PRIMARY KEY,
    name VARCHAR(20) not null
);

CREATE TABLE travel(
	person_id int,
    city_id int,
    trip_date date,
    PRIMARY KEY (person_id,city_id,trip_date),	-- ID만드는 것도 좋음
    FOREIGN KEY(person_id) REFERENCES person (person_id),
    FOREIGN KEY(city_id) REFERENCES city (city_id)
);

INSERT INTO person VALUES
	(1,'김영희'),
	(2,'박철수'),
	(3,'이민호'),
	(4,'한지민'),
	(5,'송혜교');
    
INSERT INTO city VALUES
	(1,'서울'),
	(2,'부산'),
	(3,'제주'),
	(4,'홍콩'),
	(5,'도쿄');
    
INSERT INTO travel VALUES
	(1,1,'2022-07-10'),
	(1,2,'2022-07-10'),
	(2,5,'2022-07-10'),
	(2,4,'2022-07-10'),
	(3,3,'2022-07-10'),
	(4,5,'2022-07-10'),
	(1,4,'2022-07-10');

SELECT * FROM travel;
SELECT * FROM person;
SELECT * FROM city;

-- 문제 join 구문을 활용해서
-- city 테이블을 기준으로 travel과 left join하고 홍콩을 여행한 사람의 person_id를 조회해라
SELECT travel.person_id
from city
LEFT JOIN travel
on travel.city_id = city.city_id
where city.name = '홍콩';
-- person 테이블을 기준으로 travel과 left join 하고 이름이 김씨인 사람의 데이터를 조회해라
SELECT *
FROM person
LEFT JOIN travel
on person.person_id = travel.person_id
where person.name like '김%';

-- 고객,주문목록 --> 1:n
-- 고객, 상품정보, 주문목록 --> n:m --> 중간 테이블 주문 목록

-- 테이블 설계
-- 고객, 상품, 주문 목록
CREATE TABLE customer(
	customer_id INT PRIMARY KEY,
    name VARCHAR(20) not null
);

CREATE TABLE product(
	product_id INT PRIMARY KEY,
    name VARCHAR(20) not null,
    price int not null
);

CREATE TABLE `order`(
	order_id int PRIMARY KEY AUTO_INCREMENT,
	customer_id INT not null,
    product_id int not null,
    order_date date not null,
    amount int not null,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);

select * from buytbl;










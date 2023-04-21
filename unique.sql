drop table member;

CREATE TABLE member (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(100) NOT NULL
);

INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동', 'hong@test.com', '010-1234-5678', '서울시 강남구'),
('김영희', 'kim@test.com', '010-2345-6789', '서울시 서초구'),
('이철수', 'lee@test.com', '010-3456-7890', '서울시 종로구'),
('박민지', 'park@test.com', '010-4567-8901', '서울시 마포구'),
('최재영', 'choi@test.com', '010-5678-9012', '서울시 강서구'),
('강영식', 'kang@test.com', '010-6789-0123', '서울시 송파구');

update member
set address = '서울시 중구'
where name = '이철수';

INSERT INTO member (name, email, phone, address)
VALUES 
('홍길동2', 'hong@test.com', '010-1234-5678', '서울시 강남구');

select * from member;
desc member;

drop table student;
-- 테이블 생성시 인덱스 추가 쿼리
CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  grade INT NOT NULL,
  major VARCHAR(50) NOT NULL,
  english_score INT NOT NULL,
  INDEX idx_major (major)
);

ALTER TABLE student ADD INDEX idx_grade(grade);
desc student;

select * from member;
-- id가 2인 회원의 이름과 전화번호를 각각 '임성준', '010-9876-5432'로 수정
UPDATE member
SET name = '임성준', phone = '010-98760-5432'
WHERE id = 2;
-- id가 5인 회원의 이메일과 주소를 각각 'leejaehyun@test.com','서울시 강서구'로 수정
UPDATE member
SET email = 'leejaehyun@test.com', address='서울시 강서구'
WHERE id = 5;

drop table Cinema;
-- 도전과제
CREATE TABLE Cinema(
	id int primary key auto_increment,
    title varchar(20) not null,
    director varchar(20) not null,
    release_date date not null,
    genre varchar(20) not null,
    rating decimal(3,2)
);

-- 데이터 입력
INSERT INTO Cinema(title,director,release_date,genre,rating)
values
	('괴물','봉준호',20060727,'드라마',8.28),
    ('극한직업','이병헌',20190123,'코미디',9.20),
    ('명량','김한민',20140730,'사극',9.17),
    ('신과함께-죄와 벌','김용화',20171220,'판타지',7.56),
    ('밀양','임권택',20160907,'드라마',7.76),
    ('반도','연상호',20200715,'액션',6.71),
    ('베테랑','류승완',20150805,'액션',8.49),
    ('변호인','양우석',20131218,'드라마',8.41),
    ('군함도','류승완',20170726,'사극',8.01),
    ('암살','최동훈',20150722,'액션',8.37);

-- 데이터를 수정하는 문제를 작성하고 직접 쿼리 구문도 작성해주세요
-- 장르가 드라마이면서 감독이 임권택인 영화의 평점을 9.5점으로 수정하시오
UPDATE Cinema
SET rating = 9.5
WHERE genre = '드라마' and director = '임권택';

select * from Cinema;

-- member 테이블에서 id가 3인 행 삭제
DELETE FROM member WHERE id = 3;

-- member 테이블에서 gender가 'F'이고 age가 20보다 큰 행 삭제
DELETE FROM member WHERE gender = 'F' AND age > 20;

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









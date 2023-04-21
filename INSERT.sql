-- 데이터 저장
/*
	여러줄 주석
*/

-- drop table student;
-- drop table subject;
-- drop table product;

-- 테이블 제약사항에 NULL 허용 의미와 NOT NULL 허용 의미
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name varchar(50) not null,
    grade int not null,
    major varchar(50)
);

-- 기본 문구 모양
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ..) VALUES (값1,값2);
INSERT INTO student(student_id,name,grade,major) 
values (1,'홍길동',3,'컴퓨터공학과');

INSERT INTO student(student_id,name,grade,major)
VALUES (2,'김철수',4,'전자공학과');

INSERT INTO student(student_id,name,grade,major)
VALUE (3,'이영희',2,'경영학과');

INSERT INTO student(student_id,name,grade,major)
VALUES (4,'티모',1,'롤학과');

-- 테이블의 데이터를 삭제하는 명령어 사용해보기
DELETE FROM student; -- 테이블 안에 있는 데이터만 삭제하는 명령어이다.

-- 복수형으로 INSERT 쿼리문 작성하기
INSERT INTO student(student_id,name,grade,major)
VALUES
	(1001,'김철수',2,'컴퓨터공학과'),
    (1002,'이영희',3,'수학과'),
    (1003,'박민수',1,'전자공학과');

-- 복수형으로 데이터 3행을 넣어주세요 
INSERT INTO student(student_id,name,grade,major)
VALUE
	(1004,'김경은',4,'컴퓨터공학과'),
    (1005,'김채은',4,'간호학과'),
    (1006,'김기훈',1,'중국어학과');

-- insert 구문에서 복수행 쿼리를 실행할 때 하나라도 오류가 있으면
-- 데이터는 정상 저장되지 않는다.
INSERT INTO student(student_id,name,grade,major)
VALUE
	(1007,'김철수3',4,'컴퓨터공학과'),
    (1008,'이영희3',4,'간호학과'),
    (1009,'박민수3',1,'중국어학과');
    
select * from student;

desc customer;
desc employee;

INSERT INTO employee(employee_id,employee_name,age,department)
values
	(1,'김경은',27,'1부서'),
    (2,'김채은',29,'2부서'),
    (3,'김민우',27,'3부서'),
    (4,'김경',27,'1부서'),
    (5,'경은',27,'1부서');
    
INSERT INTO customer(customer_id,customer_name,email,address)
values
	(1,'김경은','uki117@naver.com','화명'),
    (2,'김채은','uki117@naver.com','화명'),
    (3,'김민우','uki117@naver.com','사상'),
    (4,'김경','uki117@naver.com','금곡'),
    (5,'경은','uki117@naver.com','양산');

select * from customer;
select * from employee;

create table product (
	id int primary key,
    name varchar(20) not null,
    date date not null,
    price decimal not null,
    category varchar(20)
);

INSERT INTO product(id,name,date,price,category)
values 
	(1,'마우스','20220306',20000,'전자제품'),
    (2,'키보드','20220205',30000,'전자제품'),
    (3,'안경','20220103',80000,'생활용품'),
    (4,'가방','20220306',100000,'생활용품'),
    (5,'옷','20211206',60000,'의류');
    
insert into product (id,name,date,price,category)
values (6,'티셔츠',20220301,30000,'의류');
    
select * from product;


desc student;









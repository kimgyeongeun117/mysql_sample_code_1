-- 데이터베이스 생성
-- create DATABASE 
CREATE DATABASE mydb;
-- db를 사용할려면 사용한다고 명령어를 실행 해야 한다.
use mydb;
-- use green;
-- 테이블 생성시, sql 작성시 어떤 DB 사용해야 하는지 먼저 선택 되어야 한다.

-- 테이블 생성
CREATE TABLE student (
    student_id INT,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);

select * from student;
desc student; -- 테이블 구조 알려줘
 
 -- 과목 테이블 생성하기
 CREATE TABLE subject (
    subject_id INT,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(50),
    professor CHAR(50) NOT NULL
);

select * from subject;
desc subject;

desc student;
-- 이미 생성된 테이블에 기본 키 추가 하는 쿼리 사용방법
ALTER TABLE student ADD primary key(student_id);
-- 사전기반지식 : 특정 컬럼을 기본키로 만들게 되면 중복된 데이터를 허용 못하고
-- NULL  값이 있어서는 안됨

-- subject 테이블에 PK 추가 대상 -subject_id
-- 제약 확인
desc subject;
ALTER TABLE subject add primary key(subject_id);

-- 생성될 시점에 테이블 생성 명령어를 보여줘
show create table student;

-- 테이블을 삭제하는 명령어 확인
drop table student;
drop table subject;

-- 학생 테이블 생성 PK 추가
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    grade INT NOT NULL,
    major VARCHAR(50) NOT NULL
);
desc student;

CREATE TABLE subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(10) NOT NULL,
    professor VARCHAR(20) NOT NULL
);
desc subject;

CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    age INT,
    department VARCHAR(10) NOT NULL
);
drop table employee;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(30) NOT NULL,
    address VARCHAR(50) NOT NULL
);
drop table customer;

desc customer;
desc employee;

CREATE TABLE product (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10 , 2 ) NOT NULL,
    description TEXT
);
desc product;

-- `order` 예약어 테이블 이름을 선점할 수 없다 기본적으로
-- 하지만 강제적으로 ``작은 따옴표를 사용해서 테이블 이름이라고 명시할 수 있다.
CREATE TABLE `order` (
    id INT PRIMARY KEY,
    customer_order VARCHAR(50),
    product_name VARCHAR(20) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL
);

CREATE TABLE car (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(15 , 2 ) NOT NULL,
    color VARCHAR(10),
    speed INT,
    car_date DATE NOT NULL
);

desc car;



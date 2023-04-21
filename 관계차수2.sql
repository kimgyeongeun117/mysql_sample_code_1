-- 1:1 관계
-- 회원 정보
DROP TABLE IF EXISTS member;
CREATE TABLE member (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    address VARCHAR(100)
);

CREATE TABLE member_grade (
    member_id INT PRIMARY KEY,
    grade VARCHAR(10),
    point INT,
    FOREIGN KEY (member_id) REFERENCES member (id)
);

desc member;
desc member_grade;

-- 직원 정보와 직위 정보를 저장하는 테이블 설계 1:1 관계
drop table if exists employee;
CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    hire_date DATE NOT NULL
);

DROP TABLE IF EXISTS employee_position;
CREATE TABLE employee_position (
    employee_position_id INT PRIMARY KEY,
    position VARCHAR(20) NOT NULL,
    dismissal_date DATE,
    FOREIGN KEY (employee_position_id)
        REFERENCES employee (id)
);

desc employee;
desc employee_position;

drop table `order`;
drop table product;
CREATE TABLE product(
	id INT primary key,
    name varchar(100) not null,
    price int
);

create table product_detail(
	product_id INT primary KEY,
    description TEXT,
    foreign key (product_id) references product (id)
);











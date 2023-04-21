CREATE TABLE school(
	school_id int primary key,
    school_name varchar(20) not null,
    city varchar(20)
);

drop table student;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    grade VARCHAR(3) NOT NULL,
    school_id INT,
    FOREIGN KEY (school_id) REFERENCES school (school_id)
);

insert into school(school_id,school_name,city)
values 
	(1,'서울대학교','서울'),
	(2,'고려대학교','서울'),
	(3,'연세대학교','서울'),
	(4,'한양대학교','서울');
    
select * from school;

insert into student(student_id,student_name,grade,school_id)
values 
	(1,'홍길동','1학년',1),
	(2,'김유신','2학년',2),
	(3,'이순신','1학년',3),
	(4,'유관순','3학년',1),
	(5,'안중근','2학년',4);

-- 제약 키 FK 사용하게 된다면 여러가지 제약사항이 생기게 된다.
SELECT * FROM student;
desc student;

insert into student(student_id,student_name,grade,school_id)
values (6,'야스오','1학년',10);

/*
Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
(`mydb`.`student`, CONSTRAINT `student_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`))
*/

-- 야구 팀과 야구 선수 관계를 1 : N

CREATE TABLE team (
    id INT PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(50) NOT NULL
);

CREATE TABLE player(
	player_id int primary key auto_increment,
    player_name varchar(50) not null,
    team_id int,
    foreign key (team_id) references team (id)
);

INSERT INTO team (team_name)
values 
	('LG 트윈스'),
	('NC 다이노스'),
	('두산 베어스');
    
INSERT INTO player(player_name,team_id)
values
	('허경민',1),
	('김하성',2),
	('최원준',3);
    
select * from team;
select * from player;

-- 부서와 직원 관계를 설계해보세요
-- department_id,department_name
create table department(
	id int primary key auto_increment,
    name varchar(20)
);

drop table employee;
desc department;

CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES department (id)
);

select * from department;
select * from employee;



CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id)
        REFERENCES product (id)
);

drop table product_detail;
drop table product;



insert into product(name,price)
values 
	('노트북',1000000),
	('스마트폰',700000),
	('키보드',50000);
    

    
insert into `order`(order_date,product_id)
values
	(20220215,2),
	(20220216,1),
	(20220217,3);

desc product;
desc `order`;

select * from product;
select * from `order`;
select * from buy;

-- 테스트
-- 1
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    grade VARCHAR(3) NOT NULL,
    school_id INT
);
-- 2
CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    price INT NOT NULL
);

insert into product(name,price)
values 
	('노트북',1000000),
	('스마트폰',700000),
	('키보드',50000);

-- 3
CREATE TABLE buy(
	buy_id INT PRIMARY KEY AUTO_INCREMENT,
    buy_date DATE NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product (id)
);


-- 4
INSERT INTO buy(buy_date,product_id)
VALUES 
	('2022-12-01',1),
    ('2021-01-13',3),
    ('2021-01-15',2);

-- 5
SELECT *
FROM product as p
INNER JOIN buy as b
ON p.id = b.product_id;

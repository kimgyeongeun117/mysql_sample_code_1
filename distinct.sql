-- 1단계
select * 
from employees
GROUP BY gender;

-- 2단계
select *,count(gender)
from employees
group by gender;

-- 조건 두개 걸기
select *,count(hire_date)
from employees
group by hire_date,gender;

--
select *
from employees;
-- 1:n
select * from dept_emp;
-- n:1
select * from departments;
-- employees : department --> n:m 관계 차수를 가진다.
-- 중간 테이블 dept-emp 만들어서 n:m를 표현하고 있다.

-- employees : dept_emp --> 1:n 관계로 풀어 진다.
-- departments : dept_emp --> 1:n 관계로 풀어 진다.
-- 1단계 조인
select * 
from employees as e
left join dept_emp as d
on e.emp_no = d.emp_no;

-- employees테이블과 dept_emp 테이블을 left join하여 성별이 남자인 정보 중에 이름과 성별 고용일을 10개만 출력하라
SELECT first_name,last_name,gender,hire_date 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
WHERE gender = 'M' LIMIT 10;

-- 컬럼을 추가해라
ALTER TABLE titles
ADD COLUMN category_id int,
ADD CONSTRAINT fk_category FOREIGN KEY (category_id)
REFERENCES Category(id);

select * from titles;
-- 2단계 중복 칼럼 제거하기
-- distinct
select DISTINCT * 
from employees as e
left join dept_emp as d
on e.emp_no = d.emp_no
left join departments as dp
on d.dept_no = dp.dept_no;

SELECT * from dept_emp;
select * from departments;
select * from employees;
-- 이름,성별,고용일 을 출력해라

-- 3단계
select e.emp_no, e.first_name, d.dept_no,dp.dept_name
from employees as e
left join dept_emp as d
on e.emp_no = d.emp_no
left join departments as dp
on d.dept_no = dp.dept_no;

-- 4단계
select e.emp_no, e.first_name, d.dept_no,dp.dept_name
from employees as e
left join dept_emp as d
on e.emp_no = d.emp_no
left join departments as dp
on d.dept_no = dp.dept_no
GROUP BY dept_no
having dept_no = 'd001';

SELECT * FROM titles;
-- staff --> 결과집합으로 staff 직원의 이력을 결과 집합으로 만들기
-- 오름차순이 default
select * 
from employees as e
INNER JOIN titles as t
on e.emp_no = t.emp_no
where t.title = 'Staff'
ORDER BY e.emp_no desc 
limit 10;

-- 2 단계
SELECT e.emp_no, e.first_name, e.last_name, t.title 
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff';

-- 
select * from salaries;
select * from employees;

SELECT COUNT(s.salary) AS salaryCount
FROM salaries AS s
inner JOIN employees AS e
ON s.emp_no = e.emp_no
WHERE e.first_name = 'Georgi' AND e.last_name = 'Facello';

desc person;

CREATE DATABASE blog;

CREATE TABLE user(
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE blog(
	blog_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    content TEXT,
    user_id INT,
    create_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USER (user_id)
);

CREATE TABLE reply(
	reply_id INT PRIMARY KEY AUTO_INCREMENT,
    blog_id INT,
    reply VARCHAR(1000),
    create_reply DATETIME NOT NULL,
    FOREIGN KEY (blog_id) REFERENCES blog (blog_id)
);

desc user;
desc blog;
desc reply;

INSERT into user(name)
values 
	('김경은'),
	('김민우존'),
	('정다운');
    
INSERT INTO blog(name,content,user_id,create_date)
VALUE 
	('저녁에 뭐먹을래?','민우는 교촌 허니콤보 먹고 싶다는데',1,'2023-03-10');

DELETE 
FROM blog
WHERE name = '집에 간다' and blog_id = 5;

update blog
set name = '저녁 메뉴 정함' , content = '나도 먹고 싶어'
where name = '저녁 메뉴' and user_id = 1;

select * from blog;
    
SELECT * from user;
SELECT * from blog;
SELECT * from reply;

desc blog;

alter table blog modify name VARCHAR(100) not null;

-- MySQL 버전 확인
SELECT @@VERSION;




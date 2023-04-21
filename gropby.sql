show TABLES;

SELECT * FROM salaries;

SELECT * FROM salaries limit 10;
SELECT * FROM salaries limit 10,5;

select *
from salaries
GROUP BY emp_no
HAVING emp_no = 10001;
-- group by에 조건절을 사용할 때는 having 절을 사용한다.
-- 2단계
select *,count(salary)
from salaries
GROUP BY emp_no;

-- 3단계 max,min
select *,count(salary) as count,
		MAX(salary) as max,MIN(salary) as min,
        sum(salary) as sum, round(avg(salary),2) as avg -- 소수점 2째 자리까지
from salaries
GROUP BY emp_no;

SELECT * FROM salaries;
select * from employees;
select * from departments;
select * from titles;
-- 1.title 테이블에서 Senior Engineer 타이틀의 갯수는
select *,count(title) as title
from titles
GROUP BY title
HAVING title = 'Senior Engineer';
-- 2. employees 테이블에서 남자의 명수는?
select *,count(gender) as count
from employees
GROUP BY gender
HAVING gender = 'M';

-- 1. 
select t.emp_no, s.salary
from titles as t
inner JOIN salaries as s
on t.emp_no = s.emp_no
GROUP BY emp_no;

-- 2.
select t.emp_no, s.salary ,count(salary) as count
from titles as t
inner JOIN salaries as s
on t.emp_no = s.emp_no
GROUP BY emp_no
HAVING salary >= 65000;

-- 3.
select s.emp_no,max(salary) as max
from salaries as s
left JOIN titles as t
on s.emp_no = t.emp_no
where title like '%Engineer';

-- 4.
select dept_no,count(*) as count
from dept_emp
GROUP BY dept_no;

-- 5.
select title,count(emp_no) as count
from titles
GROUP BY title;

-- 6.
select s.emp_no ,max(salary)
from salaries as s
left join employees as e
on s.emp_no = e.emp_no
GROUP BY gender
having gender = 'M';



SELECT * FROM salaries;
select * from employees;
select * from departments;
select * from titles;
select * from dept_emp;
select * from dept_manager;



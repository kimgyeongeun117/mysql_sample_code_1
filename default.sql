-- 테이블 제약사항에 NULL 허용 의미와 NOT NULL 허용 의미
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name varchar(50) not null,
    grade int not null,
    major varchar(50)
);
-- 이미 생성된 테이블 제약 사항 변경하기
ALTER TABLE student modify grade int null;
desc student;

insert into student(student_id,name,major)
values(1,'홍길동','검술학과');

-- grade 제약을 not null로 변경 해보기
-- 테이블 값이 하나 들어가 있는 상태
ALTER TABLE student modify grade int not null;

select * from student;
-- 하나의 행을 삭제하는 쿼리 - where절(조건절)
delete from student where student_id = 1;

desc student;
-- major 컬럼 제약을 not null로 변경해 주세요
alter table student modify major varchar(50) not null;

-- 컬럼 선언 부분을 생략도 가능하다. 단 전부 값을 넣을려고 하는 상황일 때
insert into student values(2,'홍길동2',3,'검술학과');
select * from student;

-- insert 구문 컬럼명 선언 방식
-- 1. 전부 작성하는 방법
-- 2. 제약 사항이 null 인 열이 있다면 넣고 싶은 열만 지정해서 구문을 작성할 수 있다.
-- 3. 전부 데이터를 넣는 상황이라면 컬럼 선언 부분을 생략 가능하다.

-- NOT NULL과 디폴트 값 사용

DROP TABLE student;
CREATE TABLE student (
    student_id INT primary key,
    name varchar(50) not null,
    grade int not null,
    major varchar(50) default '미정' not null
);
desc student;

-- 디폴트 제약을 사용했을 때 값을 넣는 방법 1
INSERT INTO student(student_id,name,grade,major)
values 
	(1,'John',3,'경영학과'),
	(2,'Jane',2,'경영학과'),
	(3,'Mike',1,DEFAULT),
	(4,'David',2,DEFAULT);
    
SELECT * FROM student;
-- 디폴트 제약을 사용했을 때 값을 넣는 방법 2
INSERT INTO student(student_id,name,grade)
values
	(5,'홍길동1',2),
	(6,'홍길동2',3),
	(7,'홍길동3',1),
	(8,'홍길동4',3);
    
-- professor 컬럼 제약사항을 default로 추가하고 값을 빈 문자열로 만들어 주세요
-- 빈문자열의 의미는 ""
CREATE TABLE subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50) NOT NULL,
    credit INT NOT NULL,
    department VARCHAR(50) NOT NULL,
    professor VARCHAR(50) NOT NULL
);

-- 테이블이 생성되어 있을 때 제약 변경 default 구문 추가
alter table subject modify professor varchar(30) not null default '';
desc subject;





    
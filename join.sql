CREATE DATABASE shopdb;
use shopdb;

CREATE TABLE userTBL(
	username char(3) not null,
    birthYear int not null,
    addr char(20) not null,
    mobile char(13) not null,
    primary key(username)
);

ALTER TABLE userTBL modify mobile varchar(13);

CREATE TABLE buyTBL(
	username char(3) not null,
    prodName char(3) not null,
    price int not null,
    amount int not null,
    foreign key (username) references userTBL (username)
);

insert into userTBL values('이승기', 1987, '서울', '010-1234-1234');
insert into userTBL values('홍길동', 1911, '부산', '010-2222-3333');
insert into userTBL values('이순신', 1999, '대구', '010-3333-4444');

insert into buyTBL values('이승기', '운동화', 50, 1);
insert into buyTBL values('이승기', '노트북', 150, 1);
insert into buyTBL values('홍길동', '책', 10, 5);
insert into buyTBL values('홍길동', '모니터', 200, 2);
insert into buyTBL values('이순신', '청바지', 40, 1);
insert into buyTBL values('이순신', '책', 10, 3);

-- 에러 발생
-- 부모 테이블 userTBL에 야스오는 없는 사람이기에 존재할 수 없다.
insert into buyTBL values('야스오', '책', 10, 3);

select * from userTBL;
select * from buyTBL;

-- inner join
SELECT *
FROM userTBL
INNER JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- left join
SELECT 	*
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username;

-- 야스오 회원 가입 함
INSERT INTO userTBL(username,birthYear,addr,mobile)
values ('야스오',2020,'부산','010-1234-1234');

SELECT *
FROM userTBL
LEFT JOIN buyTBL
ON userTBL.username = buyTBL.username
WHERE buyTBL.username IS NOT NULL;

-- AS (별칭) 사용해서 inner join
SELECT *
FROM userTBL AS U
INNER JOIN buyTBL AS B
on U.username = B.username;

-- 별칭 사용 LEFT JOIN, LEFT JOIN IS NOT NULL
SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username;

SELECT *
FROM userTBL AS U
LEFT JOIN buyTBL AS B
ON U.username = B.username
WHERE B.username IS NOT NULL;

-- LEFT JOIN 기준 테이블 선정
-- 기준 테이블 선정에 따라 결과 집합이 다를 수 있다.
-- 기준 테이블 선정 기준은 작은 데이터를 기준으로 하는 것이 좋다.
SELECT *
FROM buyTBL as b
LEFT JOIN userTBL as u
ON b.username = u.username;

-- RIGHT JOIN
SELECT u.username, b.prodName, b.price, b.amount
FROM userTBL as u
RIGHT JOIN buyTBL as b
ON u.username = b.username;

-- 문제 작성 3문제 
SELECT 'aaaa';

select * from buyTBL;
select * from userTBL;
-- 1.userTBL 기준으로 left join해서 username과 price, amount를 조회해라
SELECT u.username,(b.price*b.amount) as sum
FROM userTBL as u
RIGHT JOIN buyTBL as b
ON u.username = b.username;

-- 2.userTBL 기준으로 INNER JOIN하고 buyTBL에서 수량이 3개 이상인 데이터만 조회해라
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE b.amount >= 3;

-- 3.buyTBL 기준으로 RIGHT JOIN하고 username이 '이승기'이거나 '야스오'이면서 userTBL의 username이 null이 아닌 데이터를 조회해라
SELECT *
FROM buyTBL AS u
RIGHT JOIN userTBL AS b
ON u.username = b.username
WHERE b.username in ('야스오','이승기') and u.username is not null;

-- 함수 사용해 보기
SELECT u.username, b.prodName, b.price, b.amount, (b.price * b.amount) AS sum
FROM userTBL as u
RIGHT JOIN buyTBL as b
ON u.username = b.username;

-- 1.
select u.username, b.prodName
from userTBL as u
INNER JOIN buyTBL as b
ON u.username = b.username
WHERE u.username like '이%' and u.birthYear = '1999';

-- 2.
SELECT b.username, u.addr, u.mobile, b.prodName, b.price, b.amount
FROM userTBL as u
LEFT JOIN buyTBL as b
ON u.username = b.username 
where b.username is not null;

-- 3.
select *
from userTBL as u
LEFT JOIN buyTBL as b
ON u.username = b.username;

-- 4.userTBL 기준으로 INNER JOIN하고 buyTBL에서 수량이 3개 이상인 데이터만 조회해라
SELECT *
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.username = b.username
WHERE b.amount >= 3;

-- 5.buyTBL 기준으로 RIGHT JOIN하고 username이 '이승기'이거나 '야스오'이면서 userTBL의 username이 null이 아닌 데이터를 조회해라
SELECT *
FROM buyTBL AS u
RIGHT JOIN userTBL AS b
ON u.username = b.username
WHERE b.username in ('야스오','이승기') and u.username is not null;

-- 6.
SELECT b.username, b.amount
FROM buyTBL as b
LEFT JOIN userTBL as u
ON u.username = b.username
WHERE birthYear = '1999';

-- 7.
SELECT b.username, u.mobile
FROM userTBL as u
INNER JOIN buyTBL as b
ON u.username = b.username
WHERE prodName = '책';

-- 8.
SELECT b.username, b.prodName
FROM buyTBL AS b
RIGHT JOIN userTBL AS u
ON u.username = b.username
WHERE addr = '대구';
















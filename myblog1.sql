
use mydb;
select * from customer;
use myblog;

-- user 테이블 생성
-- id : pk 부여
-- username : 사용자 이름 100자 not null, 중복 허용 불가(유니크)
-- password : 100자 not null,
-- email : 100자 not null,
-- address : 100자
-- userRole : ADMIN, MANAGER, USER
-- createDate

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDate TIMESTAMP
);

select * from user;

-- 블로그 사이트 
CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) not null,
    content BLOB,
    readCount int DEFAULT 0,
    userId int,
    FOREIGN KEY(userId) REFERENCES user(id)
);
select * from board;

-- user : board -> 1 : N
-- 댓글 테이블 만들기
CREATE TABLE reply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(300) NOT NULL,
    createDate TIMESTAMP,
    boardId INT,
    userId INT,
    FOREIGN KEY(boardId) REFERENCES board(id),
    FOREIGN KEY(userId) REFERENCES user(id)
);

-- user : reply -> 1 : N
-- board : reply -> 1 : N

select now();

INSERT INTO user(username,password,email,address,userRole,createDate)
values('홍길동','1234','a@naver.com','부산시 중구','USER',now());

select * from user;

-- username 과 password가 일치하는 사용자 찾아 보기
SELECT * 
FROM user
WHERE username = '홍길동' 
	AND password = '1234';

select * from blog;
desc blog;
desc user;

select * from blog where name = '내일 메뉴 정함';
INSERT INTO blog(name,content,user_id,create_date)
VALUE 
	('버버벅','짜장면',1,now());
    
select *
from blog
where name like '내일 메뉴%';

select DATE_FORMAT(now(), '%Y-%m-%d') as create_date;

INSERT INTO board(title,content,userId)
values('첫번째 게시글','자바는 쉬운거에요',3);

SELECT * from board;

DELETE from board where id = '4';

alter table board MODIFY content text;

create DATABASE albums;

CREATE TABLE albums(
	id int PRIMARY KEY AUTO_INCREMENT,
    userId int,
    title VARCHAR(100) 
);

desc albums;
select * from albums;
delete from albums;
drop table albums;

ALTER TABLE albums AUTO_INCREMENT = 0;
alter TABLE albums MODIFY userId int AUTO_INCREMENT;
alter TABLE albums MODIFY id int not null;

insert INTO albums (title,userId)
VALUE ("점심 뭐먹",10);

insert INTO albums (title,userId)
VALUE ("저녁은 뭐먹을",1);

delete from albums where id = 100 and userId = 10;

select*from user;
desc user;
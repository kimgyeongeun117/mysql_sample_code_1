select * from blog;
desc blog;
desc user;
desc reply;


desc category;
desc todolist;


drop table category;
drop table user;
drop table board;
desc board;
desc user;
desc board;

create DATABASE bootblog;
use bootblog;

create table category(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

create table user (
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) not null,
    email VARCHAR(50) UNIQUE not null,
    password VARCHAR(50) not null,
    phoneNumber VARCHAR(50) not null,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

create table board(
	id int PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(100) not null,
    user_id int not null,
    title VARCHAR(100) NOT NULL,
    description text not null,
    category_id int not null,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

create table reply(
	id int PRIMARY KEY AUTO_INCREMENT,
    user_id int not null,
    board_id int not null,
    userName VARCHAR(100) not null,
    content VARCHAR(200),
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

insert into category(name)
VALUES
	("운동"),
	("공부"),
    ("게임"),
    ("패션뷰티"),
    ("과학");
insert into user(name,email,password,phoneNumber)
VALUES ("김경은","uki117@naver.com","1234","01025662988");
select * from user;
select * from category;
select * from board;
delete from board where id > 6;
delete from user where id>3;
desc board;
delete from board where id>5;
ALTER TABLE board AUTO_INCREMENT=6;
ALTER TABLE user AUTO_INCREMENT=4;
select * from board where user_id = 1 and id = 6;

alter table board add FOREIGN KEY(category_id) REFERENCES category(id);
alter table board add FOREIGN KEY(user_id) REFERENCES user(id);

ALTER TABLE board
ADD COLUMN views int DEFAULT 0;


update board set views = 0 where id = 5;
select * from reply;
select * from board LIMIT 0,5;
select * from board LIMIT 0,3;
select * from board;
drop table reply;
desc reply;
delete from reply where id>0;
alter table reply AUTO_INCREMENT=1;
DELETE FROM board WHERE id = 13 AND user_id = 1;

CREATE DATABASE kimblog;
USE kimblog;

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    userRole VARCHAR(20),
    createDate TIMESTAMP
);

CREATE TABLE board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    readCount INT DEFAULT 0,
    userId INT,
    FOREIGN KEY(userId) REFERENCES user(id)
);

desc board;
desc user;

SELECT * FROM user;
SELECT * FROM board;

delete from user where username = '김민우';

create database chatting;
drop table room;

CREATE TABLE user(
	id INT PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);

create table room(
	id INT PRIMARY KEY AUTO_INCREMENT,
    roomName VARCHAR(100) not null,
    userId int not null,
    password VARCHAR(100) not null
);

create table chat(
	id INT PRIMARY KEY AUTO_INCREMENT,
    userId int,
    content VARCHAR(100),
    FOREIGN KEY (userId) REFERENCES user (id)
);

desc user;
select * from user;
delete from user where id = 3;
aLTER TABLE user AUTO_INCREMENT = 0;
alter TABLE user MODIFY userId int AUTO_INCREMENT;
alter TABLE user MODIFY id int not null;
drop table user;

select * from chat;
delete from chat;
alter table chat AUTO_INCREMENT = 0;
alter table chat MODIFY id int;
alter table chat MODIFY id int AUTO_INCREMENT;
desc chat;
drop table chat;

insert into chat (userId,content)
VALUES (1,"김경은");

create DATABASE demo5;
use demo5;

create table user(
	id INT not null AUTO_INCREMENT,
    username VARCHAR(50) not null,
    password VARCHAr(50) not null,
    email VARCHAR(50) not null,
    PRIMARY KEY(id)
);

select * from user;
show VARIABLES like 'c%';



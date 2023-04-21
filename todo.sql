CREATE DATABASE todo;
use todo;
-- id, 제목, 내용, 우선순위, 완료 여부, 생성일
-- DDL(Data Definition Language)
create TABLE TodoList(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    priority INT NOT NULL DEFAULT 0,
    completed TINYINT NOT NULL DEFAULT 0,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 카테고리 테이블
-- id, 이름
CREATE TABLE Category(
	id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) not null
);

-- TodoList : 자식 테이블
ALTER TABLE TodoList
ADD COLUMN category_id int,
ADD CONSTRAINT fk_category FOREIGN KEY (category_id)
REFERENCES Category(id)
on UPDATE CASCADE 
on DELETE CASCADE;

desc TodoList;
select * from category;
desc category;
drop table category;
delete from category where id = 7;
delete from category where id > 5;
update category set name = '헬스' where id=1;
alter table category modify id int PRIMARY key not null;
ALTER TABLE category AUTO_INCREMENT=4;
delete from category where id = 5;
-- 샘플데이터 준비
INSERT into category(name) values ('운동');
INSERT into category(name) values ('공부');
INSERT into category(name) values ('연애');
INSERT into category(name) values ('집안일');

alter table todolist AUTO_INCREMENT=3;
select * from todolist;
Insert into TodoList (title,description,category_id)
values ("할 공부","토익",2);
Insert into TodoList (title,description,category_id)
values ("할 운동","달리기",1);
Insert into TodoList (title,description,category_id)
values ("할 집안일","청소",4);

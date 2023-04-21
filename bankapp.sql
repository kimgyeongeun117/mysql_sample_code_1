create DATABASE bank;
use bank;

-- 유저 테이블 설계해 보기
create TABLE user_tb(
	id int AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) not null UNIQUE,
    password VARCHAR(30) not null,
    fullname VARCHAR(50) not null,
    created_at TIMESTAMP not null DEFAULT now()
);

-- 사용자의 계좌 정보 테이블 설계
create TABLE account_tb(
	id int AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(30) not null UNIQUE,
    password VARCHAR(20) not null,
    balance BIGINT not null COMMENT '계좌 잔액',
    user_id int,
    created_at TIMESTAMP not null DEFAULT now()
);

-- 입금 내역 저장
-- 출금 내역 저장
-- 사용자간 이체 내역 저장 

-- 사용자들의 history 테이블 설계
-- BIGINT 8바이트 크기의 정수형
CREATE TABLE history_tb(
	id int AUTO_INCREMENT PRIMARY KEY COMMENT '거래 내역 ID',
    amount BIGINT not null COMMENT '거래 금액',
    w_account_id int COMMENT '출금 계좌 id',
    d_account_id int COMMENT '입금 계좌 id',
    w_balance BIGINT COMMENT '출금 요청된 계좌의 잔액',
    d_balance BIGINT COMMENT '입금 요청된 계좌의 잔액',
    created_at TIMESTAMP not null DEFAULT now()
);

INSERT INTO user_tb(username, password, fullname, created_at) values('길동', '1234',
'고', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('둘리', '1234',
'애기공룡', now());
INSERT INTO user_tb(username, password, fullname, created_at) values('콜', '1234',
'마이', now());

select * from user_tb;

INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('1111', '1234', 900, 1, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('2222', '1234', 1100, 2, now());
INSERT INTO account_tb(number, password, balance, user_id, created_at)
values('333', '1234', 0, 3, now());

select * from account_tb;

-- 히스토리 추적 내용(이체, 입금, 출금)
-- 히스토리 테이블에 insert 구문을 작성
-- 이체 내역을 기록 (1번 계좌, 2번 계좌에 100원을 이체 한다)
delete from history_tb;
alter table history_tb AUTO_INCREMENT =1;

insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (100,800,1200,1,2,now());

-- 출금 내역 (1번 계좌에서 100원을 출금 처리)
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (100,700,null,1,null,now());

-- 입금 내역 (1번 계좌에 500원 입금 처리)
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (500,null,1200,null,1,now());

-- --------------------
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (100,900,1100,1,2,now());

-- 출금 내역 (1번 계좌에서 100원을 출금 처리)
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (100,800,null,1,null,now());

-- 입금 내역 (1번 계좌에 500원 입금 처리)
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (500,null,700,null,1,now());

select * from history_tb;

-- 출금 내역 (3번이 1000원 출금,잔액 0원 인 상태를 거래 내역 기록)
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (1000,1000,null,3,null,now());

-- 이체 연습
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (100,800,1200,1,2,now());
-- 입금 연습

-- 출금 연습
desc history_tb;

-- 1.출금 내역 id는 1
select * from history_tb where w_account_id = 1;
-- 2.입금 내역 id는 1
select * from history_tb where d_account_id = 1;
-- 3.입출금 게좌 id1번 
select * from history_tb where w_account_id = 1 or d_account_id = 1;


select * from account_tb;
select * from history_tb;
select * from user_tb;


-- 입금 1번 계좌에 300원 입금 
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (300,null,900,null,1,now());

-- 출금 1번 계좌에서 500원 출금
insert into history_tb(amount,w_balance,d_balance,
						w_account_id,d_account_id,created_at)
VALUES (500,1200,null,3,null,now());

-- 1번 계좌 입출금 쿼리를 만드시오 

-- 입금
select a.amount, a.d_account_id,a.d_balance, b.number
from history_tb as a
inner join account_tb as b
on b.user_id = a.d_account_id;

-- 출금
select a.amount, a.w_account_id,a.w_balance, b.number as 계좌번호
from history_tb as a
inner join account_tb as b
on b.user_id = a.w_account_id;

select * from account_tb;
select * from history_tb;


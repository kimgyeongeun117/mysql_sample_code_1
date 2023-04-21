
-- 트랜잭션 처리해보기
select * from user_tb;

START TRANSACTION;

insert into user_tb(username,password,fullname)
values('john','1234','kim');

insert into user_tb(username,password,fullname)
values('Mike','1234','Lee');

ROLLBACK;
-- 오류나면 자동 롤백 @transactional

/*
	계좌 간 이체
    게좌 A의 잔액은 3,000원 입니다.
    게좌 B의 잔액은 0원 입니다.
    계좌 A에서 B로 3000원 이체 하기
*/
-- 테스트를 위한 설정
UPDATE account_tb set balance = 3000 where id = 1;
UPDATE account_tb set balance = 0 where id = 2;

select * from account_tb;
select * from history_tb;

start TRANSACTION;
update account_tb set balance = balance - 3000 WHERE id = 1;
update account_tb set balance = balance + 3000 WHERE id = 2;
insert into history_tb(amount,w_balance,d_balance,w_account_id,d_account_id)
values (3000,
	(select balance from account_tb where id = 1),
    (select balance from account_tb where id = 2),
    1,2);
commit;





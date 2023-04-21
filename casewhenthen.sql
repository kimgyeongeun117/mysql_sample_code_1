select * from account_tb;

-- 1번 계좌 출금 내역
select h.id,h.amount,h.w_balance,
		wa.number as sender,ifnull( h.d_account_id,'ATM') as receiver,
        da.number
from history_tb as h
left join account_tb as wa
on h.w_account_id = wa.id
left join account_tb as da
on h.d_account_id = da.id
where h.w_account_id = 1;

-- d_account_id 표시 하기
-- 1번 계좌에 입금 내역 + 출금 계좌 번호(이체시)
select h.id,h.amount,h.d_balance,h.created_at,da.number as receiver,ifnull(h.w_account_id,'ATM') as sender,
		wa.number
from history_tb as h
left join account_tb as da
on h.d_account_id = da.id
left join account_tb as wa
on h.w_account_id = wa.id
where h.w_account_id = 2 or h.d_account_id = 2;

-- 출금 내역 + 입금 내역
select * from
history_tb where w_account_id = 2 or d_account_id = 2;

-- 입금 내역 : 쿼리 결정
select h.id,h.amount,h.d_balance as balance, h.created_at,
		ifnull(wa.number,'ATM') as sender,
        da.number as receiver
from history_tb as h
left join account_tb as da
on h.d_account_id = da.id
left join account_tb as wa
on h.w_account_id = wa.id
where h.d_account_id = 2;

-- 출금 내역
select h.id,h.amount,h.w_balance as balance, h.created_at,
		ifnull(da.number,'ATM') as receiver,
        wa.number as sender
from history_tb as h
left join account_tb as wa
on h.w_account_id = wa.id
left join account_tb as da
on h.d_account_id = da.id
where h.w_account_id = 1 or h.d_account_id =1;

-- CASE WHEN THEN END
select h.id,h.amount,h.w_balance as balance, h.created_at,
		ifnull(da.number,'ATM') as receiver,
        wa.number as sender
from history_tb as h
left join account_tb as wa
on h.w_account_id = wa.id
left join account_tb as da
on h.d_account_id = da.id
where h.w_account_id = 1 or h.d_account_id =1;

-- ----------------------------
select h.id,h.amount,
case when h.w_account_id = 1 then (h.w_balance)
	 when h.d_account_id = 1 then (h.d_balance)
     end as balance,
     ifnull(wa.number,'ATM') as sender,
     ifnull(da.number,'ATM') as receiver,
     h.created_at
from history_tb as h
left join account_tb as da
on h.d_account_id = da.id
left join account_tb as wa
on h.w_account_id = wa.id
where h.d_account_id = 1 or h.w_account_id = 1;

select * from account_tb;
select * from history_tb;







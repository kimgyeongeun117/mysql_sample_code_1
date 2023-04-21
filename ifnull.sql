select * from history_tb;
-- 2단계
-- 1번 계좌 출금 내역
select h.id,h.amount,h.w_balance,
		wa.number as sender,ifnull( h.d_account_id,'ATM') as receiver
from history_tb as h
left join account_tb as wa
on h.w_account_id = wa.id
where h.w_account_id = 1;

-- 1번 계좌에 입금 내역
select h.id,h.amount,h.d_balance,h.created_at,da.number as receiver,ifnull(h.w_account_id,'ATM') as sender
from history_tb as h
left join account_tb as da
on h.d_account_id = da.id
where h.d_account_id = 2;










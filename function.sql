
/*
ABS(), CEIL(), FLOOR(), ROUND(), TRUNCATE() 
NOW(), CURDATE(), CURTIME(), YEAR(), MONTH(), DAY(), HOUR(), MINUTE(), SECOND(), DATE_FORMAT()
*/
SELECT NOW();
SELECT CURDATE();

-- string Function
SELECT ASCII('U');
SELECT CHAR_LENGTH('my sql test');
SELECT CONCAT("green", "class","    100%") AS title;
SELECT CONCAT_WS("->","class","mysql","홍길동"); -- 연결시 마다 -> 넣어주기
SELECT find_in_set('q','S,Q,L'); -- 뒤의 문자중에 앞의 문자 위치 반환
SELECT format(2500.123,3); -- 소수점 출력 포멧 설정
SELECT lcASE('HELLO JAVA');
SELECT ucase('hello java');
SELECT trim('  MY S Q L ');	-- 양 끝 공백 제거
SELECT rEPLACE('  MY S Q L ', ' ', '');	-- 공백을 빈공백으로 처리

-- MySQL Numberic functioN
SELECT * FROM buyTBL;
SELECT *, sum(price) as '상품가격에 총 합' FROM buyTBL;

select *,(select sum(price)froM BUYTBL)AS 총합계
from bUYTBL;

-- AVG
SELECT *, avg(price) as '상품평균가격'
frOM BuyTBL;

SELECT *,(SELECT AVG(PRice) FROM buyTBL) AS 평균값
FROM bUYTBL;

-- 올림
SELECT CEIL(25.12);
-- 반올림
SELECT round(123.56,1);
-- 버림 함수
SELECT FLOOR(25.75);

SELECT proDNAME, max(prIcE)
from buyTBL;

SELECT min(price)
frOM BUYTBL;

SELECT prodName,min(pRICE)
fROM BUYTBL;







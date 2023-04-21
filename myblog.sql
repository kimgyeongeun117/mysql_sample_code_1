-- blog
-- 서버 프로그램 구현 - MYSQL <-- 서버와 연동
CREATE database myblog;
use myblog;

-- 사용자 생성
CREATE USER 'bloguser'@'%' IDENTIFIED by '1q2w3e4r5t';
-- 사용자 기본 권한 조회
-- DB를 선택
USE mysql;
SELECT user,host from user;

-- '%' 어디서든지 접근 가능한 권한 (IP 주소 개념)
SELECT * from user where user = 'bloguser';
GRANT ALL PRIVILEGES ON *.* TO 'bloguser'@'%';
-- 방금 권한 변경을 즉시 적용 할려면 한가지 명령어를 더 해 줘야 한다.
-- FLUSH : 설정한 권한 적용 명령어
FLUSH PRIVILEGES;

show TABLES;

SELECT *
FROM board
where id = 3;

SELECT *
FROM user;

INSERT INTO board(title,content,userId)
VALUES ('테스트글1','테스트 내용1',1);

SELECT * FROM board;

DELETE From board
where id = 5;




-- bbsDB DataBase 생성하기
CREATE DATABASE bbsDB;
-- bbsDB DataBase 접속하기
USE bbsDb;
-- bbsDb 에 포함된 Table 리스트 확인하기
SHOW TABLES;
DESC tbl_bbs;

DROP TABLE tbl_bbs;
CREATE TABLE tbl_bbs (
	b_seq	bigint	PRIMARY KEY	AUTO_INCREMENT,
	b_pseq	bigint,			
	b_date	varchar(10),			
	b_time	varchar(10),			
	b_username	varchar(125),			
					
	b_subject	varchar(125),			
	b_content	text,			
	b_count	int,			
	b_update	datetime			
);

CREATE TABLE tbl_user (
	username	varchar(125) PRIMARY KEY,
	nickname	varchar(125),		
	tel	varchar(20)		
);
SELECT COUNT(*) FROM tbl_bbs;

INSERT INTO tbl_user(username, nickname,tel)
VALUES('callor@callor.com','내멋으로','010-1111-1111');
COMMIT ;

-- EQ JOIN 
-- 두 Table 이 완전한 참조무결성관계에 있을때만
-- 정상적인 데이터가 나타난다
-- tbl_bbs 데이터에 b_username 칼럼의 데이터가
-- callor@callor.com 으로 되어 있는데
-- 이 데이터가 tbl_user 테이블에 있으면 정상적으로
-- 출력이되고, 그렇지 않으면 데이터가 누락되는 현상
SELECT B.b_seq, B.b_pseq, B.b_date,
	B.b_time, B.b_username, U.nickname,
	B.b_subject, B.b_content, B.b_count, B.b_update  
FROM tbl_bbs B, tbl_user U
WHERE B.b_username = U.username
		LIMIT 10;
        
-- tbl_bbs 테이블과 tbl_user 테이블이 완전 참조 무결성
-- 관계인지 검증하는 SQL
-- LEFT JOIN 은 참조무결성과 관계없이 JOIN 결과를
-- 정상적으로 확인 가능하다
-- 이때 N:1 의 관계에서 NULL 인 데이터가 있으면
-- 테이블간에 참조무결성관계가 성립되지 않는다
-- 이 테이블간에는 FK 설정이 불가능하다
SELECT * 
FROM tbl_bbs B
	LEFT JOIN tbl_user U
		ON B.b_username = U.username
WHERE U.nickname IS NULL;        

DELETE FROM tbl_user WHERE username = 'callor@callor.com';




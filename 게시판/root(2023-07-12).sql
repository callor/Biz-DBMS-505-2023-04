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





-- root 접속화면
CREATE DATABASE bbsDB;
USE bbsDB;

CREATE TABLE tbl_bbs (
	b_seq	bigint		PRIMARY KEY	AUTO_INCREMENT,
	b_pseq	bigint,			
	b_date	varchar(10),			
	b_time	varchar(10),			
	b_username	varchar(125),			
	b_nickname	varchar(125),			
	b_subject	varchar(125),			
	b_content	text,			
	b_count	int,			
	b_update	datetime			
);
SELECT * FROM tbl_bbs;

SELECT b_username, b_nickname
FROM tbl_bbs
GROUP BY b_username,b_nickname;

CREATE TABLE tbl_user (
	username VARCHAR(125) PRIMARY KEY,
    nickname VARCHAR(125) NOT NULL,
    tel VARCHAR(20)
);

-- tbl_bbs 로 부터 user 정보 정규화로 분해하기
INSERT INTO tbl_user(username, nickname )
VALUES('callor@callor.com','내멋으로');

INSERT INTO tbl_user(username, nickname,tel )
VALUES('hong','홍길동','010-1111-1111');
INSERT INTO tbl_user(username, nickname,tel )
VALUES('lee','이몽룡','010-2222-2222');
INSERT INTO tbl_user(username, nickname,tel )
VALUES('seong','성춘향','010-3333-3333');

SELECT * FROM tbl_user;

SELECT b_username
FROM tbl_bbs
GROUP BY b_username;

ALTER TABLE tbl_bbs
ADD CONSTRAINT F_USERNAME
FOREIGN KEY (b_username)
REFERENCES tbl_user(username);

-- FK 설정이 되면
-- 두 Table 간에 
-- INSERT, UPDATE, DELETE 에서 이상현상을
-- 방지하여 참조무결성관계를 유지한다
INSERT INTO tbl_bbs(b_username, b_nickname)
VALUES ('aaa','임꺽정') ;

DESC tbl_bbs;

SELECT 
	B.b_seq,
	B.b_pseq,
	B.b_date,
	B.b_time,
	B.b_username,
    U.nickname,
	B.b_subject,
	B.b_content,
	B.b_count,
	B.b_update
FROM tbl_bbs B, tbl_user U
	WHERE B.b_username = U.username
LIMIT 10    
	






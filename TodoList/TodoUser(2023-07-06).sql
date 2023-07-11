-- 여기는 todo 로 접근한 화면
USE todoDB;
CREATE TABLE tbl_todolist (
	to_seq BIGINT PRIMARY KEY AUTO_INCREMENT,
    to_sdate VARCHAR(10) NOT NULL,
    to_stime VARCHAR(10) NOT NULL,
    to_content VARCHAR(400) NOT NULL,
    to_edate VARCHAR(10),
    to_etime VARCHAR(10)
);
DESC tbl_todo;



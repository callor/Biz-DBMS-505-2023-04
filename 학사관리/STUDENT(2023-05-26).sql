-- 여기는 student 사용자 화면
-- student 사용자는 현재 DBA 권한을 가지고 있다.
-- DBA 권한 테이블생성 수정 삭제, 데이터의 CRUD, COMMIT ROLLBACK 등의 명령을
--      수행할수 있다

-- 사용자 입장에서 데이터 저장소 생성
-- 실제 논리적인 데이터를 관리하는 객체
-- TABLE 

/*
RDBMS(Relation DataBase Management System)에서 데이터 취급하기

    1. 물리적인 저장소를 생성하기 = Oracle 에서는 TableSpace = CREATE TABLESPACE
    2. Table 저장소 생성:논리적 개념 = table = CREATE TABLE
    3. CRUD 구현하기

*/

-- 데이터를 추가하기전에 Table 생성 오류가 발견되면, 제거하고 다시 생성할수 있다
-- DROP TABLE tbl_student; -- TABLE 제거하기
CREATE TABLE tbl_student (

    st_num	VARCHAR2(10)		PRIMARY KEY,
    st_name	nVARCHAR2(20)	NOT NULL,	
    st_dept	nVARCHAR2(20),		
    st_grade	NUMBER,		
    st_tel	VARCHAR2(20)	NOT NULL	

);

-- 이미 데이터가 추가되었는데 Table 구조의 문제를 발견했다
-- Table 을 변경(수정)하기
-- st_tel 칼럼의 데이터 type 변경
-- 테이블의 구조를 변경하는 명령은 매우 비용이 크기 때문에
-- 사용할때 항상 주의를 해야 한다.
-- 특히 칼럼의 크기(길이) 를 변경하거나, type 을 변경할때는
-- 데이터 손상이 될수 있기 때문에 매우 조심해야 한다
ALTER TABLE tbl_student MODIFY (st_tel VARCHAR2(20));




-- CRUD 실습
--1. 데이터 추가(CREATE)
-- st_num 칼럼은 PK 로 선어되어 있기 때문에 데이터는 필수이며, 중복될수 없다
-- st_num 칼럼은 PK 로 선언되어 있기 때문에 NOT NULL, UNIQUE 성질을 갖는다

INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade, st_tel)
VALUES('230001','홍길동','정보통신',3,'010-111-1111');

INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade, st_tel)
VALUES('230002','성춘향','법학과',2,'010-222-1111');

INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade, st_tel)
VALUES('230003','이몽룡','행정학과',4,'010-333-1111');


-- 2. 데이터 조회하기(READ)

-- 아무 조건없이 모든 데이터 보이기
SELECT * FROM tbl_student;

-- Projection 
-- 칼럼을 원하는 순서대로 나열하여 모든 데이터 보이기
SELECT st_num, st_name, st_dept, st_grade, st_tel
FROM tbl_student;

-- Projection
-- 전체 칼럼(속성)중에서 학번(st_num), 이름(st_name)만 보이도록
SELECT st_num, st_name
FROM tbl_student;

-- Selection
-- 데이터 중에서 이름(st_name) 값이 홍길동 인 데이터들을 보여라
-- 조건부여 검색, 조건부여 SELECT, 조건부여 조회
SELECT st_num, st_name, st_dept, st_grade, st_tel
FROM tbl_student
WHERE st_name = '홍길동';

-- 전체데이터를 SELECT 하되
-- 학생이름(st_name) 값을 기준으로 오름차순 정렬하여 보여라
SELECT st_num, st_name, st_dept, st_grade, st_tel
FROM tbl_student
ORDER BY st_name;

-- 학생이름으로 정렬하고, 같은 이름이 있으면 그 범위내에서 
-- 전화번호로 한번더 정렬하여 보여라
SELECT st_num, st_name, st_dept, st_grade, st_tel
FROM tbl_student
ORDER BY st_name, st_tel;

-- 3. Update
-- Update 를 수행할때는 내가 변경하는 데이터가 정말 변경하고자 하는 데이터인가?
-- 홍길동 학생의 전화번호가 010-111-1111 에서 010-111-1234 로 변경되었다
-- 데이터를  수정하라

-- 일반적인 Update 명령은 다음과 같다. 문법적으로는 아무런 문제가 없으나
-- 결과적으로 심각한 문제를 안고 있다
-- 홍길동 이라는 이름이 동명이인이 있을 경우, 원하지 않는 데이터가 변경될수 있다
-- 이 코드를 실행하면 원하지 않는 홍길동 학생의 전화번호가 변경될수 있다
-- 이러한 현상을 "수정 이상", "변경 이상" 이라고 한다
UPDATE tbl_student
SET st_tel = '0101-111-1234'
WHERE st_name = '홍길동';

-- Update 절차
-- 1. 변경하고자 하는 데이터를 조회한다
SELECT * FROM tbl_student
WHERE st_name = '홍길동';

-- 2. 조회된 데이터 중에서 변경하고자 하는 데이터의 PK가 무엇인지 확인한다
--  여기서는 230001 임이 확인되었다

-- 3. PK 를 기준으로 데이터 변경하기
UPDATE tbl_student
SET st_tel = '010-111-1234'
WHERE st_num = '230001';

--4. 데이터의 삭제 : 효용이 없어진 데이터를 Table 로 부터 삭제하기
SELECT * FROM tbl_student;

-- 이몽룡(전화번호가 010-333-1111인) 학생이 자퇴를 하고 이민을 갔다
-- 이몽룡 학생의 데이터를 table 에서 삭제하고자 한다

-- 다음 코드는 학생테이블에서 다수의 이몽룡 학생의 데이터가 삭제되는 문제가 있다
-- 원하지 않는 데이터가 삭제되는 현상을 "삭제 이상" 이라고 한다
-- 이러한 코드도 매우 신중하게 사용해야 한다
DELETE FROM tbl_student
WHERE st_name = '이몽룡';

-- 이몽룡 학생의 데이터를 삭제하는 절차
-- 1. 먼저 내가 삭제하고자 하는 이몽룡 데이터를 조회
SELECT * FROM tbl_student
WHERE st_name = '이몽룡';

-- 2. 삭제하고자 하는 데이터의 PK를 확인
-- 여기는 230003 인 PK 를 확인하였다
-- 3. PK 를 기준으로 삭제를 실행
DELETE FROM tbl_student
WHERE st_num = '230003';

COMMIT;

SELECT * FROM tbl_student;










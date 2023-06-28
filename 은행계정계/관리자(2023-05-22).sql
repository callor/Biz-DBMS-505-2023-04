-- 커멘트
/* 커멘트 */
-- 여기는 관리자 화면으로 로그인한 상태
-- C:/app/data

-- 기본 키워드(명령문) 대문자
-- 변수명, 사용자정의 이름 소문자


-- 1. 데이터 저장소( TableSpace ) 생성
CREATE TABLESPACE myDB
DATAFILE 'C:/app/data/mydb.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K; 

-- 삭제, 제거 : DELETE, DROP 
-- DELETE : 데이터의 일부 요소를 삭제하기, 데이터 구조 등은 변화가 없다
-- DROP : 물리적인 데이터 요소를 제거하기, 데이터 구조 제거, 많은 데이터를 한꺼번에 제거
--      데이터 파괴자 명령, 매우 신중하게 주의하면서 사용해야 한다
--DROP TABLESPACE myDB
--INCLUDING CONTENTS AND DATAFILES;

-- 21c 에서 일부 권한이 필요한 스크립트 실행가능하도록 설정하기
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;


-- 2. DB 에 연결하여 실습(사용)할 일반 사용자 계정을 생성하기
CREATE USER C##myuser IDENTIFIED BY 12341234
DEFAULT TABLESPACE MYDB;

-- 3. 생성상 사용자 계정에 권한(ROLE)부여하기

-- login 할수 있는 권한 부여
GRANT CREATE SESSION to C##myuser;
REVOKE CREATE SESSION FROM C##myuser;

-- TABLE 을 생성할수 있는 권한 부여
GRANT CREATE TABLE TO C##myuser;
REVOKE CREATE TABLE FROM C##myuser;

-- 실습의 편리성을 위하여 SYSDBA 보 한단계 낮은 일반 DBA 권한을 부여
-- 오라클에서는 SYSDBA(SYSTEM 등)의 User 권한은 매우 조심해서 신중하게 다루어야 한다
-- DB 사용의 편의성을 위하여 오라클에서는 DBA  권한을 일반 사용자에게 부여할수 있도록
-- 하고 있다

-- 이 권한은 실무(실제환경)에서는 절대 사용하면 안된다.
-- 시스템의 중요한 데이터 사전을 제외한 모든 데이터를 
-- 핸들링(추가, 수정, 삭제, 제거 등)을 할수 있는 권한이다
-- 다만 실습 환경에서만 사용하자
GRANT DBA TO C##myuser;


SHOW USER;
GRANT DBA TO myuser;

-- DROP USER C##myuser CASCADE;






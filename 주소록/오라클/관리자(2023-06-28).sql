-- 여기는 관리자 화면

-- 주소록 데이터를 관리하기 위하여 Project 시작
-- Oracle 은 데이터를 저장하기 위하여 데이터 저장공간을 먼저 설정해야 한다
-- 물리적 저장공간을 TableSpace 라고 한다

/*
addrDB 라는 이름의 저장소를 만들겠다
실제 데이터가 저장되는 공간은 c:/app/data/addr.dbf 파일이다
초기 크기는 1M(Byte)이며 용량이 부족하면 1K(byte)씩 자등으로 증가시켜라
*/
CREATE TABLESPACE addrDB
DATAFILE 'c:/app/data/addr.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

/*
Oracle 에서는 실제 데이터는 TABLESPACE 에 저장되지만
System 을 통해 DB 데이터에 접근할때는 TABLESPACE 를 통하지 않는다
생성된 TABLESPACE 와 연결하는 사용자를 생성하고,
사용자(user)를 통하여 데이터에 접근한다
*/
-- 사용자 생성
-- 오라클 21c(12c 이상)에서는 사용자 등록을 하기 전에 SCRIPT 실행을 ON 해야 한다
-- 오라클 12c 이상에서는 사용자 ID C##아이디 형식으로 생성해야 한다
-- 사용자 ID 를 관리하기가 상당히 불편하다
-- 이 작업을 선행하지 않으면 사용자ID와 TABLESPACE 를 연동할 수 없다
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

/*
addr 이라는 사용자ID 를 등록하고
비밀번호는 12341234 로한다
또한 addr 사용자와 addrDB TABLESPACE 를 서로 연동한다
*/
CREATE USER addr IDENTIFIED BY 12341234
DEFAULT TABLESPACE addrDB;

/*
새로 생성한 사용자에게 DB 접근(CRUD)할수 있는 권한 부여
권한을 부여할때 로그인, CRUD 하기, TABLE 생성하기 등의 권한을
세부적으로 부여해야 하는데,
학습하는 상황에서 세부적인 권한부여는 다소 불편함이 있어서
DBA 의 권한을 부여한다

Oracle 에서 DBA 의 권한은 SYSDBA 보다 다소 제한된 권한이다
System에 직접 접근하는 것은 금지하고, 그외 권한을 모두 부여한다
*/
-- 사용자ID addr 에게 DBA 권한을 부여한다
GRANT DBA TO addr;







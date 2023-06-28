-- 관리자로 로그인 한 화면
-- 관리자는 SYSDBA 권한을 가진 사용자
-- SYSDBA 사용자는 데이터베이스 시스템을 생성, 제거, 파과할수 있는 권한을 가진 사용자

-- 오라클에서 관리자로 로그인하여 수행할 작업
-- TableSpace 생성, User 생성
-- TABLESPACE : 데이터를 저장할 물리적 저장소(파일), 데이터를 저장하기 위하여
--      가장 먼저 생성해야할 객체
-- USER : DBMS 서버에 로그인을 하고, 자신이 관리할 데이터들과 연결하는 객체
--      오라클에서 USER 는 데이터 저장소의 개념이다. 
--      이 개념은 다른 DBMS와는 약간 다르게 취급한다.
--      저장소 SCHEME 라고 표현한다

-- C:/app/data : TABLESPACE 가 저장될 폴더

-- 1. TableSpace 생성(CREATE 키워드)
-- student TABLESPACE 를 생성하고
-- 저장소는 STUDENT.DBF 로 하라
-- 초기 용량은 1MByte 로 설정하고 1KByte 씩 자동증가하도록 설정하라
CREATE TABLESPACE student -- 저장소의 이름을 student 라는 이름으로 사용하겠다
DATAFILE 'C:/app/data/student.dbf' -- 저장소 폴더에 STUDENT.DBF 라는 이름으로 생성
SIZE 1M AUTOEXTEND ON NEXT 1K; -- 초기의 저장소 공간을 1M(byte)확보하고
                                -- 혹시 부족하면 1K(Byte)씩 자동으로 증가하라

-- 2. 사용자 생성(CREATE 키워드)
-- student 라는 사용자를 생성하고 비밀번호를 12341234 로 설정하고
-- 기본 저장소 연결을 student 로 설정하라

-- 오라클 12c 이후 버전에서는 사용자 이름 등록하는 정책이 변경되었다
-- 만약 student 라는 사용자를 생성하고 싶으면 C##student 라는 이름으로 생성을 해야 한다.
-- 이러한 정책은 보안적인 면에서 권장하지만 때로는 불편할때가 있다
-- 일부 프로그래밍 언어에서 DB 에 접속할때 ## 와 같은 특수문자가 있으면
-- 접속에 문제를 일으키는 경우가 있다.
-- 오라클에서는 12c 이후에 사용자 생성 정책을 예전 방식으로 사용할수 있도록 하는
-- 설정을 제공한다
-- 이 설정 명령은 USER 를 생성하기 전에 항상 실행 해 주어야 한다.

ALTER SESSION SET "_ORACLE_SCRIPT" = true;
CREATE USER student IDENTIFIED BY 12341234
DEFAULT TABLESPACE student;

-- 3. 생성한 사용자에게 권한을 부여
-- 사용자(student)는 DBMS 소프트웨어어 로그인을 하고
--      SQL을 사용하여 데이터 Table 을 생성하고
--      CRUD 명령을 수행하여 데이터를 관리한다
-- 오라클에서 사용자를 생성(CREATE) 한 직후에는 아무런 권한이 없다
--      심지어 DBMS 소프트웨어 로그인할 수 도 없다
-- 사용자에게 권한을 부여하여 기능을 활성화 시켜줘야 한다.
-- 원칙적으로 권한 부여는 각각 항목별도 세부적으로 부여해야 하지만
-- 학습적 편리성을 위하여 모든 권한을 한번에 부여 할 것이다

-- student 사용자 에게 DBA(데이터 관리자) 권한을 부여하라
GRANT DBA TO student;










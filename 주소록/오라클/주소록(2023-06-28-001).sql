-- 여기는 addr 사용자 화면

-- 1. 데이터를 저장할 TABLE 생성하기
CREATE TABLE tbl_address (
    a_id	VARCHAR2(5)		PRIMARY KEY,
    a_name	nVARCHAR2(20)	NOT NULL,	
    a_tel	VARCHAR2(15)	NOT NULL,	
    a_addr	nVARCHAR2(125)	NOT NULL	
);

-- 엑셀파일에서 데이터 import
-- import 한 후에 데이터가 모두 잘 import 되었는지 확인하기
SELECT * FROM tbl_address;

-- 현재 tbl_address TABLE 에 저장된 데이터가 모두(*) 몇개이냐?
-- COUNT() 함수 : 테이블에 저장된 데이터의 개수를 확인하는 함수
SELECT COUNT(*) FROM tbl_address;

-- 함수에 칼럼이름을 지정하여 개수를 확인하기
-- 여기에서는 COUNT(*), COUNT(A_ID)의 결과가 같다
SELECT COUNT(A_ID) FROM tbl_address;

-- tbl_address TABLE 에 A_ID 값의 최대값, 최소값 확인하기
-- MAX(), MIN() 테이블에 저장된 특정 칼럼의 최대값, 최소값을 찾는 함수
SELECT MAX(A_ID), MIN(A_ID) FROM tbl_address;

/*
SQL(Structure Query Lang.) : 구조화된 DBMS 핸들링 문법
ANSI SQL : 모든 DBMS SW 에 거의 공통으로 구현된 명령 문법
    표준화된 문법으로 DBMS SW 가 달라고 사용할수 있는 문법
    
특정 SQL : 각 메이커별 DBMS SW 의 고유한 기능을 구현한 명령 문법    
*/

SELECT *
FROM tbl_address;

-- 주소록 전체데이터에서 a_id, a_name 속성(칼럼) 정보만 보여달라
-- 칼럼의 일부만 표현하도록 하는 것 : Projection 이라고 한다
SELECT a_id, a_name
FROM tbl_address;

-- 필요에 따라서 칼럼을 나열하고
-- 필요에 따라서 칼럼의 보여지는 순서를 변경할수 있다
SELECT a_name, a_addr, a_tel
FROM tbl_address;

-- 모든 칼럼(*) 로 조회를 하면, 실제 원하는 칼럼의 순서와 관계없이
-- 데이터가 표현되기도 한다
SELECT *
FROM tbl_address;

-- TABLE 의 모든 칼럼을 나열한 Projection
-- SELECT 명령에서 모든 칼럼(*)으로 조회하는 것 보다는 ALL Project 으로 조회를
-- 하는 것이, 조회 속도면에서 더 유리하다
-- 코딩(java.. 등등)과 연동하여 사용할때는 가급적 ALl Project 을 사용하는 것이
-- 좋다
SELECT a_id, a_name, a_tel, a_addr
FROM tbl_address;

-- A_ID 가 A0010 이하인 데이터들만 보여달라
-- 일반적인 코딩 문법과 달리 SQL 에서는 문자열형 칼럼 데이터에 대하여
-- 부등호 연산이 가능하다
-- 전체 데이터 중에서 특정 조건을 부여하여
-- 조건에 맞는 데이터만 골라내는 명령 : Selection 명령
SELECT *
FROM tbl_address
WHERE a_id <= 'A0010';

/*
Relation Algebra(관계 대수)
DBMS 에서 특정 조건을 부여하여 데이터를 SELECT 하는 것

PROJECTION : 특정칼럼만 나열하여 데이터를 SELECT 하는 것
    SELECT 절에 칼럼 리스트 나열 : SELECT a_id, a_name
    
SELECTION : 특정조건에 맞는 데이터를 SELECT 하는 것
    WHERE 절에 조건식 부여하여 리스트 제한 : SELECT * FROM [table] WHERE 조건
*/

SELECT *
FROM tbl_address
WHERE a_tel = '090-3663-2154';

-- LIKE : 중간문자열 조건 검색
SELECT *
FROM tbl_address
WHERE a_tel LIKE '090-33%';

-- a_tel 칼럼의 데이터를 5번째 위치부터 잘라서 보여라
-- SUBSTR() Oralce 의 문자열 자르기 함수
SELECT SUBSTR(a_tel, 5)
FROM tbl_address;

-- a_tel 칼럼의 데이터를 5번째 위치부터 4개만 잘라서 보여라
SELECT SUBSTR(a_tel, 5, 4)
FROM tbl_address;

-- a_tel 칼럼의 데이터를 5번째 위치부터 4개만 자르고
-- a_tel 칼럼을 기준으로 오름차순 정렬하여 보여라
SELECT SUBSTR(a_tel, 5, 4)
FROM tbl_address
ORDER BY a_tel;


/*
1. tbl_address TABLE 이 있는 확인
2. TABLE 있으면 데이터를 조회할 준비
3. WHERE 절의 조건대로 데이터 SELECTION
4. SELECT 절의 칼럼대로 데이터 PROJECTIOn
5. ORDER BY 절의 칼럼을 기준으로 정렬

SELECT FROM 은 필수항목
WHERE ORDER BY 는 선택항목

*/
SELECT a_id, a_name, a_tel
FROM tbl_address
WHERE a_id < 'A0010'
ORDER BY a_tel;

-- 아래의 두 SELECTION 명령은 같은 결과를 보여준다
-- 많은 양의 데이터중에서 SELECTION 수행할때
-- LIKE 키워드를 사용한 WHERE 절 해석은 매우 느리게 작동한다
-- 상황에 따라 적절하게 사용하자.

-- 전화번호 앞에서 6글자를 잘라서
-- 전화번호가 090-33 으로 시작되는 데이터 SELECTION
SELECT * 
FROM tbl_address
WHERE SUBSTR(a_tel,1,6) = '090-33';

-- 전화번호 6글자가 090-33 으로 시작되는 데이터 SELECTIOn
SELECT *
FROM tbl_address
WHERE a_tel LIKE '090-33%';

-- ID 값이 A0010 ~ A0020 인 데이터만 SELECTION 하라
SELECT *
FROM tbl_address
WHERE a_id >= 'A0010' AND a_id <= 'A0020';

/*
SQL 에서 WHERE 등 조건을 부여하여 SELECTION 을 할때
특히 다중 조건을 부여할때,
조건문의 순서에 따라 SELECT 결과의 효율이 달라질 수 있다
조금더 깊이 생각하여 효율적인 SQL 명령문을 고민해 보자

1. 첫번째 SELECTION
    먼저 범위를 제한하여 개수를 제한하고
    전화번호를 찾는다
    
2. 두번째 SELECTION 
    전체 범위에서 전화번호를 찾고
    그중에서 범위를 제한하여 개수를 제한한다
*/
SELECT *
FROM tbl_address
WHERE a_id >= 'A0100' AND a_id <= 'A0200' AND a_tel LIKE '090-33%';

SELECT *
FROM tbl_address
WHERE a_tel  LIKE '090-33%' AND a_id >= 'A0100' AND a_id <= 'A0200';














-- 여기는 addr USER 화면입니다
/*
tbl_address table 에 대하여 다음 결과를 확인하는 SQL 을 작성
1. TABLE 에 저장된 전체 데이터의 개수는 몇개인가
2. TABLE 에 저장된 전체 리스트를 전화번호 순으로 정렬하여 확인하기
3. TABLE 에 저장된 전체 리스트를 이름 순으로 정렬하여 확인하기
4. TABLE 에 저장된 전체 리스트중에 성씨가 "이" 으로 시작되는 리스트 확인하기
5. TABLE 에 저장된 전체 리스트중에 전화번호의 국번 (090-2222-1234 중에 두번째 구역)
    이 3으로 시작되는 리스트의 개수는 몇개인가

*/

-- 1. TABLE 에 저장된 전체 데이터의 개수는 몇개인가
SELECT COUNT(*)
FROM tbl_address;

-- 2. TABLE 에 저장된 전체 리스트를 전화번호 순으로 정렬하여 확인하기
-- 기본값인 ASC(오름차순) 정렬은 생략 가능
SELECT *
FROM tbl_address
ORDER BY a_tel ASC;

-- 2.2 역순정렬
-- DESC(내림차순) 정렬
SELECT *
FROM tbl_address
ORDER BY a_tel DESC;

-- TABLE 구조 확인
-- ORDER BY 의 DESC 키워드와는 다른 키워드
DESCRIBE tbl_address;
-- 축약형
DESC tbl_address;


-- 3. TABLE 에 저장된 전체 리스트를 이름 순으로 정렬하여 확인하기
SELECT * 
FROM tbl_address
ORDER BY a_name;

-- 3.1 ID 순으로 정렬을 하고, 
--      같은 ID 가 있으면 그 그룹에서 이름순으로 정렬
SELECT * 
FROM tbl_address
ORDER BY a_id, a_name;

-- 3.2 ID 순으로 오름차순 정렬을 하고,
--      같은 ID 가 있으면 그 그룹에서 이름순으로 내림차순 정렬        
SELECT * 
FROM tbl_address
ORDER BY a_id, a_name DESC;


-- 4. TABLE 에 저장된 전체 리스트중에 성씨가 "이" 으로 시작되는 리스트 확인하기
SELECT * 
FROM tbl_address
WHERE a_name LIKE '이%';

-- 5. TABLE 에 저장된 전체 리스트중에 전화번호의 
-- 국번 (090-2222-1234 중에 두번째 구역)
--     이 3으로 시작되는 리스트의 개수는 몇개인가

-- 중간 문자열 검색, 전화번호중에 3이 포함된 모든 전화번호
SELECT *
FROM tbl_address
WHERE a_tel LIKE '%3%';

SELECT *
FROM tbl_address
WHERE SUBSTR(a_tel,5,1) = '3'
ORDER BY a_tel;

SELECT *
FROM tbl_address
WHERE a_tel LIKE '____3%'
ORDER BY a_tel;








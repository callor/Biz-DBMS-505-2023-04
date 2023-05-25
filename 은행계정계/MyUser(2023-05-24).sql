-- 여기는 MyUser(C##myuser) 로 접속한 화면

SELECT acNum, acDiv,acBuId,acBalance
FROM tbl_acc
ORDER BY acNum;

SELECT *
FROM tbl_acc
WHERE acNum = '2023052301' ;

SELECT * FROM tbl_acc;

INSERT INTO tbl_acc(acNum, acDiv, acBuid, acBalance)
VALUES('2023052401','1','0001',10000);

INSERT INTO tbl_acc(acNum, acDiv, acBuid, acBalance)
VALUES('2023052402','2','0003',10000);
COMMIT;

SELECT * FROM tbl_acc;

SELECT * 
FROM tbl_acc
WHERE acBuid = '0001'
ORDER BY acNum;

-- 고객ID 가 0001 인 고객의 계좌정보를
-- 잔액 순으로 정렬하여 보이기
-- 오름차순(ASCENDING) 정렬 : 기본값 키워드 생략가능
SELECT * 
FROM tbl_acc
WHERE acBuid = '0001'
ORDER BY acBalance ASC;

-- 고객ID 가 0001 인 고객의 계좌정보를
-- 잔액 큰것 부터 순서대로 정렬하여 보이기
-- 내림차순(DESENDING)
SELECT * 
FROM tbl_acc
WHERE acBuid = '0001'
ORDER BY acBalance DESC;

-- 고객ID 0001과 0003 인 고객의 계좌정보 조회
SELECT *
FROM tbl_acc
WHERE acBuid = '0001' OR acBuid = '0003';

SELECT *
FROM tbl_acc
WHERE acBalance >= 20000;

-- 1개의 칼럼에 다수의 조건 검색이 필요한 경우
-- OR 연산일 경우 IN 키워드를 사용할 수 있다.
SELECT *
FROM tbl_acc
WHERE acBuid IN ('0001','0003');

-- 잔액이 10000 ~ 20000 인 데이터 조회
SELECT *
FROM tbl_acc
WHERE acBalance >= 10000 AND acBalance <= 20000; 

-- 각각 범위 값이 포함관계( >=, <= )인경우
-- BETWEEN 키워드로 검색 가능
SELECT * 
FROM tbl_acc
WHERE acBalance BETWEEN 10000 AND 20000;

-- acBuId 에 0001 OR 0003 의 반대인 경우
-- acBuid 에 0001 도 아니고 0003 도 아닌 값의 조건검색
SELECT *
FROM tbl_acc
WHERE NOT acBuId IN ('0001','0003');

-- 위와 같은 결과의 코드
SELECT * 
FROM tbl_acc
WHERE acBuid != '0001' AND acBuid <> '0003';

DESCRIBE tbl_acc;

-- table 의 구조 변경(DDL 명령을 사용)
-- table 의 구조를 변경하는 것은 상당히 많은 비용이 소요된다
-- 초기에 설계가 잘못된 경우 구조변경을 실시하는데 상당한 주의를 기울여야 한다
-- 구조변경 과정에서 문제가 발생하면 데이터가 손상되는 문제가 있다
-- 구조변경 할때 칼럼의 크기는 절대 줄여서 변경하면 안된다

-- tbl_acc 의 acNum 칼럼의 길이가 VARCHAR2(10) 인데 
-- 이 칼럼의 길이를 VARCHAR2(20)으로 변경
ALTER TABLE tbl_acc MODIFY (acNum VARCHAR2(20));
DESC tbl_acc;

SELECT * FROM tbl_acc;

-- SQL 에는 기본적으로 여러 기능을 수행하는 함수들이 내장되어 있다
--  substr(칼럼,시작,개수) : 칼럼의 문자열을 시작 위치부터 개수 만큼 잘라내기
-- max(칼럼) : 전체 리스트(조건에 맞는 데이터중에서) 중에서 가장 큰 값을 찾기
-- min(칼럼) : 전체 리스트(조건에 맞는 데이터중에서) 중에서 가장 작은 값 찾기
SELECT substr(max(acNum),9)
FROM tbl_acc
WHERE  substr(acNum,0,8) = '20230523';












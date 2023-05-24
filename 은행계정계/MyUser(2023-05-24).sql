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









-- 여기는 MyUser SCHEME 화면
-- 여기는 MyUser 로 접속한 화면

SHOW TABLES;

DESCRIBE tbl_buyer;

/* 
SELECT 명령
SQL 의 DML 명령중에 가장 많이 사용하는 명령
DB>TABLE에 보관(저장)중인 데이터를 조회하는 명령

tbl_buyer TABLE 에 저장된 데이터를 아무 조건 없이
모두 조회하여 보여달라 
*/
SELECT * FROM tbl_buyer;

-- tbl_buyer TABLE 에 저장된 데이터를 "아무 조건 없이" 보이되
-- buid, buname 칼럼(field, 속성)만 보여달라
-- 저장된 데이터 중에서 id 와 이름 항목만 보고 싶다
SELECT buid, buname FROM tbl_buyer;

-- 이름과 전화번호 칼럼만 리스트로 보여라
SELECT buname, butel FROM tbl_buyer;

-- tbl_buyer TABLE 에 저장된 데이터 중에서 buname(이름) 항목의 데이터가
-- 성춘향 으로 되어 있는 데이터들만 리스트로 보고 싶다
-- WHERE 절 : 조건을 부여할때
SELECT * FROM tbl_buyer WHERE buname = '성춘향';

SELECT * FROM tbl_buyer WHERE buname = '이몽룡';

-- 이름이 홍길동 으로 되어 있는 데이터 리스트를 보고싶다
-- 데이터가 없다 이런경우 Result(결과) 과 Empty 인 상태 이다
SELECT * FROM tbl_buyer WHERE buname = '홍길동' ;

/*
buname 칼럼을 기준으로 조건 설정하였다
buname 칼럼에 어떤 값을 조건으로 데이터를 조회 한 것
buname 칼럼은 데이터가 추가될때 같은 이름의 데이터가 중복하여 저장될 수 있다
buname 칼럼을 기준으로 조회한 데이터가 비록 현재는 1개만 보이더라도
    이 데이터는 0개 이상의 데이터가 조회될 것이다 라는 것을 반드시 예상해야 한다
    
만약 buname 칼럼을 기준으로 하여 데이터를 Update, Delete 를 수행할 경우
다수의(2개이상) 데이터에 변경(수정)이 이루어 질 수 있다
그러한 이유로 Update, Delete 를 수행할때는 절대 buname 칼럼을 기준으로 삼아서는 안된다.
*/
INSERT INTO tbl_buyer(buid, buname)
VALUES('0003','성춘향');

SELECT * FROM tbl_buyer;

SELECT * FROM tbl_buyer
WHERE buname = '성춘향';

SELECT * FROM tbl_buyer;

/*
buid 칼럼을 기준으로 조회하기
buid 칼럼을 TABLE 을 create 할때 PK(PRIMARY KEY) 성질을 설정하였다
PK 로 설정된 칼럼은 유일성, NOT NULL 속성을 갖게 된다.

만약 이 칼럼에 이미 있는 데이터를 또다시 추가하려고 하면 다음과 같은 오류가 발생한다
ORA-00001: 무결성 제약 조건(C##MYUSER.SYS_C008316)에 위배됩니다
PK 칼럼에 0001 이라는 값을 갖는 데이터가 있는데 또다시 0001 이라는 데이터를
추가하려고 했기 때문에 발생하는 오류


*/
SELECT * FROM tbl_buyer WHERE buid = '0001';

-- 무결성제약조건 오류
-- 중복데이터 추가 오류
INSERT INTO tbl_buyer(buid, buname)
VALUES('0001','임꺽정');

/*
ORA-01400: NULL을 ("C##MYUSER"."TBL_BUYER"."BUID") 안에 삽입할 수 없습니다
현재 INSERT 명령을 수행하면서 buid 에 해당하는 값을 지정(저장)하지 않았다
*/
INSERT INTO tbl_buyer(buname)
VALUES('임꺽정');
INSERT INTO tbl_buyer(buid)
VALUES('0004');

/*
TABLE 을  create  하면서
buid 와 buname 을 NOT NULL 로 설정하였다
데이터를 추가할때(INSERT)할때 최소한 buid 값과 buname 값을 필수로 
필요하다 라는 선언
이러한 설정을 "제약조건" 설정 이라고 한다
데이터를 추가할때 조금이라도 문제가 있는 데이터를 추가하여
전체 데이터베이스에 문제가 발생하는 것을 방지하는 목적이다
    => "무결성 유지" 라고 한다
*/
INSERT INTO tbl_buyer(buid, buname)
VALUES('0004','임꺽정');

/*
TABLE : Entity 를 물리적으로 구현한 상태
데이터를 보관, 관리하는 기본적인 frame(틀)이다
DBMS 소프트웨어 마다 데이터를 저장하는 방법은 각각 고유한 기술적 부분이다
이러한 부분을 DB 개발자, 사용자가 알 필요는 없다
DBMS 에서는 개발자, 사용자가 바라보는 모든데이터는 TABLE(표) 형식이다

TABLE 을 작성하기 앞서, 개념적, 논리적 모델링을 수행하는데 
이 단계에서는 TABLE을 Entity 라고 한다

프로그래밍(Java 등) 에서는 TABLE을 객체, 객체 등으로 취급한다.
Java 의 데이터 클래스가 여기에 해당한다.

*/

SELECT * FROM tbl_buyer;

-- 매우 위험한 코드
-- Update, Delete 를 수행할때는 PK 가 아닌 칼럼을 기준으로 하지 마라
-- 만약 PK 아닌 칼럼을 기준으로 할때는 매우 신중하게 명령을 수행해야 한다
UPDATE tbl_buyer 
SET buTel = '010-333-3333'
WHERE buname = '성춘향';

/*
tbl_buyer 테이블에 성춘향 데이터 중에서 전화번호가 없는 데이터가 있다
전화번호가 없는 성춘향 데이터의 전화번호를 010-333-3333 으로 변경하고자 한다

1. buname 칼럼의 데이터가 성춘향 인 리스트를 조회를 한다.
2. 전화번호가 없는(null 인) 데이터의 buid 값을 확인한다 : 0003 임을 알수 있다
3. buid(PK 칼럼)을 기준으로 Update 를 실시한다.
*/
SELECT * FROM tbl_buyer WHERE buname = '성춘향';

UPDATE tbl_buyer
SET butel = '010-333-3333'
WHERE buid= '0003';

/*
1. 전체 고객 데이터를 조회
2. 이몽룡의 주소가 현재 서울특별시 이다
    그런데 이몽룡이 전라북도 익산시로 이사를 했다
3. 이몽룡의 주소를 서울특별시에서 전라북도 익산시로 변경하고자 한다
*/
SELECT * FROM tbl_buyer;

SELECT * FROM tbl_buyer WHERE buname = '이몽룡';
UPDATE tbl_buyer SET buaddr = '전라북도 익산시' WHERE buid = '0001';

SELECT * FROM tbl_buyer;

INSERT INTO tbl_buyer(buid, buname)
VALUES('0004','임꺽정');

SELECT * FROM tbl_buyer;

-- PK 인 buid 값이 0004 인 데이터를 삭제하기
-- 불필요한 데이터 삭제하기
DELETE FROM tbl_buyer
WHERE buid = '0004';

SELECT * FROM tbl_buyer;


-- 데이터 추가
-- 칼럼목록 개수, 순서 = 데이터목록 개수, 순서 일치해야 한다
INSERT INTO [table] (칼럼목록)
VALUES(데이터목록);

-- 데이터 조회
SELECT 칼럼목록 FROM [table]
WHERE 칼럼 = 값;

-- 데이터 수정
UPDATE [table] SET 칼럼 = 값 -- 변경할 변수와 값
WHERE 칼럼 = 값              -- 변경할 조건

-- 데이터 삭제
DELETE FROM [table]
WHERE 칼럼 = 값        -- 삭제할 조건

-- 계좌정보
CREATE TABLE tbl_acc (
    acNum	VARCHAR2(10) PRIMARY KEY,
    acDiv	VARCHAR2(1)	NOT NULL,	
    acBuId	VARCHAR2(5)	NOT NULL,	
    acBalance	NUMBER	DEFAULT 0	
);

-- 각 고객의 계좌정보 생성하기
INSERT INTO tbl_acc(acNum, acDiv, acBuid,acBalance)
VALUES('2023052301','1','0003',10000);

INSERT INTO tbl_acc(acNum, acDiv, acBuid,acBalance)
VALUES('2023052302','1','0001',50000);

INSERT INTO tbl_acc(acNum, acDiv, acBuid,acBalance)
VALUES('2023052303','1','0002',10000);

SELECT * FROM tbl_acc;

/*
현재 계좌정보를 조회했는데
고객정보가 고객ID 뿐이어서 고객에 대한 이름, 전화번호 등을 알수가 없다
고객정보와 계좌정보를 연계하여 함께 볼수 있다면 좋겠네.

Table JOIN 
2개(이상)의 Table 을 서로 연계하여 하나의 리스트로 보기

tbl_acc와 tbl_buyer 테이블을 연계하여 하나의 리스트로 보여라
이때 tbl_acc 의 acBuid 와 tbl_buyer buid 칼럼의 데이터를 비교하여
같은 데이터는 한 라인에 보여라
*/
SELECT * FROM tbl_acc, tbl_buyer
WHERE acBuId = buId;

-- JOIN 을 하되 4개의 칼럼만 화면에 나타나도록 하고 싶다
SELECT acNum, acBuId, buName, buTel
FROM tbl_acc, tbl_buyer
WHERE acBuId = buId;

SELECT * FROM tbl_buyer;

-- Projection : SELECT 조회를 할때 별표(*)를 사용하지 않고 칼럼을 나열하는 것
SELECT buid, buname, butel, buaddr, bubirth, bujob
FROM tbl_buyer
ORDER BY buid;

SELECT buid, buname, butel, buaddr, bubirth, bujob
FROM tbl_buyer
ORDER BY buname, butel;


INSERT INTO tbl_buyer(buid, buname, butel)
VALUES ('0004','임꺽정','010-444-44444');

/* 
SQL Developer 와 Java 코드에서 DB 를 서로 연동하여 처리하는 경우 발생하는 문제
SQD 에서 데이터를 INSERT, UPDATE, DELETE 를 수행하는 경우
    추가, 수정, 삭제된 정보는 아직 storage 에 반영되지 않고, 메모리에 임시
    보관(저장)된 상태이다
이 상태일때 Java 에서 SELECT  를 수행하면 INSERT, UPDATE, DELETE 된 데이터가
아닌 이전 상태의 데이터가 조회된다.
간혹 이 상황에서 DBMS 가 Connection에서 무한정 응답하지 않는 경우도 있다
java 는 DBMS 가 응답하기를 기다리면서 무한정 기다리고 마치 프로젝트가 멈춘(Down)
상태 되어 버린다

SQD 에서 INSERT, UPDATE, DELETE 를 수행한 다음에는 
강제로 storage 에 Commit 을 해 주어야 한다.
그래야만 Java 프로젝트에서 데이터를 조회할수 있다
*/
COMMIT;

SELECT * FROM tbl_buyer;

INSERT INTO tbl_buyer(buid, buname)
VALUES ('0005','장길산');

-- COMMIT 이 되기 전의 데이터를 취소하는 명령
ROLLBACK;

-- PK 칼럼을 기준으로 조건을 설정하여 조회하기
-- PK 칼럼을 기준으로 조회를 하면 데이터 없거나, 1개만 조회된다.
SELECT buid, buname, butel, buaddr, bubirth, bujob
FROM tbl_buyer
WHERE buid = '0001';


INSERT INTO tbl_buyer(buid, buname, butel)
VALUES('0001','이','010-1111')


UPDATE tbl_buyer
SET buname = '',
    butel = '',
    buaddr = '',
    bubirth = '',
    bujob = ''
WHERE buid = ''    

















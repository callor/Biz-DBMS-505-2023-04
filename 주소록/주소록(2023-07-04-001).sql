-- addr 사용자 화면

-- 주소록 + 취미정보가 있는 데이터를 정규화 하여 Relation 설정하기

CREATE TABLE tbl_temp_hb (
    hb_aid	VARCHAR2(5),
    hb_name1	nVARCHAR2(30),
    hb_name2	nVARCHAR2(30),
    hb_name3	nVARCHAR2(30)
);    

SELECT * FROM tbl_temp_hb;
SELECT COUNT(*) FROm tbl_temp_hb;

/*
가로로 나열된 데이터를 세로로 배치하기

제1정규화가 된 취미 데이터는 취미1, 취미2, 취미3 칼럼이 만들어진 table 이다
이 테이블에 만약 4번째 취미를 추가하고 싶으면, 
    새로운 칼럼을 추가하거나
    4번째 취미를 다른 취미항목으로 교체 해야 한다.
    
    만약 취미항목이 늘어나 칼럼을 추가하게 되면
    Table 구조를 변경해야 하고, 상당히 많은 비용이 요구된다(시간 등)
    또한 Table 구조를 변경하는 것은 매우 신중하게 처리해야 한다
    다른 어플리케이션과 연동되는 Table 의 구조를 변경하면
    아주 많은 부분에서 변경을 해야하는 경우도 있다
    
    만약 취미항목이 3개 미만인 경우는 데이터가 저장되지 않은 칼럼이 발생하고
    이 칼럼들은 보통 null 값으로 채워진다
    
    Table 의 칼럼에 null 값이 많은 것은 별로 좋은 현상이 아니다

*/
SELECT hb_aid, hb_name1 FROM tbl_temp_hb
UNION ALL
SELECT hb_aid, hb_name2 FROM tbl_temp_hb
WHERE hb_name2 IS NOT NULL
UNION ALL
SELECT hb_aid, hb_name3 FROM tbl_temp_hb
WHERE hb_name3 IS NOT NULL
ORDER BY hb_aid;


CREATE TABLE tbl_hobby (
    hb_seq	NUMBER	PRIMARY KEY,
    hb_aid	VARCHAR2(5)	NOT NULL,	
    hb_name	nVARCHAR2(30)	NOT NULL	
);

SELECT COUNT(*) FROM tbl_hobby;








-- addr User

SELECT * FROM tbl_addr_hobby;

-- addr_hobby Relation Table 과 hobby Entity Table 을 
-- Left Join 하여
-- 주소ID, 취미코드, 취미이름, 취미설명 항목을 Projection 하도록

SELECT ah_seq, ah_aid, ah_hbcode, hb_name, hb_descrip
FROM tbl_addr_hobby
    LEFT JOIN tbl_hobby
        ON ah_hbcode = hb_code;
        
-- 특정한 주소ID 가 지정되었을때 해당 주소ID 의 값만 SELCTION 하기        
SELECT ah_seq, ah_aid, ah_hbcode, hb_name, hb_descrip
FROM tbl_addr_hobby
    LEFT JOIN tbl_hobby
        ON ah_hbcode = hb_code
WHERE ah_aid = 'A0001';        
        
        
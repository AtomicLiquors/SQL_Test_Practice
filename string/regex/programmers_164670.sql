SELECT 
  USER_ID,	NICKNAME,	
  CONCAT(CITY, ' ', STREET_ADDRESS1, ' ', STREET_ADDRESS2) AS 전체주소,	
  REGEXP_REPLACE(TLNO, '([0-9]{3})([0-9]{4})([0-9]{4})', '$1-$2-$3') AS 전화번호
FROM 
USED_GOODS_BOARD AS B
JOIN 
USED_GOODS_USER AS U
ON B.WRITER_ID = U.USER_ID
GROUP BY U.USER_ID
HAVING COUNT(B.WRITER_ID) >= 3
ORDER BY USER_ID DESC

// REGEXP_REPLACE에서 ()로 그룹을 분류하고 $1, $2, $3으로 그룹을 참조한다.
// 웹에서 서칭했을 땐 \\1, \\2, \\3으로 참조하는 것 같던데, 프로그래머스에서는 의도대로 동작하지 않았다.

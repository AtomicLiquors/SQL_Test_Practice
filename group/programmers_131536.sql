-- 코드를 입력하세요

// 오답
SELECT USER_ID,	PRODUCT_ID FROM ONLINE_SALE GROUP BY PRODUCT_ID HAVING COUNT(USER_ID) >= 2 ORDER BY USER_ID, PRODUCT_ID DESC;

/*
In this statement, the data is grouped only by the PRODUCT_ID. 
This statement would return all combinations of USER_ID and PRODUCT_ID where the same PRODUCT_ID has been bought by at least two different users.
*/

// 정답
SELECT USER_ID,	PRODUCT_ID FROM ONLINE_SALE GROUP BY USER_ID, PRODUCT_ID HAVING COUNT(USER_ID) >= 2 ORDER BY USER_ID, PRODUCT_ID DESC;

/*
In this statement, the data is grouped by both USER_ID and PRODUCT_ID. 
This statement would return all combinations of USER_ID and PRODUCT_ID where the "same combination of USER_ID and PRODUCT_ID appears at least twice in the dataset."
*/

/*
In summary, the difference lies in the grouping of data. The first statement groups only by PRODUCT_ID, whereas the second statement groups by both USER_ID and PRODUCT_ID. This difference in grouping affects which rows are considered when applying the HAVING clause and, consequently, impacts the final result set.
*/

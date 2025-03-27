# 공통 테이블 표현식(CTE)
*Common Table Expression*  
일시적으로 생성된 결과 집합을 쿼리에서 재사용할 수 있도록 한다.  

### 여러 개의 CTE를 선언할 경우
여러 개의 CTE를 선언할 경우 첫 번째 WITH 키워드 이후에 쉼표(,)로 구분하여 나열해야 합니다. 
```mysql
--  x
WITH JULY_SUM AS (
    SELECT FLAVOR, SUM(TOTAL_ORDER) 
    FROM JULY
    GROUP BY FLAVOR
)

WITH FIRST_SUM AS (
    SELECT FLAVOR, SUM(TOTAL_ORDER) 
    FROM FIRST_HALF F
    GROUP BY FLAVOR
)

SELECT FLAVOR
FROM JULY_SUM
```

```mysql
--  o
WITH JULY_SUM AS (
    SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_SUM
    FROM JULY
    GROUP BY FLAVOR
), 
FIRST_SUM AS (
    SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_SUM
    FROM FIRST_HALF
    GROUP BY FLAVOR
)

SELECT FLAVOR
FROM JULY_SUM;
```

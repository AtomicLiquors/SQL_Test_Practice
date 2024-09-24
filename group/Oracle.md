### ORA-00979: not a GROUP BY expression
[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/133025?language=oracle)  

[x]
```sql
SELECT F.FLAVOR
FROM FIRST_HALF F
WHERE 
    (SELECT INGREDIENT_TYPE 
     FROM ICECREAM_INFO I 
     WHERE F.FLAVOR = I.FLAVOR) 
    = 'fruit_based'
GROUP BY F.FLAVOR
HAVING SUM(TOTAL_ORDER) > 3000 
ORDER BY TOTAL_ORDER DESC;
```
[o]
```sql
SELECT F.FLAVOR
FROM FIRST_HALF F
WHERE 
    (SELECT INGREDIENT_TYPE 
     FROM ICECREAM_INFO I 
     WHERE F.FLAVOR = I.FLAVOR) 
    = 'fruit_based'
GROUP BY F.FLAVOR
HAVING SUM(TOTAL_ORDER) > 3000 
ORDER BY SUM(TOTAL_ORDER) DESC;
-- 그룹함수가 아닌 열을 정렬 기준으로 삼았다.
```

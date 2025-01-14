- [문자열 일부로 그룹화](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/group/programmers_131529.sql)
- [숫자 범위로 그룹화](https://coding-su.tistory.com/76)

- [그룹 내 최댓값](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/group/maximum_in_group.md)
- [조건에 하나라도 해당하는 그룹](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/group/atleast_one_in_group)

<BR>

### not functionally dependent on columns in GROUP BY clause
문제가 되는 컬럼을 GROUP BY 조건에 추가해서 해결한다.
[BEFORE]
```SQL
SELECT 
    COUNT(ID) AS FISH_COUNT,
    FISH_NAME
FROM
    FISH_INFO I
JOIN
    FISH_NAME_INFO NI
ON
    I.FISH_TYPE = NI.FISH_TYPE
GROUP BY
    I.FISH_TYPE
ORDER BY 
    1 DESC
```

<BR>

[AFTER]
```SQL
SELECT 
    COUNT(ID) AS FISH_COUNT,
    FISH_NAME
FROM
    FISH_INFO I
JOIN
    FISH_NAME_INFO NI
ON
    I.FISH_TYPE = NI.FISH_TYPE
GROUP BY
    I.FISH_TYPE, FISH_NAME
ORDER BY 
    1 DESC
```

### GROUP BY 1로 그룹 조건 재사용
```
SELECT
    TRUNCATE(price, -4) price_group,
    COUNT(product_id) products
FROM
    product
GROUP BY
    1
ORDER BY
    1;
```

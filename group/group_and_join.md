## Q. 다음 두 쿼리 결과가 다른 이유는 뭘까요?

[✅ CORRECT]
```sql
WITH TBL AS (
    SELECT EMP_NO, AVG(SCORE) AS AVG_SCORE
    FROM HR_GRADE
    GROUP BY EMP_NO
    )

SELECT
    e.EMP_NO,
    e.EMP_NAME,
    CASE
        WHEN t.AVG_SCORE >= 96 THEN 'S'
        WHEN t.AVG_SCORE >= 90 THEN 'A'
        WHEN t.AVG_SCORE >= 80 THEN 'B'
        ELSE 'C'
        END AS GRADE,
    CASE
        WHEN t.AVG_SCORE >= 96 THEN e.SAL * 0.2
        WHEN t.AVG_SCORE >= 90 THEN e.SAL * 0.15
        WHEN t.AVG_SCORE >= 80 THEN e.SAL * 0.1
        ELSE 0
    END AS BONUS
FROM
    HR_EMPLOYEES e 
    INNER JOIN  TBL t ON e.EMP_NO = t.EMP_NO
GROUP BY
    t.EMP_NO
```


[❌ WRONG]
```sql
SELECT 
    E.EMP_NO, 
    EMP_NAME, 
    (CASE 
        WHEN AVG(SCORE) >= 96 THEN 'S'
        WHEN AVG(SCORE) >= 90 THEN 'A'
        WHEN AVG(SCORE) >= 80 THEN 'B'
        ELSE 'C'
    END) SCORE,
    ROUND(SAL * 
        (CASE 
            WHEN AVG(SCORE) >= 96 THEN 0.2
            WHEN AVG(SCORE) >= 90 THEN 0.15
            WHEN AVG(SCORE) >= 80 THEN 0.1
            ELSE 0
        END), 0) BONUS
FROM HR_EMPLOYEES E
JOIN HR_DEPARTMENT D
ON E.DEPT_ID = D.DEPT_ID
JOIN HR_GRADE G
ON E.EMP_NO = G.EMP_NO
GROUP BY EMP_NO
ORDER BY E.EMP_NO
```

### 왜 틀렸는가?
AVG(스코어)를 계산하기 전에 모든 테이블에 연결되므로 행 중복이 발생할 수 있습니다.  
올바른 단계에서 그룹이 EMP_NO에만 있는지 확인하지 않고 SELECT 절에서 AVG(스코어)를 적용합니다.  
올바른 쿼리에 없는 HR_DEPARTY를 JOIN에 포함하면 의도하지 않은 행 곱셈이 추가로 발생할 수 있습니다.  

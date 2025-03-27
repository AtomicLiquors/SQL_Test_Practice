# 테스트 전 점검사항
### LEFT JOIN을 사용한 "여집합"
- [programmers_59042](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/join/programmers_59042.sql)

<BR>

### DISTINCT
- **조건을 여러 개 충족해도 하나의 레코드만**
- -**중복되는 값(ID 등)을 하나씩만 표시하기**
  - [programmers_276034](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/distinct/programmers_276034.sql)
  - [programmers_276035](https://github.com/AtomicLiquors/TPA_CHB/blob/main/hyobin/MYSQL/join/programmers_276035.sql)
  - [programmers 131534](https://school.programmers.co.kr/learn/courses/30/lessons/131534)

<BR>

### CASE WHEN 사용법
- [programmers_164672](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/tree/main/hyobin/MYSQL/string)

<BR>

### 문자열
- [일반 문자열 와일드카드](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/string/programmers_157343.sql)

<BR>

### COUNT-IF
- COUNTIF는 존재하지 않으며 count 안에다가 if를 써 준다.
- 이 때 조건을 만족하지 않는 레코드는 0으로 처리하는 게 아니라 null로 처리해야 한다. 그렇지 않으면 갯수 안에 포함된다.
```
COUNT(
  IF(START_DATE <= '2022-10-16'
  AND
  END_DATE >= '2022-10-16', 1, NULL))
```

### 정규 표현식
- [정규 표현식 와일드카드](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/string/regex/programmers_59045.sql)
- [원본 문자열 그룹으로 분류해서 순번 지정하기](https://github.com/AtomicLiquors/TPA_CHB/blob/main/hyobin/MYSQL/string/regex/programmers_164670.sql)

<BR>

### GROUP BY
WHERE는 그룹화되기 전에 데이터를 필터링할 때 사용한다.  
  ```sql
    SELECT department, SUM(salary)
    FROM employees
    WHERE hire_date > '2020-01-01'
    GROUP BY department;
  ```
HAVING은 그룹화된 결과 데이터를 필터링할 때 사용한다.
  ```sql
    SELECT department, SUM(salary)
    FROM employees
    GROUP BY department
    HAVING SUM(salary) > 100000;
  ```
- [문자열 일부로 그룹화](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/group/programmers_131529.sql)
- [숫자 범위로 그룹화](https://coding-su.tistory.com/76)
- [그룹 내에서 최댓값 찾기](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/group/maximum_in_group.md)
  
<BR>

### JOIN
- [JOIN 키워드 쓰지 않고 JOIN하는 경우 - 추가바람]

<BR>

### ORDER BY
- [문자열 정렬이 아닌 숫자 정렬](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/order/Programmers_284531.sql)


<BR>

### LIKE
[링크](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/LIKE.md)

<BR>

### WITH AS
[링크](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/CTE.md)

<BR>

### IN
(value1, value2, value3)과 같은 배열 형태 자료뿐만 아니라,  
서브쿼리 결과 테이블에 대해서도 사용할 수 있다.

예시 : 다음과 같은 SQL문과 결과 테이블에 대해
```sql
`SELECT product_id FROM orders WHERE customer_id = 123`
```

| product_id |
|------------|
| 101        |
| 204        |
| 356        |

<br>

찾고자 하는 product_id가 이 안에 있는지 조회할 수 있다는 것.
```sql
SELECT product_id, product_name
FROM products
WHERE product_id IN (SELECT product_id
                    FROM orders
                    WHERE customer_id = 123);
```

<br>

### 임의의 데이터세트 생성

```sql
SELECT 1 AS HOUR
UNION
SELECT 2 AS HOUR
UNION
SELECT 3 AS HOUR
UNION
SELECT 4 AS HOUR
UNION
SELECT 5 AS HOUR;
```

### RECURSIVE 사용법
```sql
with recursive time
as (
    select 0 as hour
    union all
    select hour + 1
    from time
    where hour < 23
)
```

<BR>

### 소수점 버림
```
FLOOR()
```


<BR>

### Tip
- `>= AND =<`는 `BETWEEN AND`로도 표현 가능.
- 중첩 IF문은 CASE WHEN으로 표현하는 편이 낫다.
    ```SQL
      IF(
        OUT_DATE IS NULL, 
       '출고미정', 
       IF(OUT_DATE <= '2022-05-01', '출고완료', '출고대기')
      ) AS 출고여부
    ```
    ```SQL
      CASE
        WHEN OUT_DATE IS NULL THEN '출고미정' 
        WHEN DATE_FORMAT(OUT_DATE,'%Y-%m-%d') <= '2022-05-01' THEN '출고완료'
        ELSE '출고대기'
      END 출고여부 
    ```
- ORDER BY : 컬럼 번호로 정렬 기준 지정하기
    ```SQL
      ORDER BY 2 DESC, 1 DESC
    ```


<br>

## Oracle
### MYSQL과 대표적 차이점
[문자열 연산](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/string/ORACLE_COMPARISON.MD)  
[날짜 표현](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/date/Oracle_Comparison.md)  
[정규 표현식](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/regex/Oracle_Comparison.MD)  
[조건문](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/conditional/Oracle_Comparison.md)


<br>

### TroubleShooting
[그룹 함수](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/group/Oracle.md)


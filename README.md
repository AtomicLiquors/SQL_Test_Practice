# 테스트 전 점검사항

| 목차 |
|------|
| [1. JOIN](#1-join) |
| [2. DISTINCT](#2-distinct) |
| [3. CASE WHEN](#3-case-when) |
| [4. 문자열 처리](#4-문자열-처리) |
| [5. COUNT-IF](#5-count-if) |
| [6. GROUP BY / HAVING](#6-group-by--having) |
| [7. ORDER BY](#7-order-by) |
| [8. LIKE](#8-like) |
| [9. WITH AS](#9-with-as) |
| [10. IN](#10-in) |
| [11. 임의의 데이터셋 생성](#11-임의의-데이터셋-생성) |
| [12. RECURSIVE 사용법](#12-recursive-사용법) |
| [13. 소수점 버림](#13-소수점-버림) |
| [14. SQL 팁 모음](#14-sql-팁-모음) |
| [15. Oracle 관련 내용](#15-oracle-관련-내용) |
| [16. TroubleShooting](#16-troubleshooting) |


## 1. JOIN

📌 **LEFT JOIN을 활용한 여집합**

* [programmers\_59042.sql](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/join/programmers_59042.sql)

📌 **JOIN 키워드를 사용하지 않은 JOIN**

* 예제가 필요한 경우, 별도 추가 필요함

---

## 2. DISTINCT

DISTINCT는 다음과 같은 상황에서 사용한다.

* 여러 조건을 만족하더라도 하나의 레코드만 반환되게 할 때
* 중복되는 값(ID 등)을 하나씩만 보여줘야 할 때

📌 [programmers\_276034.sql](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/distinct/programmers_276034.sql)
📌 [programmers\_276035.sql](https://github.com/AtomicLiquors/TPA_CHB/blob/main/hyobin/MYSQL/join/programmers_276035.sql)
📌 [programmers\_131534](https://school.programmers.co.kr/learn/courses/30/lessons/131534)

---

## 3. CASE WHEN

조건에 따라 값을 다르게 반환하고 싶을 때 사용한다.

📌 [CASE WHEN 예제](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/tree/main/hyobin/MYSQL/string)

---

## 4. 문자열 처리

📌 **일반 문자열 와일드카드**

* [programmers\_157343.sql](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/string/programmers_157343.sql)

📌 **정규 표현식**

* [정규표현식 와일드카드](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/string/regex/programmers_59045.sql)
* [문자열 그룹화 및 순번 지정](https://github.com/AtomicLiquors/TPA_CHB/blob/main/hyobin/MYSQL/string/regex/programmers_164670.sql)

---

## 5. COUNT-IF

MySQL에는 `COUNTIF` 함수가 존재하지 않는다. 대신 `COUNT(IF(...))` 구문을 사용한다.
이때 조건을 만족하지 않는 경우는 `NULL`로 처리해야 카운트되지 않는다.

```sql
COUNT(
  IF(START_DATE <= '2022-10-16'
  AND END_DATE >= '2022-10-16', 1, NULL)
)
```

---

## 6. GROUP BY / HAVING

📌 **WHERE은 그룹화 이전 필터링에 사용한다.**

```sql
SELECT department, SUM(salary)
FROM employees
WHERE hire_date > '2020-01-01'
GROUP BY department;
```

📌 **HAVING은 그룹화된 결과 필터링에 사용한다.**

```sql
SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;
```

📌 [문자열 일부로 그룹화](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/group/programmers_131529.sql)
📌 [숫자 범위로 그룹화](https://coding-su.tistory.com/76)
📌 [그룹 내 최댓값 찾기](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/group/maximum_in_group.md)

---

알겠습니다. 이어서 남은 항목들도 같은 형식(📌 핀 이모지 + 설명체 반말체)으로 정리합니다.

---

## 7. ORDER BY

📌 **문자열이 아닌 숫자 기준으로 정렬하려면 자료형에 주의해야 한다.**

* [숫자 정렬 예제](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/order/Programmers_284531.sql)

📌 **컬럼 번호로 정렬할 수도 있다.**

```sql
ORDER BY 2 DESC, 1 DESC
```

---

## 8. LIKE

📌 **LIKE는 문자열 비교에 사용하며, `%`, `_` 같은 와일드카드를 활용할 수 있다.**

* [LIKE 사용 예제](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/LIKE.md)

---

## 9. WITH AS

📌 **공통 테이블 표현식(CTE)을 정의할 때 사용한다.**

* [WITH AS 사용 예제](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/CTE.md)

---

## 10. IN

📌 `IN`은 `(value1, value2, ...)` 형태뿐 아니라, 서브쿼리 결과 테이블에도 사용할 수 있다.

예시: 고객 번호 123번이 주문한 상품들 중에서만 조회하고 싶을 때,

```sql
SELECT product_id, product_name
FROM products
WHERE product_id IN (
  SELECT product_id
  FROM orders
  WHERE customer_id = 123
);
```

서브쿼리 결과:

| product\_id |
| ----------- |
| 101         |
| 204         |
| 356         |

위 목록 안에 있는 값만 메인 쿼리에서 필터링하게 된다.

---

## 11. 임의의 데이터셋 생성

📌 **테스트용 시간 데이터를 생성할 때는 UNION을 사용한다.**

```sql
SELECT 1 AS hour
UNION
SELECT 2
UNION
SELECT 3
UNION
SELECT 4
UNION
SELECT 5;
```

---

## 12. RECURSIVE 사용법

📌 **재귀적으로 시간이나 날짜 데이터를 생성할 수 있다.**

```sql
WITH RECURSIVE time AS (
  SELECT 0 AS hour
  UNION ALL
  SELECT hour + 1
  FROM time
  WHERE hour < 23
)
```

---

## 13. 소수점 버림

📌 **소수점을 버릴 때는 `FLOOR()` 함수를 사용한다.**

```sql
SELECT FLOOR(3.9);  -- 결과: 3
```

---

## 14. SQL 팁 모음

📌 `>=` 와 `<=`는 `BETWEEN AND`로도 표현할 수 있다.

📌 중첩 `IF`는 `CASE WHEN`으로 바꾸는 것이 가독성이 좋다.

* `IF` 방식:

```sql
IF(OUT_DATE IS NULL, 
   '출고미정', 
   IF(OUT_DATE <= '2022-05-01', '출고완료', '출고대기')) AS 출고여부
```

* `CASE WHEN` 방식:

```sql
CASE
  WHEN OUT_DATE IS NULL THEN '출고미정'
  WHEN DATE_FORMAT(OUT_DATE, '%Y-%m-%d') <= '2022-05-01' THEN '출고완료'
  ELSE '출고대기'
END AS 출고여부
```

---

## 15. Oracle 관련 내용

### 📌 MYSQL과의 주요 차이점

* [문자열 연산 비교](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/string/ORACLE_COMPARISON.MD)
* [날짜 표현 비교](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/date/Oracle_Comparison.md)
* [정규 표현식 비교](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/regex/Oracle_Comparison.MD)
* [조건문 비교](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/conditional/Oracle_Comparison.md)

---

## 16. TroubleShooting
* [그룹 함수 문제 해결](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/group/Oracle.md)

---

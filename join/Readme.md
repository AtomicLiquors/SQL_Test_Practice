### JOIN
```
(각 조인 방법마다 벤다이어그램 넣어주세요.)
```

#### 내부 조인 

양쪽 테이블에서 두 행이 모두 일치하는 경우만 표기

```sql
SELECT * FROM TableA A
INNER JOIN TableB B ON 
A.key = B.key
```

#### 왼쪽 조인 

왼쪽 테이블의 모든 행

```sql
SELECT * FROM TableA A
LEFT JOIN TableB B ON 
A.key = B.key
```

#### 오른쪽 조인 

오른쪽 테이블의 모든 행 

```sql
SELECT * FROM TableA A
RIGHT JOIN TableB B ON 
A.key = B.key
```

### 합집합 조인

두 개의 테이블 모든 행

```sql
SELECT * FROM TableA A
**FULL OUTER** JOIN TableB B ON 
A.key = B.key
```

### JOIN 키워드 없이 JOIN

```sql
SELECT 성명, 나이, 직책 FROM 사원, 연락처
WHERE 사원.사번 = 연락처.사번 AND 연락처.성별 = "여"
```

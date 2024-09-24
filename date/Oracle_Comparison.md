
### 날짜 포맷팅
#### MySQL
```
DATE_FORMAT(HIRE_YMD, '%Y-%m-%d')
```

#### ORACLE
```sql
TO_CHAR(HIRE_YMD, 'YYYY-MM-DD')
```


### 연월일 추출
#### MySQL
```
YEAR(PUBLISHED_DATE)
```

#### ORACLE
```sql
EXTRACT(YEAR FROM PUBLISHED_DATE) = 2021
```


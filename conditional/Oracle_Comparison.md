### IF는 Oracle에 없다
IF 불허, CASE-WHEN만 사용 가능
#### [MYSQL]
```sql
IF(condition, true_value, false_value)
```

#### [ORACLE]
```sql
CASE 
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
END
```

### NULL일 때 표시할 내용
#### [MYSQL]
```sql
IFNULL(expression, replacement_value)
```

#### [ORACLE]
```sql
NVL(expression, replacement_value)
// Null Value Logic
```

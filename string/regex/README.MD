
## MySQL REGEXP Examples
### Simple match:
```sql
SELECT 'abc' REGEXP 'a';  -- Returns 1 (true)
```

### Matching multiple characters:
```sql
SELECT 'abc' REGEXP '[a-c]';  -- Returns 1 (true)
```

### Matching a pattern in a column:
```sql
SELECT * FROM users WHERE name REGEXP '^J.*';  -- Names starting with 'J'
```

### Pattern matching using LIKE and REGEXP comparison:
```sql
SELECT * FROM products WHERE product_code REGEXP '[0-9]';  -- Rows with a digit in product_code
```

### Match case-insensitive patterns:
```sql
SELECT * FROM employees WHERE last_name REGEXP '(?i)john';  -- Match 'john', 'John', etc.
```

<br>

## Oracle REGEXP Examples
### Simple match:
```sql
SELECT REGEXP_INSTR('abc', 'a') FROM dual;  -- Returns 1 (position of 'a')
```

### Extracting a pattern:
```sql
SELECT REGEXP_SUBSTR('john.doe@example.com', '[A-Za-z]+') FROM dual;  -- Returns 'john'
```

### Replacing parts of a string:

```sql
SELECT REGEXP_REPLACE('john_doe@example.com', '[_]', '-') FROM dual;  -- Replace underscore with a hyphen
Find multiple patterns:
```

```sql
SELECT name
FROM users
WHERE REGEXP_LIKE(name, '(John|Paul|George)');  -- Match any of the names
```

### Remove non-alphabetic characters:
```sql
SELECT REGEXP_REPLACE('A1B2C3', '[^A-Za-z]', '') FROM dual;  -- Returns 'ABC'
```

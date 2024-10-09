# 테스트 전 점검사항
### 여집합
- [programmers_59042](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/join/programmers_59042.sql)

### DISTINCT : 조건을 여러 개 충족해도 하나의 레코드만
- [programmers_276034](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/distinct/programmers_276034.sql)
- [programmers_276035](https://github.com/AtomicLiquors/TPA_CHB/blob/main/hyobin/MYSQL/join/programmers_276035.sql)

### CASE WHEN 사용법
- [programmers_164672](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/tree/main/hyobin/MYSQL/string)

### 문자열
- [일반 문자열 와일드카드](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/string/programmers_157343.sql)

### 정규 표현식
- [정규 표현식 와일드카드](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/string/regex/programmers_59045.sql)
- [원본 문자열 그룹으로 분류해서 순번 지정하기](https://github.com/AtomicLiquors/TPA_CHB/blob/main/hyobin/MYSQL/string/regex/programmers_164670.sql)

### GROUP BY
- [문자열 일부로 그룹화](https://github.com/TPA-ThreeProblemsAday/TPA_CHB/blob/main/hyobin/MYSQL/group/programmers_131529.sql)
- [숫자 범위로 그룹화](https://coding-su.tistory.com/76)
- [그룹 내에서 최댓값 찾기](https://chatgpt.com/c/67062448-07b0-800c-9529-c4f2ca3e7ffb)
  
### JOIN
- [JOIN 키워드 쓰지 않고 JOIN하는 경우 - 추가바람]

### ORDER BY
- [문자열 정렬이 아닌 숫자 정렬](https://github.com/AtomicLiquors/SQL_Test_Practice/blob/main/order/Programmers_284531.sql)

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

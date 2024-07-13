-- 코드를 작성해주세요
SELECT 
    DISTINCT(ID),
    EMAIL,
    FIRST_NAME,
    LAST_NAME
FROM 
    DEVELOPERS
JOIN
    (SELECT CODE FROM SKILLCODES WHERE NAME REGEXP 'Python|C#') S
WHERE
    SKILL_CODE & S.CODE
ORDER BY 
    ID
// DISTINCT 키워드를 적용하지 않아 "테스트 케이스는 맞췄지만 제출하면 실패했다."
// Python도, C# 스킬도 갖고 있을 때 레코드가 여러 개 조회되었기 때문이다.

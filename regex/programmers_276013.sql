/*
문자열을 결합하고 REGEX를 쓰려는 생각을 했다가 '단어가 결합되면서 예상치 못한 결과가 나오면?'이라는 생각이 들었다. 
예를 들어서 스킬 목록에 'numpy, thone' 같은 단어가 있다면 결과는 'numpythone'이 되어 버리고
엉뚱하게 'python이 존재한다'고 판별을 하게 된다.
해결방법으로 CONCAT_WS를 이용해 문자열을 결합하며 임의의 구분자를 삽입하는 방법이 있었다.
*/

// BEFORE
SELECT
    ID,	
    EMAIL,
    FIRST_NAME,
    LAST_NAME
FROM
    DEVELOPER_INFOS
WHERE
    SKILL_1 = 'Python' OR
    SKILL_2 = 'Python' OR
    SKILL_3 = 'Python' 
ORDER BY 
    ID


// AFTER
SELECT
    ID
    , EMAIL
    , FIRST_NAME
    , LAST_NAME
FROM
    DEVELOPER_INFOS
WHERE
    CONCAT_WS(', ', SKILL_1, SKILL_2, SKILL_3) REGEXP 'Python'
ORDER BY
    ID

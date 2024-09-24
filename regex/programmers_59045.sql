
-- 코드를 입력하세요
SELECT
    ANIMAL_ID, I.ANIMAL_TYPE, I.NAME
FROM
    ANIMAL_INS I
JOIN
    ANIMAL_OUTS O
USING
    (ANIMAL_ID)
WHERE
    CONCAT(SEX_UPON_INTAKE,SEX_UPON_OUTCOME) REGEXP 'Intact.*?(Spayed|Neutered).*?'
ORDER BY
    ANIMAL_ID

/*
.*? matches any character (except for line terminators) zero or more times, as few times as possible.
*/

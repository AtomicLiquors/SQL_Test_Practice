// LOCATE 함수는 여타 프로그래밍 언어의 FIND처럼 특정 문자열을 찾는 역할
// LOCATE의 매개변수는 부분 문자열 - 문자열 순서다. 평소처럼 문자열 - 부분 문자열 순서인 게 아니다.
// MYSQL 인덱스는 0이 아닌 1부터 시작한다.
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS FROM FOOD_FACTORY WHERE LEFT(ADDRESS, LOCATE(" ", ADDRESS)) = '강원도' ORDER BY FACTORY_ID;

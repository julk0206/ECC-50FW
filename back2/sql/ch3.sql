-- 예제 3-1 - age열의 값을 오름차순으로 정렬하기 
SELECT * FROM sample31 ORDER BY age;

-- 예제 3-2 - address열로 정렬하기
 SELECT * FROM sample31 ORDER BY address;

-- 예제 3-3 - DESC와 ASC
SELECT * FROM sample31 ORDER BY age DESC;
SELECT * FROM sample31 ORDER BY age ASC;

-- 예제 3-4
SELECT * FROM sample311;

-- 예제 3-5 - sample311을 정렬하기 
SELECT * FROM sample311 ORDER BY a;
SELECT * FROM sample311 ORDER BY b;

-- 예제3-6 - sample32테이블 내용 참조하기 
SELECT * FROM sample32;

-- 예제 3-7 - sample32를 a열만으로 정렬하기
SELECT * FROM sample32 ORDER BY a;

-- 예제 3-8 - sample32를 a열과 b열로 정렬하기
SELECT * FROM sample32 ORDER BY a,b;

-- 예제 3-9 - sample32를 b열과 a열로 정렬하기
SELECT * FROM sample32 ORDER BY b,a;

-- 예제 3-10 - a열을 ASC, b열을 DESC로 정렬하기
SELECT * FROM sample32 ORDER BY a ASC, b DESC;

--예제 3-11 - sample33 테이블 
SELECT * FROM sample33;

-- 예제 3-12 - LIMIT으로 행수 제한하기 
SELECT * FROM sample33 LIMIT 3;

-- 예제 3-13 - 정렬 후 LIMIT로 행수 제한하기 
SELECT * FROM sample33 ORDER BY no DESC LIMIT 3;

-- 예제 3-14 - LIMIT로 첫 번째 페이지에서 표시할 데이터 취득하기 
SELECT * FROM sample33 LIMIT 3 OFFSET 0;

-- 예제 3-15 - LIMIT로 두 번째 페이지에 표시할 데이터 취득하기 
SELECT * FROM sample33 LIMIT 3 OFFSET 3;

-- 예제 3-16 - sample32테이블
SELECT * FROM sample34;

-- 예제 3-17 - SELECT구로 금액 계산하기 
SELECT *, price*quantity FROM sample34;

-- 예제 3-18 - SELECT구에서 식에 별명 붙이기 
SELECT *, price*quantity AS amount FROM sample34;

-- 예제 3-19 - WHERE 구에서 계산, 검색하기 
SELECT *, price*quantity AS amount FROM sample34
    -> WHERE price*quantity >= 2000;

-- 예제 3-20 - 금액을 내림차순으로 정렬하기 
SELECT *, price*quantity AS amount FROM sample34
    -> ORDER BY price*quantity DESC;

-- 예제 3-21 - 금액의 별명을 사용해 내림차순으로 정렬하기 
SELECT *, price*quantity AS amount FROM sample34
    -> ORDER BY amount DESC;

-- 예제 3-22 - ROUND로 반올림하기 
SELECT amount, ROUND(amount) FROM sample341;

-- 예제 3-23 - 소수점 둘째자리에서 반올림하기 
SELECT amount, ROUND(amount, 1) FROM sample341;

-- 예제 3-24 - 10단위를 반올림하기 
SELECT amount, ROUND(amount, -2) FROM sample341;

-- 예제 3-25 - 문자열 결합 
SELECT CONCAT(quantity, unit) FROM sample35;

-- 예제 3-26 - 시스템 날짜 확인하기 
SELECT CURRENT_TIMESTAMP;

-- 예제 3-27 - 시스템 날짜의 1일 후를 계산하기 
SELECT CURRENT_DATE + INTERVAL 1 DAY;

-- 예제 3-28 - NULL 값을 0으로 변환하기 
SELECT a, CASE WHEN a IS NULL THEN 0 ELSE a END "a(null=0)"
    -> FROM sample37;

-- 예제 3-29 - 성별 코드 변환하기(검색 CASE)
SELECT a AS "코드",
    -> CASE
    ->  WHEN a=1 THEN '남자'
    ->  WHEN a=2 THEN '여자'
    ->  ELSE '미지정'
    -> END AS "성별" FROM sample37;

-- 예제 3-30 - 성별 코드 변환하기(단순 CASE)
SELECT a AS "코드",
    -> CASE a
    ->  WHEN 1 THEN '남자'
    ->  WHEN 2 THEN '여자'
    ->  ELSE '미지정'
    -> END AS "성별" FROM sample37;

-- 예제 3-30 - 검색 CASE문으로 NULL 판정하기 
SELECT a AS "코드",
    -> CASE
    ->  WHEN a=1 THEN '남자'
    ->  WHEN a=2 THEN '여자'
    ->  WHEN a IS NULL THEN '데이터없음'
    ->  ELSE '미지정'
    -> END AS "성별" FROM sample37;
-- 예제 5-1 - sample51의 행 개수 구하기 
SELECT * FROM sample51;
SELECT COUNT(*) FROM sample51;

-- 예제 5-2 - sample51의 행 개수를 WHERE구를 지정하여 구하기 
SELECT * FROM sample51 WHERE name='A';
SELECT COUNT(*) FROM sample51 WHERE name='A';

-- 예제 5-3 - 행 개수를  구할 떄 NULL 값 다루기 
SELECT * FROM sample51;
SELECT COUNT(no), COUNT(name) FROM sample51;

-- 예제 5-4 - sample51테이블 
SELECT * FROM sample51;

-- 예제 5-5 - DISTINCT로 중복 제거하기 
SELECT DISTINCT name FROM sample51;

-- 예제 5-6 - 중복을 제거한 뒤 개수 구하기 
SELECT COUNT(ALL name), COUNT(DISTINCT name) FROM sample51;

-- 예제 5-7 - SUM으로 합계 구하기 
SELECT * FROM sample51;
SELECT SUM(quantity) FROM sample51;

-- 예제 5-8 - AVG로 평균값 구하기 
SELECT * FROM sample51;
SELECT AVG(quantity), SUM(quantity)/COUNT(quantity) FROM sample51;

-- 예제 5-9 - AVG로 평균값 계산 (NULL을 0으로 변환)
SELECT AVG(CASE WHEN quantity IS NULL THEN 0 ELSE quantity END) AS avgnull0 FROM sample51;

-- 예제 5-10 - MIN, MAX로 최솟값, 최댓값 구하기 
SELECT * FROM sample51;
SELECT MIN(quantity), MAX(quantity), MIN(name), MAX(name) FROM sample51;

-- 예제 5-11 - sample51테이블 
SELECT * FROM sample51;

-- 예제 5-12 - name열로 그룹화하기 
SELECT name FROM sample51 GROUP BY name;

-- 예제 5-13 - name 열을 그룹화해서 계산하기 
SELECT name, COUNT(name), SUM(quantity) FROM sample51 GROUP BY name;

-- 예제 5-14 - HAVING을 사용해 검색 
SELECT name, COUNT(name) FROM sample51 GROUP BY name;
SELECT name, COUNT(name) FROM sample51
    GROUP BY name HAVING COUNT(name)=1;

-- 예제 5-15 - 집계한 결과 정렬하기 
SELECT name, COUNT(name), SUM(quantity) 
    FROM sample51 GROUP BY name ORDER BY SUM(quantity) DESC;

-- 예제 5-16 - sample54 테이블
SELECT * FROM sample54;

-- 예제 5-17 - sample54에서 a의 최솟값 검색하기 
SELECT MIN(a) FROM sample54;

-- 예제 5-18 -최솟값을 가지는 행 삭제하기 
 DELETE FROM sample54 WHERE a = (SELECT MIN(a) FROM sample54);

-- 예제 5-19 - 서브쿼리의 패턴
-- 패턴 1) 하나의 값을 반환하는 패턴 
SELECT MIN(a) FROM sample54;
-- 패턴 2) 복수의 행이 반환되지만 열은 하나인 패턴 
SELECT no FROM sample54;
-- 패턴 3) 하나의 행이 반환되지만 열이 복수인 패턴 
SELECT MIN(a), MAX(no) FROM sample54;
-- 패턴 4) 복수의 행, 복수의 열이 반환되는 패턴 
SELECT no, a FROM sample54;

-- 예제 5-20 - SELECT 구에서 서브쿼리 사용하기 
SELECT
    (SELECT COUNT(*) FROM sample51) AS sq1,
    (SELECT COUNT(*) FROM sample54) AS sq2;

-- 예제 5-21 - SELECT 구에서 서브쿼리 사용하기 (Oracle경우)
SELECT 
	(SELECT COUNT(*) FROM sample51) AS sq1,
	(SELECT COUNT(*) FROM sample54) AS sq2 FROM DUAL;

-- 예제 5-22 - SET 구에서 서브쿼리 사용하기
UPDATE sample54 SET a=(SELECT MAX(a) FROM sample54);

-- 예제 5-23 - FROM 구에서 서브쿼리 사용하기 
SELECT * FROM (SELECT * FROM sample54) sq;

-- 예제 5-24 - FROM 구에서 서브쿼리 사용하기(AS로 지정)
SELECT * FROM (SELECT * FROM sample54) AS sq;

-- 예제 5-25 - FROM 구에서 서브쿼리 사용하기 (3단계)
SELECT * FROM (SELECT * FROM (SELECT * FROM sample54) sq1) sq2;

-- 예제 5-26 - Oracle에서 LIMIT 구의 대체 명령 
SELECT * FROM (
	SELECT * FROM sample54 ORDER BY a DESC
) sq
WHERE ROWNUM <= 2;

-- 예제 5-27 - VALUES 구에서 서브쿼리 사용하기 
INSERT INTO sample54 VALUES(
	(SELECT COUNT(*) FROM sample51),
	(SELECT COUNT(*) FROM sample54)
);
SELECT * FROM sample54;

-- 예제 5-28 - SELECT 결과를 INSERT 하기
INSERT INTO sample54 SELECT 1,2;
SELECT * FROM sample54;

-- 예제 5-29 - 테이블의 행 복사하기 
INSERT INTO sample542 SELECT * FROM sample543;

-- 예제 5-30 - sample551 테이블과 sample552테이블 
SELECT * FROM sample551; SELECT * FROM sample552;

-- 예제 5-31 - EXISTS를 사용해 '있음'으로 갱신하기 
UPDATE sample551 SET a ='있음' WHERE
    EXISTS (SELECT * FROM sample552 WHERE no2=no);
SELECT * FROM sample551;

-- 예제 5-32 - NOT EXISTS를 사용해 '없음'으로 갱신하기 
UPDATE sample551 SET a='없음' WHERE
    NOT EXISTS (SELECT * FROM sample552 WHERE no2=no);
SELECT * FROM sample551;

-- 예제 5-33 - 열에 테이블명 붙이기 
UPDATE sample551 SET a='있음' WHERE
    EXISTS (SELECT * FROM sample552 WHERE sample552.no2=sample551.no);

-- 예제 5-34 - IN을 사용해 조건식 기술 
SELECT * FROM sample551 WHERE no IN(3, 5);

-- 예제 5-35 - IN의 오른쪽을 서브쿼리로 지정하기 
SELECT * FROM sample551 WHERE no IN
    (SELECT no2 FROM sample552);
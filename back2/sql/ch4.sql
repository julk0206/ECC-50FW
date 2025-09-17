-- 예제 4-1 - sample 테이블 
SELECT * FROM sample41;

-- 예제 4-2 - sample41 테이블의 열 구성 확인하기 
DESC sample41;

-- 예제 4-3 - sample41 테이블에 행 추가하기 
INSERT INTO sample41 VALUES(1, 'ABC', '2014-01-25');

-- 예제 4-4 - sample41 테이블 
SELECT * FROM sample41;

-- 예제 4-5 - 열을 지정해 행 추가하기 
INSERT INTO sample41(a, no) VALUES('XYZ', 2);
SELECT * FROM sample41;

-- 예제 4-6 - NOT NULL 제약 회피하기
INSERT INTO sample41(no, a, b) VALUES(3, NULL, NULL);
SELECT * FROM sample41;

-- 예제 4-7 - sample411의 열 구성 확인하기 
DESC sample411;

-- 예제 4-8 - sample411에 행 추가하기 
INSERT INTO sample411(no,d) VALUES(1,1);
SELECT * FROM sample411;

-- 예제 4-9 - 명시적으로 디폴트 지정
INSERT INTO sample411(no,d) VALUES(2, DEFAULT);
SELECT * FROM sample411;

-- 예제 4-10 - 암묵적으로 디폴트 지정 
INSERT INTO sample411(no) VALUES(3);
SELECT * FROM sample411;

-- 예제 4-11 - sample41 테이블 
SELECT * FROM sample41;

-- 예제 4-12 - sample41에서 행 삭제하기 
DELETE FROM sample41 WHERE no=3;
SELECT * FROM sample41;

-- 예제 4-13 - sample41 테이블 
SELECT * FROM sample41;

-- 예제 4-14 - sample41의 셀 값을 갱신하기 
UPDATE sample41 SET b='2014-09-07' WHERE no=2;
SELECT * FROM sample41;

-- 예제 4-15 - UPDATE명령으로 증가 연산하기 
UPDATE sample41 SET no=no+1;
SELECT * FROM sample41;

-- 예제 4-16 - sample41 테이블 
SELECT * FROM sample41;

-- 예제 4-17 - MYSQL에서 UPDATE 명령1 실행 
UPDATE sample41 SET no=no+1, a=no;
SELECT * FROM sample41;

-- 예제 4-18 - MySQL에서 UPDATE 명령2 실행 
UPDATE sample41 SET a=no, no=no+1;
SELECT * FROM sample41;

-- 예제 4-20 - NULL 초기화 
UPDATE sample41 SET a=NULL;
SELECT * FROM sample41;
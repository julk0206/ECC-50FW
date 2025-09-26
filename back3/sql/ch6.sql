-- 예제 6-1 - CREATE TABLE로 테이블 작성하기 
CREATE TABLE sample62(
    no INTEGER NOT NULL,
    a VARCHAR(30),
    b DATE);
DESC sample62;

-- 예제 6-2 - ALTER TABLE로 테이블에 열 추가하기 
ALTER TABLE sample62 ADD newcol INTEGER;

-- 예제 6-3 - ALTER TABLE로 열 속성 변경하기 
ALTER TABLE sample62 MODIFY newcol VARCHAR(20);
DESC sample62;

-- 예제 6-4 - ALTER TABLE로 열 이름 변경하기 
ALTER TABLE sample62 CHANGE newcol c VARCHAR(20);
DESC sample62;

-- 예제 6-5 - ALTER TABLE로 열 삭제하기 
ALTER TABLE sample62 DROP c;
DESC sample62;

-- 예제 6-6 - 테이블 열에 제약 정의하기 
CREATE TABLE sample631 (
    a INTEGER NOT NULL,
    b INTEGER NOT NULL UNIQUE,
    c VARCHAR(30));

-- 예제 6-7 - 테이블에 '테이블 제약' 정의하기 
CREATE TABLE sample632(
    no INTEGER NOT NULL,
    sub_no INTEGER NOT NULL,
    name VARCHAR(30),
    PRIMARY KEY(no, sub_no));

-- 예제 6-8 - '테이블 제약'에 이름 붙이기 
CREATE TABLE sample632 (
    no INTEGER NOT NULL,
    sub_no INTEGER NOT NULL, 
    name VARCHAR(30),
    CONSTRAINT pkey_sample PRIMARY KEY (no, sub_no)
);

-- 예제 6-9 - 열 제약 추가하기 
ALTER TABLE sample631 MODIFY c VARCHAR(30) NOT NULL;

-- 예제 6-10 - 테이블 제약 추가하기 
ALTER TABLE sample631 ADD CONSTRAINT pkey_sample PRIMARY KEY(a);

-- 예제 6-11 - 열 제약 삭제하기 
ALTER TABLE sample631 MODIFY c VARCHAR(30);

-- 예제 6-12 - 테이블 제약 삭제하기 
ALTER TABLE sample631 DROP CONSTRAINT pkey_sample631;

-- 예제 6-13 - 테이블 제약 삭제하기 
ALTER TABLE sample631 DROP PRIMARY KEY;

-- 예제 6-14 - sample643 테이블 작성하기 
CREATE TABLE sample643(
    p INTEGER NOT NULL,
    a VARCHAR(30),
    CONSTRAINT pkey_sample643 PRIMARY KEY(p));

-- 예제 6-15 - sample643에 행 추가하기 
INSERT INTO sample643 VALUES(1,'첫째줄');
INSERT INTO sample643 VALUES(2, '둘째줄');
INSERT INTO sample643 VALUES(3,'셋째째줄');

--예제 6-16 - sample643에 중복되는 행 추가하기 
INSERT INTO sample643 VALUES(2,'넷째줄');
ERROR 1062 (23000): Duplicate entry '2' for key 'sample643.PRIMARY'
  
-- 예제 6-17 - sample643을 중복된 값으로 갱신하기 
 UPDATE sample643 SET p=2 WHERE p=3;
ERROR 1062 (23000): Duplicate entry '2' for key 'sample643.PRIMARY'

-- 예제 6-18 - a열과 b열로 이루어진 기본키 
SELECT a, b FROM sample635;

-- 예제 6-19 - 인덱스 작성하기 
CREATE INDEX isample65 ON sample62(no);

-- 예제 6-20 - 인덱스 삭제하기 
DROP INDEX isample65 ON sample62;

-- 예제 6-21 - EXPLAIN으로 인덱스 사용 확인하기1 (MySQL)
EXPLAIN SELECT * FROM sample62 WHERE a='a';

-- 예제 6-22 - EXPLAIN으로 인덱스 사용 확인하기2 (MySQL)
EXPLAIN SELECT * FROM sample62 WHERE no>10;

-- 예제 6-23 - 뷰 작성하기 
CREATE VIEW sample_view67 AS SELECT * FROM sample54;
SELECT * FROM sample_view67;

-- 예제 6-24 - 열을 지정해 뷰 작성하기 
CREATE VIEW sample_view672(n, v, v2) AS
    SELECT no, a, a*2 FROM sample54;
SELECT * FROM sample_view672 WHERE n=1;
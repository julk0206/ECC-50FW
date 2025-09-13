-- 데이터베이스 선택
USE sample;

-- 예시용 테이블 생성
CREATE TABLE IF NOT EXISTS sample21 (
    no INT PRIMARY KEY,
    name VARCHAR(50),
    birthday DATE,
    address VARCHAR(100)
);

-- 데이터 삽입
INSERT INTO sample21 (no, name, birthday, address) VALUES
(1, '박준용', '1976-10-18', '대구광역시 수성구'),
(2, '김재진', NULL, '대구광역시 동구'),
(3, '홍길동', NULL, '서울특별시 마포구');

-- SELECT 명령
-- SELECT * FROM 테이블명;
SELECT * FROM sample21;
Select * From Sample21;
SELECT * FROM SAMPLE21; # 대소문자 구별X 모두 동일

-- DESC 명령
-- DESC 테이블명;
DESC sample21;

-- 검색 조건 지정
-- 1) SELECT구에서 열 지정
-- SELECT 열1, 열2... FROM 테이블명;
SELECT no, name FROM sample21;

-- WHERE구에서 행 지정
-- SELECT 열1, 열2 FROM 테이블명 WHERE 조건식
SELECT * FROM sample21 WHERE no = 2;
SELECT * FROM sample21 WHERE no <> 2;

-- NULL값 검색
SELECT * FROM sample21 WHERE birthday IS NULL;
SELECT * FROM sample21 WHERE birthday IS NOT NULL;

-- AND
SELECT * FROM sample24 WHERE a <> 0 AND b <> 0;

-- OR
SELECT * FROM sample24 WHERE a <> 0 OR b <> 0;

-- AND OR 주의
-- SELECT * FROM sample24 WHERE no = 1 OR 2; - 틀림
SELECT * FROM sample24 WHERE no = 1 OR no = 2;

-- NOT
SELECT * FROM sample24 WHERE NOT(a <> 0 OR b <> 0);

-- 패턴 매칭
-- 1) LIKE
-- 열명 LIKE '패턴'
SELECT * FROM sample25 WHERE text LIKE '%SQL%';

-- 2) LIKE로 % 검색
WHERE text LIKE '%/%%'
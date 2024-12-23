
--테이블 생성 (DDL: 데이터 정의어)
--학생의 성적 정보 저장
CREATE TABLE TBL_SCORE(
    STU_ID NUMBER(6) PRIMARY KEY,
    STU_NAME VARCHAR2(20) NOT NULL,
    KOR NUMBER(3)NOT NULL CHECK(KOR >= 0 AND KOR <= 100),
    ENG NUMBER(3)NOT NULL CHECK(ENG >= 0 AND ENG <= 100),
    MATH NUMBER(3)NOT NULL CHECK(MATH >= 0 AND MATH <= 100),
    TOTAL NUMBER(3),
    AVERAGE NUMBER(5,2),
    GRADE CHAR(1)
);

-- ALTER문으로 제약조건 추가
-- AVERAGE에 UNIQUE 제약 조건을 걸고 싶음
ALTER TABLE TBL_SCORE 
ADD CONSTRAINT UNIQUE_AVERAGE
UNIQUE(AVERAGE);

-- AVERAGE에 UNIQUE 제약 조건 해지하고 싶음
ALTER TABLE TBL_SCORE
DROP CONSTRAINT UNIQUE_AVERAGE;

-- 컬럼 추가
ALTER TABLE TBL_SCORE
ADD (SCIENCE NUMBER(3) NOT NULL);

-- 컬럼 제거
ALTER TABLE TBL_SCORE
DROP COLUMN SCIENCE;

INSERT INTO TBL_SCORE
    (STU_ID, STU_NAME, KOR, ENG, MATH)
VALUES 
    (1,'뽀롱롱',100,70,50);

SELECT * FROM TBL_SCORE;

INSERT INTO TBL_SCORE
    (STU_ID, STU_NAME, KOR, ENG, MATH)
VALUES 
    (2,'하츄핑',70,100,98);

SELECT * FROM TBL_SCORE;

--TRUNCATE TABLE: 테이블 안의 데이터 전체 삭제
TRUNCATE TABLE TBL_SCORE;

SELECT * FROM TBL_SCORE;

INSERT INTO TBL_SCORE
    (STU_ID, STU_NAME, KOR, ENG, MATH)
VALUES 
    (1,'뽀롱롱',100,70,50);

INSERT INTO TBL_SCORE
    (STU_ID, STU_NAME, KOR, ENG, MATH)
VALUES 
    (2,'하츄핑',70,100,98);

SELECT * FROM TBL_SCORE;

--DROP TABLE: 테이블 삭제
DROP TABLE TBL_SCORE;




CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    goods_name VARCHAR2(50) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    created_at DATE
);

-- 데이터 생성: INSERT
INSERT INTO GOODS
 (id, goods_name, price, created_at)
VALUES
 (1,'선풍기',120000,SYSDATE);

INSERT INTO GOODS
 (id, goods_name, price, created_at)
VALUES
 (2,'세탁기',2000000,SYSDATE);
 
 INSERT INTO GOODS
 (id, goods_name,created_at)
VALUES
 (3,'달고나',SYSDATE);

--NOT NULL제약조건으로 인해 생성 불가능
INSERT INTO GOODS
 (id, price, created_at)
VALUES
 (4,2000000,SYSDATE);
 
INSERT INTO GOODS
 (id, goods_name)
VALUES
 (5,'계란');
 
  INSERT INTO GOODS
 ( goods_name,id,created_at) --테이블 생성 시 정해진 컬럼 순서대로 값을 안 넣어도 됨. 밸류랑 페어만 맞추면 됨.
VALUES
 ('건조기',6,SYSDATE);
 
 --VALUES 앞에 컬럼명을 생략하면 
 --테이블 생성 시 정해진 컬럼 순서대로 값을 모조리 넣어야 함
 --실무에선 사용 비추 (리팩토링할 때 골치 아파짐)
INSERT INTO GOODS
VALUES
 (7,'탕수육',30000,SYSDATE);
 
 -- 데이터 조회
 SELECT * FROM GOODS;
 
 --데이터 수정: UPDATE
UPDATE GOODS 
SET goods_name = '에어컨'
WHERE id = 1;

UPDATE GOODS
SET 
goods_name = '짜장면', price = 8000
WHERE id = 3;

COMMIT;

--WHERE 조건절이 없는 업데이트 -> 모든 행을 수정함 (위험!)
--EX. 1월 1일 모든 회원들의 나이를 한 살 씩 올려야 할 때 사용
UPDATE GOODS
SET price = 9999;

--ID(pk)는 웬만하면 바꾸면 안 됨
UPDATE GOODS
SET id = 11
WHERE id = 2;

UPDATE GOODS
SET price = null
WHERE id = 6;

--낫 널 제약조건은 널값 수정 불가
UPDATE GOODS
SET goods_name = null
WHERE id = 6;

ROLLBACK;

SELECT * FROM GOODS;

--데이터 삭제: DELETE
DELETE FROM GOODS
WHERE id = 1;

COMMIT;

--WHERE 조건절이 없는 딜리트 -> 전체 삭제 
--그러나 이것은 복구가 가능, TRUNCATE TABLE은 복구가 안 됨
DELETE FROM GOODS;
ROLLBACK;

TRUNCATE TABLE GOODS;

--데이터 조회: SELECT 
SELECT * FROM GOODS;

SELECT
    certi_cd
    , certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

SELECT
    certi_nm
    , certi_cd
    , issue_insti_nm
FROM TB_CERTI
;

SELECT
    certi_nm
    , issue_insti_nm
FROM TB_CERTI
;

SELECT ALL
     issue_insti_nm
FROM TB_CERTI
;

--중복 제거 
SELECT DISTINCT 
     issue_insti_nm
FROM TB_CERTI
;

--모든 컬럼 조회
--실무에선 사용 지양
SELECT 
     *
FROM TB_CERTI
;

--컬럼 별칭 지정(ALLIAS)
SELECT 
    emp_nm AS "사원명"
    ,addr AS "주소"
FROM TB_EMP
;

--AS 생략 가능
--경우에 따라서 "도 생략 가능
--별칭에 띄어쓰기가 있을 경우 "를 생략하면 안 됨
SELECT 
    emp_nm 사원명
    ,addr 주소
FROM TB_EMP
;

--문자열 결합 (자바에선 + , 오라클에선 ||)
SELECT 
    '자격증 정보: ' || certi_nm AS certi_detail
FROM TB_CERTI
;

SELECT 
    certi_nm || '(' || issue_insti_nm || ')' AS certi_detail
FROM TB_CERTI
;














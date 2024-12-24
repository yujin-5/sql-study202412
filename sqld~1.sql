
--WHERE 조건절: 데이터를 필터리할 때 사용
--남자인 직원만 필터링
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd = 2 --필터링 조건
;

--PK로 필터링하면 무조건 0건 또는 1건이 조회됨
--ex. 주민번호 조회 시 0명 또는 1명 조회됨
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE emp_no = 1000000003
;

--남자가 아닌 직원만 조회
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd != 1 --성별 코드가 1이 아닌 사람
;


SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd <>1 --NOT EQUAL/성별 코드가 1이 아닌 사람
;

--90년대생들만 필터링
SELECT 
    emp_no
    ,emp_nm
    ,addr
    ,birth_de
FROM TB_EMP
WHERE birth_de >= '19900101' 
    AND birth_de <= '19991231'
;

--사이 데이터를 조회: BETWEEN A AND B
--ex. 상품 가격 조회, 호텔 조회(3성급~5성급)
SELECT 
    emp_no
    ,emp_nm
    ,addr
    ,birth_de
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

--90년대생이 아닌 사람들만 조회
--NOT BETWEEN 사용
SELECT 
    emp_no
    ,emp_nm
    ,addr
    ,birth_de
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;

-- IN연산자: OR연산
--100002번과 100007번 사람들만 조회
SELECT 
    emp_no
    ,emp_nm
    ,dept_cd
FROM TB_EMP
WHERE dept_cd = 100002 
    OR dept_cd = 100007
;

SELECT 
    emp_no
    ,emp_nm
    ,dept_cd
FROM TB_EMP
WHERE dept_cd IN (100002, 100007, 100009)
;

--NOT IN
SELECT 
    emp_no
    ,emp_nm
    ,dept_cd
FROM TB_EMP
WHERE dept_cd NOT IN (100002, 100007, 100009)
;

--Like 연산
--특정 단어가 포함된 검색에서 사용
--와일드카드 매핑(%: 0글자 이상, _: 딱 1글자)

--용인 사는 사람들만 조회
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE addr LIKE '%용인%' --용인 앞에 0글자 이상, 용인 뒤에 0글자 이상 오케이
;

--성씨가 이씨인 사람들만 조회
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '이%'
;

--이름이 두 글자인 이씨 사람들만 조회
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '이__'
;

--이름이 심으로 끝나는 사람들만 조회
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '%심'
;

--응용 예시
SELECT
    email
FROM user
WHERE email LIKE '_a%@%.com' --banana123@gmail.com
;

-- 성씨가 김씨이면서
-- 부서가 100003, 100004 중에 하나면서
-- 90년대생인 사원의 
-- 사번, 이름, 생일, 부서코드를  조회
SELECT
    emp_no
    ,emp_nm
    ,birth_de
    ,dept_cd
FROM TB_EMP
WHERE 1=1 
--첫번째 조건 주석처리하고 싶을 때 첫 조건 자리에 무조건 true가 나오는 조건을 적고
--그 다음 줄에 원래 첫 번째 조건이었던 걸 적음
    --AND emp_nm LIKE '김%' 
    AND dept_cd IN(100003,100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;

--NULL 값 조회
--NULL 조회는 무조건 IS NULL
-- = NULL 조회 안 됨
SELECT 
    emp_no
    ,emp_nm
    ,direct_manager_emp_no
FROM TB_EMP
WHERE direct_manager_emp_no IS null
;

--not is null이 아니라 is not null(빈출)
SELECT 
    emp_no
    ,emp_nm
    ,direct_manager_emp_no
FROM TB_EMP
WHERE direct_manager_emp_no IS NOT null
;

--연산자 우선순위
--NOT > AND > OR
--김씨이면서 일산 또는 수원사는 사람들 조회

--1. 김씨이면서 일산사는 사람 조회 (김려원, 김호형, 김열호 등)
--2. (김씨 아니여도) 수원사는 사람 조회
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '김%'
    AND addr Like '%일산%'
        OR addr LIKE '%수원%'
;

--OR조건에 괄호쳐줘야 의도한대로 값이 도출됨
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '김%'
    AND (addr Like '%일산%'
        OR addr LIKE '%수원%')
;














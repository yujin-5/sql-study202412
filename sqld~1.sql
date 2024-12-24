
--WHERE ������: �����͸� ���͸��� �� ���
--������ ������ ���͸�
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd = 2 --���͸� ����
;

--PK�� ���͸��ϸ� ������ 0�� �Ǵ� 1���� ��ȸ��
--ex. �ֹι�ȣ ��ȸ �� 0�� �Ǵ� 1�� ��ȸ��
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE emp_no = 1000000003
;

--���ڰ� �ƴ� ������ ��ȸ
SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd != 1 --���� �ڵ尡 1�� �ƴ� ���
;


SELECT 
    emp_no
    , emp_nm
    , addr
    , sex_cd
FROM TB_EMP
WHERE sex_cd <>1 --NOT EQUAL/���� �ڵ尡 1�� �ƴ� ���
;

--90�����鸸 ���͸�
SELECT 
    emp_no
    ,emp_nm
    ,addr
    ,birth_de
FROM TB_EMP
WHERE birth_de >= '19900101' 
    AND birth_de <= '19991231'
;

--���� �����͸� ��ȸ: BETWEEN A AND B
--ex. ��ǰ ���� ��ȸ, ȣ�� ��ȸ(3����~5����)
SELECT 
    emp_no
    ,emp_nm
    ,addr
    ,birth_de
FROM TB_EMP
WHERE birth_de BETWEEN '19900101' AND '19991231'
;

--90������ �ƴ� ����鸸 ��ȸ
--NOT BETWEEN ���
SELECT 
    emp_no
    ,emp_nm
    ,addr
    ,birth_de
FROM TB_EMP
WHERE birth_de NOT BETWEEN '19900101' AND '19991231'
;

-- IN������: OR����
--100002���� 100007�� ����鸸 ��ȸ
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

--Like ����
--Ư�� �ܾ ���Ե� �˻����� ���
--���ϵ�ī�� ����(%: 0���� �̻�, _: �� 1����)

--���� ��� ����鸸 ��ȸ
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE addr LIKE '%����%' --���� �տ� 0���� �̻�, ���� �ڿ� 0���� �̻� ������
;

--������ �̾��� ����鸸 ��ȸ
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '��%'
;

--�̸��� �� ������ �̾� ����鸸 ��ȸ
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '��__'
;

--�̸��� ������ ������ ����鸸 ��ȸ
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '%��'
;

--���� ����
SELECT
    email
FROM user
WHERE email LIKE '_a%@%.com' --banana123@gmail.com
;

-- ������ �达�̸鼭
-- �μ��� 100003, 100004 �߿� �ϳ��鼭
-- 90������ ����� 
-- ���, �̸�, ����, �μ��ڵ带  ��ȸ
SELECT
    emp_no
    ,emp_nm
    ,birth_de
    ,dept_cd
FROM TB_EMP
WHERE 1=1 
--ù��° ���� �ּ�ó���ϰ� ���� �� ù ���� �ڸ��� ������ true�� ������ ������ ����
--�� ���� �ٿ� ���� ù ��° �����̾��� �� ����
    --AND emp_nm LIKE '��%' 
    AND dept_cd IN(100003,100004)
    AND birth_de BETWEEN '19900101' AND '19991231'
;

--NULL �� ��ȸ
--NULL ��ȸ�� ������ IS NULL
-- = NULL ��ȸ �� ��
SELECT 
    emp_no
    ,emp_nm
    ,direct_manager_emp_no
FROM TB_EMP
WHERE direct_manager_emp_no IS null
;

--not is null�� �ƴ϶� is not null(����)
SELECT 
    emp_no
    ,emp_nm
    ,direct_manager_emp_no
FROM TB_EMP
WHERE direct_manager_emp_no IS NOT null
;

--������ �켱����
--NOT > AND > OR
--�达�̸鼭 �ϻ� �Ǵ� ������� ����� ��ȸ

--1. �达�̸鼭 �ϻ��� ��� ��ȸ (�����, ��ȣ��, �迭ȣ ��)
--2. (�达 �ƴϿ���) ������� ��� ��ȸ
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '��%'
    AND addr Like '%�ϻ�%'
        OR addr LIKE '%����%'
;

--OR���ǿ� ��ȣ����� �ǵ��Ѵ�� ���� �����
SELECT 
    emp_no
    ,emp_nm
    ,addr
FROM TB_EMP
WHERE emp_nm LIKE '��%'
    AND (addr Like '%�ϻ�%'
        OR addr LIKE '%����%')
;














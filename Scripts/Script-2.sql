CREATE TABLE EMP AS SELECT * FROM EMPLOYEES e ;
CREATE TABLE DEPT AS SELECT * FROM DEPARTMENTS;
CREATE TABLE JOB2 AS SELECT * FROM JOBS;
ALTER TABLE HR.EMP MODIFY EMAIL VARCHAR2(25) NULL;

CREATE TABLE ADMINS(
	ADMIN_ID VARCHAR2(20),
	ADMIN_PW VARCHAR2(256)
);

SELECT RANDOM()
	FROM DUAL;

INSERT INTO ADMINS VALUES('hamoon', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4');
INSERT INTO ADMINS VALUES('hyeon','f6f2ea8f45d8a057c9566a33f99474da2e5c6a6604d736121650e2730c6fb0a3');

ALTER TABLE ADMINS ADD CONSTRAINT ADMINS_PK PRIMARY KEY(ADMIN_ID);

SELECT job_id FROM job2;
-- WP001 전체조회
SELECT EMPLOYEE_ID, FIRST_NAME ||' ' || LAST_NAME AS NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
	FROM EMP;

-- WP002 이름 or ID를 검색하여 조회하는 기능
SELECT EMPLOYEE_ID, FIRST_NAME ||' ' || LAST_NAME AS NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID
	FROM EMP
	WHERE LOWER(FIRST_NAME ||' ' || LAST_NAME) LIKE LOWER('ST%');

-- WP003 부서별로 조회하는 기능
SELECT DEPARTMENT_ID 
	FROM EMP
	WHERE DEPARTMENT_ID IS NOT NULL
	GROUP BY DEPARTMENT_ID
	ORDER BY DEPARTMENT_ID ;

SELECT *
	FROM EMP
	WHERE DEPARTMENT_ID = '';

-- WP004 직업별로 조회하는 기능
SELECT JOB_ID  
	FROM EMP
	WHERE JOB_ID  IS NOT NULL
	GROUP BY JOB_ID 
	ORDER BY JOB_ID  ;

SELECT *
	FROM EMP 
	WHERE JOB_ID = '';

-- WP005 채용일로 조회하는 기능
SELECT *
	FROM EMP
	WHERE HIRE_DATE BETWEEN  TO_DATE('2005-01-01', 'YYYY-MM-DD') 
					AND TO_DATE('2007-01-01', 'YYYY-MM-DD') ;

-- WP006 급여별로 조회하는 기능
SELECT *
	FROM EMP
	WHERE SALARY BETWEEN 1000 AND 3000;

-- WP007 폰번호 수정
UPDATE EMP SET PHONE_NUMBER = 515||'.'||123||'.'||4567
			WHERE EMPLOYEE_ID = '100';
-- 중복검사를 위한 SELECT 
SELECT PHONE_NUMBER
	FROM EMP;

-- WP008 JOB_ID, DEPARTMENT_ID 수정 (SELECT로 드롭다운)
SELECT JOB_ID
	FROM JOB2;
SELECT DEPARTMENT_ID 
	FROM DEPT;

UPDATE EMP SET JOB_ID = ''
			WHERE EMPLOYEE_ID = '100';

UPDATE EMP SET DEPARTMENT_ID = ''
			WHERE EMPLOYEE_ID = '100';

-- WP009 MANAGER_ID 자동 수정
SELECT MANAGER_ID 
	FROM DEPT
	WHERE DEPARTMENT_ID = '';

UPDATE EMP SET MANAGER_ID = ''
		WHERE DEPARTMENT_ID = '';

-- WP010 SALARY 수정 (JOB별 MIN, MAX SALARY 범위 내 수정하도록)
SELECT MIN_SALARY
	FROM JOB2
	WHERE JOB_ID = '';

SELECT MAX_SALARY
	FROM JOB2
	WHERE JOB_ID = '';
	
UPDATE EMP SET SALARY = ''
	WHERE EMPLOYEE_ID = '';

-- WP011 사원 삭제
DELETE FROM EMP 
	WHERE EMPLOYEE_ID = '';

-- 신규 사원 등록 (전체컬럼 VER)
INSERT INTO EMP 
	VALUES ('EMPLOYEE_ID', 'FIRST_NAME', 'LAST_NAME', NULL,
			('515'||'.'||'123'||'.'||'4567'), 'HIRE_DATE', 'JOB_ID', 
			'SALARY', 'COMM', NULL, 'DEPARTMENT_ID');
		
-- WP012 중복되지 않는 EMPLOYEE_ID
-- SELECTKEY 구문
SELECT MAX(EMPLOYEE_ID)+1
	FROM EMP;

-- WP013 형식에 맞춘 EMAIL을 위한 SELECT
SELECT SUBSTR(FIRST_NAME,1,1)||UPPER(LAST_NAME)  
	FROM EMP
	WHERE EMPLOYEE_ID = '';

UPDATE EMP SET EMAIL = ''
		WHERE EMPLOYEE_ID = '';
-- WP016 JOB_ID, DEPARTMENT_ID 드롭다운 값
SELECT JOB_ID
	FROM JOB2;
SELECT DEPARTMENT_ID 
	FROM DEPT;

-- MANAGER_ID 자동 입력 => WP009 사용

-- WP017 SALARY 직업별 급여 범위 내 입력 => WP010 사용

-- WP018 직업 전체 조회
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
	FROM JOB2;

-- WP019 직업 아이디 드롭다운을 위한 SELECT 
SELECT JOB_ID
	FROM JOB2;

-- WP020 직업명 OR ID를 검색하여 조회하는 기능 
SELECT JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY
	FROM JOB2
	WHERE LOWER(JOB_TITLE) LIKE LOWER('P%');

-- WP021 JOB_ID 수정시 사원 테이블의 해당 JOB_ID도 자동 변경 (드롭다운은 WP019 사용)
UPDATE JOB2 SET JOB_ID = 'NEW_ID'
		WHERE JOB_ID = 'OLD_ID';

UPDATE EMP SET JOB_ID = 'NEW_ID'
		WHERE JOB_ID = 'OLD_ID';

-- WP022 JOB_TITLE 수정하는 기능
-- 드롭다운을 위한 SELECT 
SELECT JOB_TITLE
	FROM JOB2;

UPDATE JOB2 SET JOB_TITLE = ''
		WHERE JOB_TITLE = '';

-- WP023 MIN, MAX SALARY 수정
UPDATE JOB2 SET MIN_SALARY = '';
UPDATE JOB2 SET MAX_SALARY = '';

-- WP024 직업 삭제 및 사원 테이블의 해당 직업 NULL로 바뀌기
DELETE FROM JOB2 
	WHERE JOB_ID = '';

UPDATE EMP SET JOB_ID IS NULL;
	WHERE JOB_ID = '';

-- WP025 새로운 직업 등록
INSERT INTO JOB2
	('JOB_ID', 'JOB_TITLE', 'MIN_SALARY', 'MAX_SALARY');

-- WP026 부서 전체 조회
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
	FROM DEPT;

-- WP027  부서 아이디 드롭다운을 위한 SELECT 
SELECT DEPARTMENT_ID
	FROM DEPT;

-- WP028 부서명을 검색하여 조회
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID
	FROM DEPT
	WHERE LOWER(DEPARTMENT_NAME) LIKE LOWER('P%');

-- WP029 부서 이름 수정
UPDATE DEPT SET DEPARTMENT_NAME = 'NEW_NAME'
		WHERE DEPARTMENT_NAME ='OLD_NAME';

-- WP030 MANAGER_ID 수정시 드롭다운을 위한 SELECT 
SELECT MANAGER_ID
	FROM DEPT;

UPDATE DEPT SET MANAGER_ID = 'NEW_ID'
		WHERE MANAGER_ID ='OLD_ID';

-- WP031 MANAGER_ID 수정시 EMP 테이블 부서 수정
UPDATE EMP SET MANAGER_ID = 'NEW_ID'
		WHERE MANAGER_ID = 'OLD_ID';

-- WP032 부서 삭제
DELETE FROM DEPT
	WHERE DEPARTMENT_ID = '';

UPDATE EMP SET DEPARTMENT_ID IS NULL;
	WHERE DEPARTMENT_ID = '';

-- WP033 부서 등록시 DEPARTMENT_ID 자동 생성
-- 전체 등록
INSERT INTO DEPT
	('DEPARTMENT_ID', 'DEPARTMENT_NAME', 'MANAGER_ID');

-- SELECTKEY 구문
SELECT MAX(DEPARTMENT_ID)+10
	FROM DEPT;

-- WP034 MANAGER_ID 등록시 드롭다운 => WP030 사용

-- WP035 직업별 평균 연봉 조회 (전체)
SELECT e.JOB_ID, ROUND(AVG(SALARY)) 평균급여
 		FROM EMP e INNER JOIN (SELECT JOB_ID, ROUND(AVG(SALARY)) 평균급여
							 	FROM EMP e 
							 	GROUP BY JOB_ID) e2
				 ON e.JOB_ID = e2.JOB_ID
				GROUP BY e.JOB_ID 
				ORDER BY 2;

-- 각각 조회
SELECT e.JOB_ID, ROUND(AVG(SALARY)) 평균급여
 		FROM EMP e INNER JOIN (SELECT JOB_ID, ROUND(AVG(SALARY)) 평균급여
							 	FROM EMP e 
							 	GROUP BY JOB_ID) e2
				 ON e.JOB_ID = e2.JOB_ID
				WHERE e.JOB_ID = 'IT_PROG'
				 GROUP BY e.JOB_ID;

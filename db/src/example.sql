

select * from tab;

select *
from emp
order by department_id;


select empno, sal, deptno
from emp -- 1
where sal > 1200 -- 2
order by deptno asc, 2 asc;


select count( distinct deptno) from emp;

select * from emp where sal > 2000 or 1=1;

select department_id 부서, first_name|| ' ' || last_name, salary 급여, salary*12 "연봉"
from employees
where salary > 5000
order by 부서 asc, 3 desc


select department_id 부서, first_name|| ' ' || last_name 이름, salary 급여, job_id
from employees
where job_id = 'IT_PROG' and hire_date >= '2007-01-01' and hire_date <= '2007-12-31'

select * from employees;



select * from employees;

employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
salary, commission_pct, manager_id, department_id




select first_name, last_name, salary, department_id
from employees
where (department_id ='80' or department_id = '50') and salary >= '13000'


select first_name, last_name, salary, department_id, hire_date
from employees
where hire_date >='2005-01-01' and (salary >= 1300 and salary <= 3000)


--이름이 D로 시작하는 직원의 이름, 급여, 입사일을 조회하시오.
select first_name, last_name, salary, hire_date
from employees
where substr(first_name, 1, 1) = 'D'

--이름에 le 가 들어간 직원의 이름, 급여, 입사일을 조회하시오.
select first_name, last_name, salary, hire_date
from employees
where REGEXP_LIKE(first_name,'le' ) or REGEXP_LIKE(last_name, 'le')

--이름의 세번째 글자가 r인 이름, 급여, 입사일을 조회하시오.

select * from EMP where mgr in (7902, 7566, 7788)



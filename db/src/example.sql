

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

select department_id �μ�, first_name|| ' ' || last_name, salary �޿�, salary*12 "����"
from employees
where salary > 5000
order by �μ� asc, 3 desc


select department_id �μ�, first_name|| ' ' || last_name �̸�, salary �޿�, job_id
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


--�̸��� D�� �����ϴ� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, last_name, salary, hire_date
from employees
where substr(first_name, 1, 1) = 'D'

--�̸��� le �� �� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, last_name, salary, hire_date
from employees
where REGEXP_LIKE(first_name,'le' ) or REGEXP_LIKE(last_name, 'le')

--�̸��� ����° ���ڰ� r�� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

select * from EMP where mgr in (7902, 7566, 7788)



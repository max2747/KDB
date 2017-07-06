
--subquery
--'Steven King'�� ���� �μ��� �������� �Ұ�

select * from employees
where department_id = (
select department_id from employees
where first_name = 'Steven' and last_name = 'King'

)

select * from employees
where department_id = any (
select department_id from employees
where first_name = 'Steven'

)
-- in�� =any�� ����. (������ ó�� ����)

--�޿��� ���� ���� ����� �̸��� �޿��� �Ի���
select first_name, salary, hire_date
from employees
where salary = (select max(salary) from employees)

--��� �޿����� ���� �޿��� �޴� ������ ��ȸ

select first_name, salary
from employees
where salary <= (select sum(salary) / count(*) from employees)

select sum(salary) / count(*) from employees
select avg(salary) from employees

--�ڽ��� ���� �μ��� ��պ��� ���� �޿��� �޴� ����

select *
from (
		select department_id, avg(salary) avgSalary
		from EMPLOYEES
		group by department_id
	 ) A, employees e
where e.department_id = A.department_id and e.salary < A.avgSalary





--�����÷� subquery
--�ڽ��� ���� �μ��� �ִ� �޿��� �޴� ���� ���� ��ȸ
select *
from employees A
where (department_id, salary ) = (
					select department_id, max(salary)
					from employees
					where department_id = A.department_id
					group by department_id
				)

select * from departments



---------------------------

(select * from emp where to_char(hiredate, 'YYYY') = 1981 )
union 
(select * from emp where deptno = 10)

select * from emp union all select from dept

----�÷��� ������ Ÿ���� ��������Ѵ�. ���� sal�� �����ֱ� ���� dept�� 0��, 
--emp�� hiredate�� ���߱� ���� dept�� null�� �߰�����.
(select ename, sal, hiredate, ''
from emp)
union 
(select dname,0, null, loc
from dept)


insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(3, '����', 'CLERK2', 7900, sysdate, 5000, 5, 30)

select * from 

--emp�� ���� �ܾ emp2�� �ܾ��
select table emp2
as select * from emp


--where���� false�� ���� �־� �����͸� �������� �ʰ� ������ �����Ѵ�.
create table emp2
as select * from emp
where 0 = 1

select * from emp2

insert into emp2
 select * from emp where deptno = 10

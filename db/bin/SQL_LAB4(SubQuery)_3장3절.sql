========================================
		SubQuery
========================================
1. 'IT'�μ����� �ٹ��ϴ� �������� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

select first_name, salary, hire_date
from (
		select first_name, salary, hire_date, department_name
		from departments D, employees E
		where D.department_id = E.department_id
) A
where A.department_name = 'IT'


select first_name, salary, hire_date
from employees join departments
using(department_id)
where department_name = 'IT'



2. 'Alexander' �� ���� �μ����� �ٹ��ϴ� ������ �̸��� �μ�id�� ��ȸ�Ͻÿ�.
						
 select first_name, department_id
 from employees
 where department_id in (select department_id 
 						   from employees 
 						   where first_name ='Alexander')
 
 						   
 select * from employees where first_name ='Alexander'
 

3. 80���μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�.
select first_name, department_id, salary
from employees E
where salary > ( select sum(salary) / count(*)
				 from employees
				 where department_id = '80'
				)				
order by 3 asc

---���������� ��� ��κ��� ũ��
select * from employees where salary > ALL (5000, 10000)

4. 'South San Francisco'�� �ٹ��ϴ� ������ �ּұ޿����� �޿��� ���� �����鼭 
50 ���μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �޿�, �μ���, 
�μ�id�� ��ȸ�Ͻÿ�.
 -- Texas�� �غ�
select first_name, salary, department_name, department_id
from (
       select first_name,salary, department_name, department_id, location_id
       from employees E, departments D
       where E.department_id = D.department_id
     ) A, locations L
where A.location_id = L.location_id 
     and 

select min(salary)
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
and l.state_province = 'Texas'

select avg(salary)
from employees e
where department_id = 50


select first_name, salary, department_name, e.department_id, (
select min(salary)
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
and l.city = 'South San Francisco'

		) "���� ����",
(select avg(salary)
from employees e
where department_id = 50) "50�� ��ձ޿�"		
		
from employees e, departments d
where e.department_id = d.department_id and
 e.salary > ( 
select min(salary)
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
and l.city = 'South San Francisco')

and salary > (
select avg(salary)
from employees e
where department_id = 50)

select * From locations
     
-------------------scott/tiger (emp, dept)

1. BLAKE�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
������� BLAKE�� ���ܽ�ŵ�ϴ�.
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE') 
      and ename !='BLAKE'
 

      
      

2. �μ��� ��ġ�� DALLAS�� ��� ����� �̸�, �μ���ȣ , ������ ǥ���Ͻÿ� 
select ename, e.deptno, job
from emp e, dept d
where d.deptno = e.deptno and d.loc='DALLAS'

select * from emp


3. KING���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ� 

select e2.ename, e2.sal, e2.mgr
from emp e1, emp e2
where e1.ename = 'KING'and e1.empno = e2.mgr

select *
from emp
where mgr = (select empno from emp where ename='KING')

select * from emp
 
se













 

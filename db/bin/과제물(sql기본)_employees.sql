conn hr/hr

����� �̿��Ͽ� hr ������ �����Ͽ� ���� ������ ������ select �������� ó���Ͽ� �����ϼ���.

1. �� �μ�(department_id)���� �ְ� ����(salary)�� �޴� ����� ���(employee_id), 
��(last_name)�� ����(salary)�� ��ȸ�Ͻÿ�. �� ��ȸ����� ������ ������������ ���ĵǾ� 
��Ÿ���� �մϴ�.
select e.department_id, e.employee_id, e.last_name, e.salary
from employees e, ( select department_id, max(salary) maxSalary
				  	from employees
				  	group by department_id
  				  ) A
where e.department_id = A.department_id and e.salary = A.maxSalary
order by 4 desc

=========================================                                           

2. �� ����(job) ���� ����(salary)�� ������ ���ϰ��� �Ѵ�. 
���� ������ ���� ���� �������� ������(job_title)�� ���� ������ ��ȸ�Ͻÿ�.
select job_title, sum(salary)
from employees e, jobs j
where e.job_id = j.job_id
group by job_title
order by 2 desc


====================================

3. �� ���(employee)�� ���ؼ� ���(employee_id), �̸�(first_name), �μ���(department_name), 
�Ŵ���(manager)�� �̸�(first_name)�� ��ȸ�Ͻÿ�.
select A.employee_id, A.first_name, A.department_name, manager.first_name
from employees manager, ( select department_id, department_name, B.manager_id, first_name, employee_id
						  from employees B left outer join departments
						  using(department_id)
 									  ) A
where A.manager_id = manager.employee_id(+) --null�߰�
====================================


4. �ڽ��� �Ŵ������� ä����(hire_date)�� ���� ����� ���(employee_id), ��(last_name)�� ä����(hire_date)�� 
��ȸ�϶�.�� ��¥ ���˰� ALIAS�� �����Ѵ�.

���  ��  ä����(2010��12��3��)
====================================

select employee_id, last_name, to_char(hire_date, 'YYYY��MM��HH��') ä����
from employees A
where hire_date < (
					select distinct  manager.hire_date
					from employees emp, employees manager
					where emp.manager_id = manager.employee_id 
					and manager.employee_id = A.manager.id
				  )

�Ŵ��� ä����
select manager.hire_date
from employees emp, employees manager
where emp.manager_id = manager.employee_id


5. �ڽ��� �μ� ��� �޿����� ������ ���� ����� ���(employee_id), ��(last_name)�� ����(salary)�� ��ȸ�϶�.

=====================================

select employee_id, last_name, salary
from employees e, (select department_id, avg(salary) avgsal from employees group by department_id) A 
where e.department_id = A.department_id and salary > avgsal


6. ����(JOB)�� �ְ� �޿��� �޿��� ���� �������� ����Ͻÿ�. 
��, ������ 2�� �̻��� ������ ��ȸ�Ѵ�. 
select job_title, max(salary)
from employees e join jobs j
using(job_id)
group by job_title
having count(*) >= 2
order by 2 desc




=========================================

7. �� ����(city)�� �ִ� ��� �μ� �������� ��ձ޿��� ��ȸ�ϰ��� �Ѵ�. 
��ձ޿��� ���� ���� ���ú��� ���ø�(city)�� ��տ����� ����Ͻÿ�. 
��, ���ÿ� �ٹ��ϴ� ������ 10�� ������ ���� �����ϰ� ��ȸ�Ѵ�.

select city, avg(salary)
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
group by city
having count(*) > 10
order by 2 desc





===================================

8. ���(empno)�� 7934�� ������� ����(sal)�� ���� ����(job)�� SALESMAN�� 
����� ����� �̸��� ������ ��ȸ�Ѵ�. 
��, ������ ���� ������ ����Ѵ�. 


select empno, ename, sal
from emp e join dept d
using(deptno)
where sal > ( 
				select sal from emp where empno = '7934'
			)
and dname = 'SALES'
order by 3


=====================================

9. �������(GRADE)�� 4����� ������� �����ȣ(EMPNO), �����(ENAME), ����(SAL), �������(GRADE)�� ��ȸ�Ѵ�. 
������ ���� ������ �����ϰ�, ������ ���� ��쿡�� �����ȣ�� ���� ������ �����Ѵ�.

select empno, ename, sal, g.grade--, grade
from emp e, salgrade g
where  e.sal >= (select losal from salgrade where grade = 4)
and e.sal <= (select hisal from salgrade where grade = 4)
order by 3



select * from salgrade




===================================

10. �ڽ��� �Ŵ���(MGR)�� ������ �μ��� �ٹ��ϴ� ������� �����ȣ(EMPNO), �����(ENAME), �μ���ȣ(DEPTNO)�� ��ȸ�Ѵ�. 
��, �����ȣ�� ���� ������ �����Ѵ�.

========================================

11. �μ�������(LOC)�� "DALLAS"�� �μ��� �ٹ��ϸ鼭 ����(JOB)�� "CLERK"�� ������� �����ȣ, �̸�, ������ ��ȸ�Ѵ�. 
��, �����ȣ�� ���� ������ �����Ѵ�.

=======================================

12. �μ�������(LOC)�� 'DALLAS' �Ǵ� 'CHICAGO'�� �μ��� �ٹ��ϸ鼭 ������ 1400�̻��� ������� ����(SAL) ����� 
��ȸ�Ѵ�.





========================================================================
1.
���(EMPLOYEES) ���� �Ի��ϰ� �������� �̸��� ��ȸ�ϴ� �����Դϴ�. 
1995�� 01�� 01�� ������ �Ի���(hire_date) �������� ���(employee_id), �̸�(first_name), 
��(last_name)�� �Ի���(hire_date)�� ������ �������� �̸�(first_name) �� ��ȸ�Ͽ� ����Ͻʽÿ�. 
�̶�, �����ڰ� ���� ������ ���, �������� �̸��� '-' �� �����ݴϴ�. 
��½� �Ի��Ϸ� �������� �����Ͽ� ����ϰ�, �÷����� �Ʒ� ����� �����ϰ� �ۼ��Ͻʽÿ�.

���   �̸�   ��   �Ի���   �������̸�



======================================
2.
�� ��å ��(job_title)�� �޿��� ������ ���ϵ� ��å�� Manager �� ����� �����Ͻʽÿ�. 
��, �޿� ������ 1000 ���� �̻��� ��å�� ��Ÿ����, �޿� ���տ� ���� ������������ �����Ͻʽÿ�. 
��� ����� �÷����� �Ʒ� ����� �����ϰ� �ֽʽÿ�.

��å         �޿�����

=======================================

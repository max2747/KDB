========================================
		SubQuery
========================================


1. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.
�׸��� �μ��� ���� ������ ���ؼ��� '<�μ�����>' �� ��µǵ��� �Ѵ�.
(outer-join , nvl() )

select first_name, hire_date, nvl(department_name, '<�μ�����>')
from employees e left outer join departments d
using(department_id)




2. ������ ��å�� ���� ������ �ٸ��� �����Ϸ��� �Ѵ�.
��å�� 'Manager'�� ���Ե� ������ �޿��� 0.5�� ���ϰ�
������ �����鿡 ���ؼ��� ������ �޿��� �����ϵ��� �Ѵ�. 
�����ϰ� ��ȸ�Ͻÿ�. (decode)

select first_name, job_title, salary, 
       decode(substr(job_title, -7, 7), 'Manager', salary*0.5, salary) "���޾�"
from employees e join jobs j using(job_id)


select first_name, job_title, salary, 
       case when job_title like '%Manager' then salary*0.5
       else salary end ���޾�2
--decode(substr(job_title, -7, 7), 'Manager', salary*0.5, salary) "���޾�"
from employees e join jobs j using(job_id)



3. �� �μ����� �����޿��� �޴� ������ �̸��� �μ�id, �޿��� ��ȸ�Ͻÿ�.

select e.first_name, A.department_id, A.minSalary
from employees e, (select department_id, min(salary) minSalary
				   from employees
				   group by department_id) A
where e.salary = A.minSalary and e.department_id = A.department_id
order by 2



4. �� ���޺�(job_title) �ο����� ��ȸ�ϵ� ������ ���� ������ �ִٸ� �ش� ���޵�
��°���� ���Խ�Ű�ÿ�. �׸��� ���޺� �ο����� 3�� �̻��� ���޸� ��°���� ���Խ�Ű�ÿ�.

select job_title, count(employee_id)
from employees e right outer join jobs j
using(job_id)
group by job_title
having count(employee_id) >= 3 
order by 2




5. �� �μ��� �ִ�޿��� �޴� ������ �̸�, �μ���, �޿��� ��ȸ�Ͻÿ�.
select first_name, department_name, salary
from (select department_id, min(salary) minsal
	  from employees
	  group by department_id
	 ) A join departments, employees e
using(department_id)





6. ������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�. �׸��� ������ ���� �ش� �μ��� 
�ּұ޿��� �������� ���Խ��� ��� �Ͻÿ�.
 
select first_name, department_id, salary
from 
			




 



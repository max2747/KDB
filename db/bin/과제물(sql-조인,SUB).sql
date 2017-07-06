desc ���̺��;
������� ���̺� ���� Ȯ���ϼ���.

======================================
1.
��� �μ��� �̸��� ��ġ�ڵ� �� �� �μ����� �ٹ��ϴ� ��� ���� ǥ���ϴ� �������� �ۼ��Ͻʽÿ�. 
��, ����� ���� �μ��� �Բ� ǥ���Ͻʽÿ�.

select location_id, department_id, countEmp
from (
select department_id, count(employee_id) countEmp
from employees
group by department_id ) A right outer join departments d
using(department_id)




=====================================
2.
��� �޿��� ���� ���� �μ��� �μ� �ڵ� �� �ش� �μ��� ���� �޿��� ǥ���ϴ� �������� �ۼ��Ͻʽÿ�

select e.department_id, min(salary)
from employees e,( select * from(
				select department_id, avg(salary) kk
				from employees
				group by department_id
				order by 2 desc
				) where rownum <= 1) A
where e.department_id = A.department_id
group by e.department_id



=====================================
3.
���� 'De Haan' ����� ������ �����ȣ, ��(last_name), �Ի��� �� �޿��� ǥ���ϴ� SQL���� �ۼ��Ͻʽÿ�.

select employee_id, last_name, hire_date, salary
from employees
where last_name = 'De Haan'


=====================================
4.
���� ���� United States of America���� �ٹ��ϴ� ������ �̸� �߿��� ������ 9000�̻��� �������� �̸�, ����, ���ø��� ��ȸ�Ͻÿ�.

select emp.first_name, emp.salary, A.city
from (
	   select first_name, city
	   from employees e, departments d, locations l, countries c
	   where e.department_id = d.department_id and d.location_id = l.location_id 
	   and l.country_id = c.country_id and c.country_name ='United States of America'
 	) A, employees emp
where emp.first_name = A.first_name and salary >= 9000




======================================
5.  
�μ��̸��� ������ �ο����� �ִ�, �ּ�, ��ձ޿��� ��ȸ�Ͻÿ�.
��, �ִ�, �ּ� �޿��� ���� �μ��� ��°������ �����Ѵ�. �׸��� ��մ� �Ҽ��� 2�ڸ������� ��µǵ��� �ݿø��Ѵ�. 

select department_name, count(employee_id), max(salary), min(salary), round(avg(salary), 2) "��ձ޿�"
from employees e, departments d
where e.department_id = d.department_id
group by department_name
having max(salary) != min(salary)



======================================
6.
������ 10000 �̻��� �������� �μ���, �̸�, �޿�, �ڽ��� ���� �μ��� ��ձ޿��� ��ȸ�Ͻÿ�.
��, �ڽ��� ���� �μ��� ��ձ޿��� �Ҽ��� ��° �ڸ������� ��µǵ��� �ݿø��Ѵ�. 



======================================  
7. 
�̸��� 'Sigal'�̶�� ������ �̸��� �޿�, �ڽ��� ���� �μ��� ��ձ޿��� ������ �޿��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�.
alias�� �����մϴ�.

=======================================
8.
�ٹ� ������ ����(United Kingdom)�� ĳ����(Canada)�� �������� ������� �޿��� 12000 �̻��� ������ �̸�, �޿�, �ٹ��μ�, �������� ����Ͻÿ�.


========================================
9.
job_title �� "Manager"��� ���ڿ��� ���Ե� job�� ���� �������� ��� ������ job_title ���� ��տ����� ����Ѵ�.

=======================================
10.
�ڽ��� ���� ���� ��տ������� ���� ������ �޴� ����� ���̵�, �μ����̵�, ����, ���� ��տ����� �˻��Ͻʽÿ�.


=======================================
11.
��ü ����� ��ձ޿����� �ڽ��� �޿��� ���̰� 1000 ������ �޿��� �޴� ����� ����� ����Ͻÿ�.
������� ��ձ޿��� 5000 �� ��� 4000~6000 (4000�� 6000 ���� �� ����) ������ �޿��� �޴� ����� ��� ����� �˴ϴ�.

     
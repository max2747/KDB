employee_id, first_name, last_name, email, phone_number, hire_date, job_id,
salary, commission_pct, manager_id, department_id

--1. �޿��� 15000 �̻��� �������� �̸�, �޿�, �μ�id�� ��ȸ�Ͻÿ�.
select first_name, last_name, salary, department_id
from employees
where salary >= 15000


--
2. ���� �߿��� ������ 170000 �̻��� �������� �̸�, ������ ��ȸ�Ͻÿ�.
   ������ �޿�(salary)�� 12�� ���� ���Դϴ�.
   
select first_name, last_name, salary*12 ����
from employees
where salary*12 >= 170000

3. ���� �߿��� �μ�id�� ���� ������ �̸��� �޿��� ��ȸ�Ͻÿ�.
select first_name, last_name, salary
from employees
where department_id is null


4. 2004�� ������ �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, last_name, salary, hire_date
from employees
where hire_date < '2004-01-01'

1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.
select first_name, last_name, salary, department_id
from employees
where salary >= 13000 and department_id in (80, 50)


2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 20000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.
select first_name, last_name, salary, department_id, hire_date
from employees
where hire_date >= '2005-01-01' and  salary between 1300 and 20000



1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.
select first_name, last_name , salary, department_id
from employees
where department_id in (80, 50) and salary >= 13000

2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 30000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.

select first_name, last_name, salary, department_id, hire_date
from employees
where (salary between 1300 and 30000) and hire_date >= '2005-01-01'


3. 2005�⵵ �Ի��� ������ ������ ����Ͻÿ�.
select * from employees where hire_date >='2005-01-01'


4. �̸��� D�� �����ϴ� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, last_name, salary, hire_date
from employees
where first_name like 'D%'


5. 12���� �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where hire_date like '____'


6. �̸��� le �� �� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where first_name like











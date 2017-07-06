
hr/hr
========================================
		SELECT �⺻
========================================

1. �޿��� 15000 �̻��� �������� �̸�, �޿�, �μ�id�� ��ȸ�Ͻÿ�.
select first_name, salary, department_id
from employees
where salary >= 15000


2. ���� �߿��� ������ 170000 �̻��� �������� �̸�, ������ ��ȸ�Ͻÿ�.
   ������ �޿�(salary)�� 12�� ���� ���Դϴ�.
select first_name, salary*12 ����
from employees
where salary*12 >= 170000


3. ���� �߿��� �μ�id�� ���� ������ �̸��� �޿��� ��ȸ�Ͻÿ�.
select first_name,salary
from employees
where department_id is null


4. 2004�� ������ �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where hire_date < '2005-01-01'


-- �������� -- 
1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.

select first_name, salary, department_id
from employees
where salary >= 13000 and department_id in (80, 50)


2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 20000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, department_id, hire_date
from employees
where hire_date >= '2005-01-01' and  salary between 1300 and 20000



-- SQL �񱳿����� --
1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.
select first_name, salary, department_id
from employees
where department_id in (80, 50) and salary >= 13000

2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 30000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, department_id, hire_date
from employees
where (salary between 1300 and 30000) and hire_date >= '2005-01-01'


3. 2005�⵵ �Ի��� ������ ������ ����Ͻÿ�.
--
select * 
from employees 
where to_char(hire_date, 'yyyy') = 2005


4. �̸��� D�� �����ϴ� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

select first_name, salary, hire_date
from employees
where first_name like 'D%'

5. 12���� �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
--
select first_name, salary, hire_date
from employees
where to_char(hire_date, 'mm') = 12

6. �̸��� le �� �� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where first_name like '%le%'


7. �̸��� m���� ������ ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where first_name like '%m'


8. �̸��� ����° ���ڰ� r�� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where first_name like '__r%'


9. Ŀ�̼��� �޴� ������ �̸�, Ŀ�̼�, �޿��� ��ȸ�Ͻÿ�.
select first_name, commission_pct, salary
from employees
where commission_pct is not null


10. Ŀ�̼��� ���� �ʴ� ������ �̸�, Ŀ�̼�, �޿��� ��ȸ�Ͻÿ�.
select first_name, commission_pct, salary
from employees
where commission_pct is  null



11. 2009��뿡 �Ի��ؼ� 30, 50, 80 �� �μ��� ���������鼭, 
�޿��� 5000 �̻� 17000 ���ϸ� �޴� ������ ��ȸ�Ͻÿ�. 
��, Ŀ�̼��� ���� �ʴ� �������� �˻� ��󿡼� ���ܽ�Ű��, ���� �Ի��� ������ 
���� ��µǾ�� �ϸ� �Ի����� ���� ��� �޿��� ���� ������ ���� ��µǷ� �Ͻÿ�.

select * from employees
where (to_char(hire_date, 'yyyy') between '2000' and '2999' )  and
      ( department_id in (30, 50, 80)) and (salary between 5000 and 17000) 
      and (commission_pct is not null) 
order by hire_date asc




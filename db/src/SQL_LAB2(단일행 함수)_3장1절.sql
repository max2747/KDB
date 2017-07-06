========================================
		������ �Լ�
========================================
select * from tab;
select * from countries;
select * from employees;
select * from departments;

1. �̸��� 'adam' �� ������ �޿��� �Ի����� ��ȸ�Ͻÿ�.

select first_name, salary, hire_date
from employees
where first_name = initcap('adam')


2. ���� ���� 'united states of america' �� ������ ���� �ڵ带 ��ȸ�Ͻÿ�.
select region_id
from countries
where country_name = initcap('united ') || initcap('states ') || 'of ' ||initcap('america')

3. 'Adam�� �Ի����� 95/11/02 �̰�, �޿��� 7000 �Դϴ�.' �̷� ������ ����
������ ��ȸ�Ͻÿ�.

select first_name ||'�� �Ի����� '|| ' ' || hire_date ||'�̰�, �޿��� ' || salary || ' �Դϴ�.' "���"
from employees
where first_name = 'Adam'



4. �̸��� 5���� ������ �������� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where length(first_name) <= 5



5.2006�⵵�� �Ի��� ������ �̸�, �Ի����� ��ȸ�Ͻÿ�.
select  first_name, hire_date
from employees
where to_char(hire_date, 'yyyy') = 2006





6. 7�� �̻� ��� �ټ��� �������� �̸�, �Ի���, �޿�, �ٹ������� ��ȸ�Ͻÿ�.
select first_name, hire_date, salary, months_between(sysdate, hire_date)/12 �ٹ�����, sysdate, hire_date
from employees
where months_between(sysdate, hire_date)/12 > 10
order by �ٹ�����

=============Group �Լ�==================


7. �� �μ��� �ο����� ��ȸ�ϵ� �ο����� 5�� �̻��� �μ��� ��µǵ��� �Ͻÿ�.
select department_name, A.department_id
from employees A ,departments B
where A.department_id = B.department_id
group by department_name, A.department_id
having count(*) >= 5
order by 2 

8. �� �μ��� �ִ�޿��� �ּұ޿��� ��ȸ�Ͻÿ�.
   ��, �ִ�޿��� �ּұ޿��� ���� �μ��� ������ �Ѹ��� ���ɼ��� ���⶧���� 
   ��ȸ������� ���ܽ�Ų��.

select department_name, max(salary), min(salary)
from departments A, employees B
where A.department_id = B.department_id
group by department_name
having max(salary) <> min(salary)
--having count(*) > 1


   
9. �μ��� 50, 80, 110 ���� ������ �߿��� �޿��� 5000 �̻� 24000 ���ϸ� �޴�
   �������� ������� �μ��� ��� �޿��� ��ȸ�Ͻÿ�.
   ��, ��ձ޿��� 8000 �̻��� �μ��� ��µǾ�� �ϸ�, ��°���� ��ձ޿��� ����
   �μ����� ��µǵ��� �ؾ� �Ѵ�.

select department_name, avg(salary)
from employees A, departments B
where A.department_id = B.department_id
  and A.department_id in (50, 80, 110) 
  and salary between 5000 and 24000
group by department_name
having avg(salary) >= 8000
order by 2 desc



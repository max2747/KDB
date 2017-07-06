-- SELF JOIN
1. ������ �̸��� ������ �̸��� ��ȸ�Ͻÿ�.
 select emp.first_name, manager.first_name
 from employees emp, employees manager
 where emp.manager_id = manager.employee_id--(+) --�̰� �߰��ϸ� steven�� �����ڰ� ����



2. ������ �̸��� ������ �̸��� ��ȸ�Ͻÿ�.
�����ڰ� ���� ���������� ��� ����Ͻÿ�.
 select emp.first_name, nvl(manager.first_name, '�Ŵ��� ����')
 from employees emp, employees manager
 where emp.manager_id = manager.employee_id(+)


3. ������ �̸��� �����ڰ� �����ϴ� ������ ���� ��ȸ�Ͻÿ�.
��, ������������ 3�� �̻��� �����ڸ� ��µǵ��� �Ͻÿ�.
 
select manager.first_name, count(*)
from employees emp, employees manager
where emp.manager_id = manager.employee_id
group by manager.first_name
having count(*) >= 3
order by 1

select m.first_name �Ŵ����̸�, count(emp.first_name) ������
from employees emp, employees m
where emp.manager_id = m.employee_id(+)
group by m.first_name
having count(emp.first_name) >= 3
order by 1
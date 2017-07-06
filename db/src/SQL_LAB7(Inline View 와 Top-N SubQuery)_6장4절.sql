==========================================
	Inline View �� Top-N SubQuery
==========================================

1. �޿��� ���� ���� �޴� ���� 5���� ���� ������ ��ȸ�Ͻÿ�.

--rownum�� oracle�� �����ϴ� select row����
--where���� rownum�� �̿�� �ݵ�� 1�� �����ؾ��Ѵ�.

select * from (select * from employees order by salary desc)
where rownum <= 6 



 -- 1. select�� sort
 -- 2. select�� row�����ο�
 -- 3. select�� Ư�� row�� select�ϱ� ����
select * 
from(
		select rownum rr, r, salary
		from (
			    select rownum r, salary
			    from employees
			    order by salary desc
			 )
	)
where rr = 5




2. Ŀ�̼��� ���� ���� �޴� ���� 3���� ���� ������ ��ȸ�Ͻÿ�.

select * from (select * from employees
			   --where commission_pct is not null
			   order by commission_pct desc nulls last)
where rownum <= 3



3. ���� �Ի��� ���� ��ȸ�ϵ�, �Ի��� ���� 5�� �̻��� ���� ����Ͻÿ�.

select to_char(hire_date, 'MM') ��, count(employee_id)
from employees
group by to_char(hire_date, 'MM')
having count(employee_id) >= 5



4. �⵵�� �Ի��� ���� ��ȸ�Ͻÿ�. 
��, �Ի��ڼ��� ���� �⵵���� ��µǵ��� �մϴ�.

select to_char(hire_date, 'YYYY') �⵵, count(employee_id)
from employees
group by to_char(hire_date, 'YYYY')
order by count(employee_id) desc




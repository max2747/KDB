--�������Լ�
--1.�����Լ�

select 1+2, round(123.4567, 2), -- �ݿø�
       trunc(123.453, 1), --ù°�ڸ� ���ķ� ������.
       ceil(123.123), --�ø� ����
       floor(123.3231) -- ����
from dual --����Ŭ�� �������̺�, ����� �ѹ��� ����.

--2. �����Լ�
select 'oracle programming', initcap('oracle programming') --ù��° ���ڸ� �빮�ڷ�
from dual

select 'ABCD', lower('ABCD')
from dual

select 'abcd', upper('abcd')
from dual

concat('sql', 'plus') -- sqlplus( ||�� ���� ���� ), 3�� �̻� �����Ҷ� concat�� �� ���ڷ� �־��ָ� ��. concat(concat('oracle', 'java'), '�����') -> oraclejava�����
substr('SQL*Plus', 5, 4) -- Plus; SQL*Plus���� 5��°���� �����ؼ� 4���� ���ڸ� ������
instr('SQL*Plus', '*') -- 4;SQL*Plus���� *�� ��ġ�� ��ȯ
lpad('sql', 5, '*') -- **sql ; ������ *�� pad�Ѵ�. �� ���̴� 5����
rpad('sql', 5, '*') -- sql** ; �������� *�� pad�Ѵ�. �� ���̴� 5��
ltrim('*sql', '*') -- sql; ���� ���� ���ڸ� ����
rtrim('sql*', '*') -- sql; ������ ���� ���ڸ� ����
length('fdsa') -- 4;���ڿ� ���̸� ��ȯ
lengthb('fdsadf') -- ���ڿ� ����Ʈ�� ��ȯ

select lengthb('������') from dual --9 ;�ѱ��� 1�ڰ� 3����Ʈ.(utf-8�� ���� ���� 1���ڸ� 3����Ʈ�� ó��)

select lpad('abcde', 3, '*') -- 'abcde'��� ���̰� 5�� ���ڿ��� �־���, ���ڷ� 3�� ������ 'abc'�� ���� �� ���� 3�� �����.
from dual

select substr('SQL*Plus', 10, 2) --NULL ; ���ڰ� ���ڿ� ���̸� �ʰ��ϸ� NULL�� ��ȯ�Ѵ�.
from dual

select instr('sqlfdsa', '0') from dual -- 0 ; ã���� �ϴ� ���ڰ� ������ 0�� ��ȯ�Ѵ�.

select ltrim('**sql**', '*') from dual -- sql** ; ���ʿ� �������ڰ� ������������ �׳� �� ������.
select rtrim('*sql*a', 'q') from dual -- �� ������ ���Ѵ��� ���ڷ� ���� ���ڸ� �����. ( �� �̿��� ���� ���ڿ��� �־ ������)

--3. ��¥ �Լ�
��¥ + ���� = ��¥
��¥ - ���� = ��¥
��¥ - ��¥ = �ϼ�
��¥ + ����/24 = ��¥

select sysdate + 240/24 , add_months(sysdate, 2) "2���� ��",
       next_day(sysdate, 'ȭ') "����ȭ����",
	   last_day('2016-02-01') "2016�� 2�� ��������",
	   to_char(sysdate, 'hh:mi:ss'), to_date('17-07-04', 'rr-mm-dd')
	   --to_char(salary, '9,999,999') ���ڸ� ���ڷ�
from dual --2017-07-14(10���� �߰���)

select hire_date �Ի��� , trunc(months_between(sysdate, hire_date)/ 12) ����
from employees

--4. ��ȯ�Լ�
select department_id, hire_date
from employees
where department_id = '80'


--�μ� id�� 10�̸� ���ߺ�, 20���̸� ������, 30���̸� �ѹ���
--�������� ��Ÿ ( decode ���� )
select department_id, decode(department_id, 10, '���ߺ�', 
                             20, '������', 
                             30, '�ѹ���', '��Ÿ')
from employees


-- 0~9999 -> A
-- 10000~20000 -> B
-- 20000 -> C
select department_id, salary, 
       decode(floor(salary/10000), 0, 'A',
                                   1, 'B',
                                   2, 'C'),
       case floor(salary/10000) when 0 then '������'
                                when 1 then '������'
                                when 2 then '�̸�����'
                                else '��Ÿ' end,
 	   case when salary >= 0 and salary <= 9999 then '������'
 	        when salary between 10000 and 19999 then '������'
 	             else '�̸�����' end
from employees



select * from jobs

--�Ŵ����̸� �ּұ޿��� 10%�� ������, �ƴϸ� ���� ������.
select job_title, min_salary, 
       decode( substr(job_title, -7, 7), 'Manager', min_salary*0.1, min_salary) "decode����",
       
       case when job_title like '%Manager' then min_salary*0.1
            else min_salary end "case����"
from jobs

select job_title 
from jobs
where job_title like '%Manager%'



---�׷��Լ�
select  department_id
  		count(*), count(salary), 
  		sum(salary), sum(salary)/count(salary), 
  		avg(salary)
from employees
group by cube(department_id)


select first_name, nvl(to_char(department_id), '�μ�����')  nullüũ,
--nvl�� ������ Ȯ���� �� ���̸� input������ �ٲ�
--���������� department_id�� ����, '�μ�����'�� �����̱� ������ ���ڷ� �����ؾ���
	   nvl2(department_id,  
	   	    to_char(department_id) , '�μ�����' )	nullüũ2
from employees



select avg(commission_pct) �޴»�����, --�޴»���鸸 ������ ����Ѵ�.
       avg(nvl(commission_pct, 0)) �������� --��� ������� ������.
from employees

--�μ��� �ִ�޿�, �ִ�޿��� 5000 �̻��� �μ��� ��ȸ ( �����Լ��� where������ ����� �� ���� )
select department_id, max(salary)
from employees
group by department_id
having max(salary) >= 10000
order by 2

 --�����Լ��� ������� ���� column�� ���������� �ݵ�� group by ������ ����ؾ� �Ѵ�.

--group by�� ������ ��ü �ϳ��� �ุ ��µ�.
--�׷� �Լ��� count(*) �����ϰ� �ΰ��� ���� �����.

-- join ����
--1. Equi Join
--primary key�� foreign key�� ������ �÷��� ����,
 ���� �÷��� ���� ���� ���� ������ ���� ������ ���̺��� �����.

 --�ؼ��� �ڿ������� �Ѵ�. �������̺��� ������ �ִ´�. �ڿ������� �ؼ��ϱ� ������ ũ�Ⱑ ������ �ڿ� ����.
  ����Ŭ
 select 
 from table1 t1, table2 t2
 where t1.�� = t2.��
 
---����(DB�������� ����)
 select *
 from  employees E, departments D
 where E.department_id = D.department_id
 --106���� �����µ� kimberely�� department_id�� ���� ������ 106���� ����.
 
 -- from departments D, employees E �̷��� ������ ��귮�� �þ��. 
 
 
 --outer join �̷����ϸ� 107�ǿ� ����. 
 select *
 from  employees E, departments D
 where E.department_id = D.department_id(+) --�������ִ��ʿ� (+) 
 
 
 ------ANSI ǥ�� , DB������ �ٲ���� �ϰ����� ����
 select first_name, salary, department_name, department_id
 from employees E inner join departments D
 using (department_id) --�̸��� ���� �÷��̸� join-using���� �������.
 
  select first_name, salary, department_name, E.department_id
 from employees E inner join departments D
 on(E.department_id = D.department_id) --on���� �̸��� �ٸ� Į���� join�� �� �ִ�.
 
 select first_name, salary, department_name, E.department_id
 from employees E left outer join departments D
 on (E.department_id = D.department_id) --�������� ��ġ��.
 
  
 select first_name, salary, department_name, E.department_id
 from employees E full outer join departments D
 on (E.department_id = D.department_id) --�������� ��ġ��.
 
 
 --����
 select first_name, e.job_id, job_title, max_salary 
 from employees e, jobs j
 where e.job_id = j.job_id
 
 select first_name, job_id, job_title, max_salary 
 from employees inner join jobs 
 using (job_id)
 
  select first_name, e.job_id, job_title, max_salary 
 from employees e inner join jobs j
on (e.job_id = j.job_id)
 
 
 select * from employees

 2. Non- Equi Join
 -- �񱳿����ڰ� �ƴ϶� �ٸ� ������ ���� ���� ������ ����� ������
  
select
from
where table1.column(+) = table2.column(+)

3. self join
�ڱ� �ڽ��� ���̺�� ���� / 




select ename, sal, grade
from emp, salgrade
where sal between losal and hisal


select ename, sal, grade
from emp join salgrade
on sal between losal and hisal



select E.employee_id, E.first_name, M.employee_id, M.first_name
from employees M, employees E
where E.manager_id = M.employee_id(+) --(+)�̰� ������ �Ŵ��� ��� ���� = 107����
order by 1
--manager�� ���� steven�� �����ؼ� �� 106������ ���´�.

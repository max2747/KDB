========================================
		JOIN
========================================
select * from tab;
select * from employees
select * from jobs;
select * from regions;

1.�������� �̸��� ���޸�(job_title)�� ��ȸ�Ͻÿ�.
select first_name, job_title
from employees A, jobs B
where A.job_id = B.job_id;

--ANSI ǥ��
select first_name, job_title
from employees A inner join jobs B
using(job_id)

select first_name, job_title
from employees A inner join jobs B
on A.job_id = B.job_id


2.�μ��̸��� �μ��� ���� ���ø�(city)�� ��ȸ�Ͻÿ�.

select department_name, city
from departments A, locations B
where A.location_id = B.location_id

--ANSI ǥ��
select department_name, city
from departments A inner join locations B
using(location_id)

select department_name, city
from departments A inner join locations B
on A.location_id = B.location_id



3. ������ �̸��� �ٹ��������� ��ȸ�Ͻÿ�. (employees, departments, locations,countries)
 select first_name, country_name
 from (
         select first_name,  location_id
         from employees E, DEPARTMENTS D
         where E.department_id = D.department_id(+)
      ) A ,
      (
        select location_id, country_name
        from locations L, countries C
        where L.country_id = C.country_id(+)
      ) B
 where A.location_id = B.location_id(+)

 
 select first_name, country_name
 from employees E, departments D, locations L, countries C
 where E.department_id = D.department_id(+) and D.location_id = L.location_id(+) and
       L.country_id = C.country_id(+)

       
 select first_name, country_name
 from employees E left outer join
       

 select first_name, country_name
 from employees e, departments d, locations lo, countries c
 where e.department_id = d.department_id and d.location_id = lo.location_id and lo.country_id = c.country_id
 
 

4. ��å(job_title)�� 'manager' �� ����� �̸�, ��å, �μ����� ��ȸ�Ͻÿ�.
--employees, jobs, departments
 select first_name, job_title, department_name
 from (
        select first_name, job_title, department_id
        from employees E, jobs J
        where E.job_id = J.job_id
      ) A , departments D
 where A.department_id = D.department_id and 
       job_title like '%Manager'
      
       
select first_name, job_title, department_name
from employees E, jobs J, departments D
where E.job_id = J.job_id and E.department_id = D.department_id
      and job_title like '%'||initcap('manager')

      
select count(job_id)
from jobs
where job_title like '%Manager'

select * from employees where 

5. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
select first_name, hire_date, department_name
from employees E, departments D
where E.department_id = D.department_id


6. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.
select first_name, hire_date, nvl(department_name, '�μ�����') "�μ�����"
from employees E , departments D
where E.department_id = D.department_id(+)

select first_name, hire_date, department_name
from employees E left outer join departments D
using(department_id)

select first_name, hire_date, department_name
from employees E full outer join departments D
using(department_id)

7. ������ �̸��� ��å(job_title)�� ����Ͻÿ�.
��, ������ �ʴ� ��å�� �ִٸ� �� ��å������ ��°���� ���Խ�Ű�ÿ�.

select first_name, job_title
from employees E, jobs J
where E.job_id(+) = J.job_id

select first_name, job_title
from employees E right outer join jobs J
using(job_id)

insert into jobs values('play', '���', 200, 500)


select first_name, job_title
from employees E full outer join  jobs J
on (E.job_id = J.job_id)

select * from jobs

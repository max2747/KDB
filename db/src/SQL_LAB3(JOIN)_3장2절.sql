========================================
		JOIN
========================================
select * from tab;
select * from employees
select * from jobs;
select * from regions;

1.직원들의 이름과 직급명(job_title)을 조회하시오.
select first_name, job_title
from employees A, jobs B
where A.job_id = B.job_id;

--ANSI 표준
select first_name, job_title
from employees A inner join jobs B
using(job_id)

select first_name, job_title
from employees A inner join jobs B
on A.job_id = B.job_id


2.부서이름과 부서가 속한 도시명(city)을 조회하시오.

select department_name, city
from departments A, locations B
where A.location_id = B.location_id

--ANSI 표준
select department_name, city
from departments A inner join locations B
using(location_id)

select department_name, city
from departments A inner join locations B
on A.location_id = B.location_id



3. 직원의 이름과 근무국가명을 조회하시오. (employees, departments, locations,countries)
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
 
 

4. 직책(job_title)이 'manager' 인 사람의 이름, 직책, 부서명을 조회하시오.
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

5. 직원들의 이름, 입사일, 부서명을 조회하시오.
select first_name, hire_date, department_name
from employees E, departments D
where E.department_id = D.department_id


6. 직원들의 이름, 입사일, 부서명을 조회하시오.
단, 부서가 없는 직원이 있다면 그 직원정보도 출력결과에 포함시킨다.
select first_name, hire_date, nvl(department_name, '부서없음') "부서정보"
from employees E , departments D
where E.department_id = D.department_id(+)

select first_name, hire_date, department_name
from employees E left outer join departments D
using(department_id)

select first_name, hire_date, department_name
from employees E full outer join departments D
using(department_id)

7. 직원의 이름과 직책(job_title)을 출력하시오.
단, 사용되지 않는 직책이 있다면 그 직책정보도 출력결과에 포함시키시오.

select first_name, job_title
from employees E, jobs J
where E.job_id(+) = J.job_id

select first_name, job_title
from employees E right outer join jobs J
using(job_id)

insert into jobs values('play', '놀기', 200, 500)


select first_name, job_title
from employees E full outer join  jobs J
on (E.job_id = J.job_id)

select * from jobs

-- SELF JOIN
1. 직원의 이름과 관리자 이름을 조회하시오.
 select emp.first_name, manager.first_name
 from employees emp, employees manager
 where emp.manager_id = manager.employee_id--(+) --이거 추가하면 steven은 관리자가 없음



2. 직원의 이름과 관리자 이름을 조회하시오.
관리자가 없는 직원정보도 모두 출력하시오.
 select emp.first_name, nvl(manager.first_name, '매니저 없음')
 from employees emp, employees manager
 where emp.manager_id = manager.employee_id(+)


3. 관리자 이름과 관리자가 관리하는 직원의 수를 조회하시오.
단, 관리직원수가 3명 이상인 관리자만 출력되도록 하시오.
 
select manager.first_name, count(*)
from employees emp, employees manager
where emp.manager_id = manager.employee_id
group by manager.first_name
having count(*) >= 3
order by 1

select m.first_name 매니저이름, count(emp.first_name) 직원수
from employees emp, employees m
where emp.manager_id = m.employee_id(+)
group by m.first_name
having count(emp.first_name) >= 3
order by 1
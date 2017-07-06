conn hr/hr

명령을 이용하여 hr 계정에 접속하여 다음 문제의 사항을 select 문장으로 처리하여 제출하세요.

1. 각 부서(department_id)별로 최고 연봉(salary)를 받는 사원의 사번(employee_id), 
성(last_name)과 연봉(salary)을 조회하시오. 단 조회결과는 연봉의 내림차순으로 정렬되어 
나타나야 합니다.
select e.department_id, e.employee_id, e.last_name, e.salary
from employees e, ( select department_id, max(salary) maxSalary
				  	from employees
				  	group by department_id
  				  ) A
where e.department_id = A.department_id and e.salary = A.maxSalary
order by 4 desc

=========================================                                           

2. 각 업무(job) 별로 연봉(salary)의 총합을 구하고자 한다. 
연봉 총합이 가장 높은 업무부터 업무명(job_title)과 연봉 총합을 조회하시오.
select job_title, sum(salary)
from employees e, jobs j
where e.job_id = j.job_id
group by job_title
order by 2 desc


====================================

3. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 
매니저(manager)의 이름(first_name)을 조회하시오.
select A.employee_id, A.first_name, A.department_name, manager.first_name
from employees manager, ( select department_id, department_name, B.manager_id, first_name, employee_id
						  from employees B left outer join departments
						  using(department_id)
 									  ) A
where A.manager_id = manager.employee_id(+) --null추가
====================================


4. 자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과 채용일(hire_date)을 
조회하라.단 날짜 포맷과 ALIAS를 적용한다.

사번  성  채용일(2010년12월3일)
====================================

select employee_id, last_name, to_char(hire_date, 'YYYY년MM월HH일') 채용일
from employees A
where hire_date < (
					select distinct  manager.hire_date
					from employees emp, employees manager
					where emp.manager_id = manager.employee_id 
					and manager.employee_id = A.manager.id
				  )

매니저 채용일
select manager.hire_date
from employees emp, employees manager
where emp.manager_id = manager.employee_id


5. 자신의 부서 평균 급여보다 연봉이 많은 사원의 사번(employee_id), 성(last_name)과 연봉(salary)을 조회하라.

=====================================

select employee_id, last_name, salary
from employees e, (select department_id, avg(salary) avgsal from employees group by department_id) A 
where e.department_id = A.department_id and salary > avgsal


6. 직종(JOB)별 최고 급여를 급여가 많은 직종부터 출력하시오. 
단, 직원이 2명 이상인 직종만 조회한다. 
select job_title, max(salary)
from employees e join jobs j
using(job_id)
group by job_title
having count(*) >= 2
order by 2 desc




=========================================

7. 각 도시(city)에 있는 모든 부서 직원들의 평균급여를 조회하고자 한다. 
평균급여가 가장 높은 도시부터 도시명(city)과 평균연봉을 출력하시오. 
단, 도시에 근무하는 직원이 10명 이하인 곳은 제외하고 조회한다.

select city, avg(salary)
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
group by city
having count(*) > 10
order by 2 desc





===================================

8. 사번(empno)이 7934인 사원보다 연봉(sal)이 높고 직종(job)이 SALESMAN인 
사원의 사번과 이름과 연봉을 조회한다. 
단, 연봉이 낮은 순서로 출력한다. 


select empno, ename, sal
from emp e join dept d
using(deptno)
where sal > ( 
				select sal from emp where empno = '7934'
			)
and dname = 'SALES'
order by 3


=====================================

9. 연봉등급(GRADE)이 4등급인 사원들의 사원번호(EMPNO), 사원명(ENAME), 연봉(SAL), 연봉등급(GRADE)을 조회한다. 
연봉이 낮은 순서로 정렬하고, 연봉이 같은 경우에는 사원번호가 낮은 순서로 정렬한다.

select empno, ename, sal, g.grade--, grade
from emp e, salgrade g
where  e.sal >= (select losal from salgrade where grade = 4)
and e.sal <= (select hisal from salgrade where grade = 4)
order by 3



select * from salgrade




===================================

10. 자신의 매니저(MGR)와 동일한 부서에 근무하는 사원들의 사원번호(EMPNO), 사원명(ENAME), 부서번호(DEPTNO)를 조회한다. 
단, 사원번호가 낮은 순서로 정렬한다.

========================================

11. 부서지역명(LOC)이 "DALLAS"인 부서에 근무하면서 직종(JOB)이 "CLERK"인 사원들의 사원번호, 이름, 연봉을 조회한다. 
단, 사원번호가 낮은 순서로 정렬한다.

=======================================

12. 부서지역명(LOC)이 'DALLAS' 또는 'CHICAGO'인 부서에 근무하면서 연봉이 1400이상인 사원들의 연봉(SAL) 평균을 
조회한다.





========================================================================
1.
사원(EMPLOYEES) 들의 입사일과 관리자의 이름을 조회하는 문제입니다. 
1995년 01월 01일 이전에 입사한(hire_date) 직원들의 사번(employee_id), 이름(first_name), 
성(last_name)과 입사일(hire_date)과 직원의 관리자의 이름(first_name) 을 조회하여 출력하십시오. 
이때, 관리자가 없는 직원의 경우, 관리자의 이름에 '-' 로 보여줍니다. 
출력시 입사일로 오름차순 정렬하여 출력하고, 컬럼명은 아래 결과와 동일하게 작성하십시오.

사번   이름   성   입사일   관리자이름



======================================
2.
각 직책 별(job_title)로 급여의 총합을 구하되 직책이 Manager 인 사람은 제외하십시오. 
단, 급여 총합이 1000 만원 이상인 직책만 나타내며, 급여 총합에 대한 오름차순으로 정렬하십시오. 
출력 결과의 컬럼명은 아래 결과와 동일하게 주십시오.

직책         급여총합

=======================================

========================================
		SubQuery
========================================
1. 'IT'부서에서 근무하는 직원들의 이름, 급여, 입사일을 조회하시오.

select first_name, salary, hire_date
from (
		select first_name, salary, hire_date, department_name
		from departments D, employees E
		where D.department_id = E.department_id
) A
where A.department_name = 'IT'


select first_name, salary, hire_date
from employees join departments
using(department_id)
where department_name = 'IT'



2. 'Alexander' 와 같은 부서에서 근무하는 직원의 이름과 부서id를 조회하시오.
						
 select first_name, department_id
 from employees
 where department_id in (select department_id 
 						   from employees 
 						   where first_name ='Alexander')
 
 						   
 select * from employees where first_name ='Alexander'
 

3. 80번부서의 평균급여보다 많은 급여를 받는 직원의 이름, 부서id, 급여를 조회하시오.
select first_name, department_id, salary
from employees E
where salary > ( select sum(salary) / count(*)
				 from employees
				 where department_id = '80'
				)				
order by 3 asc

---서브쿼리의 결과 모두보다 크다
select * from employees where salary > ALL (5000, 10000)

4. 'South San Francisco'에 근무하는 직원의 최소급여보다 급여를 많이 받으면서 
50 번부서의 평균급여보다 많은 급여를 받는 직원의 이름, 급여, 부서명, 
부서id를 조회하시오.
 -- Texas로 해봄
select first_name, salary, department_name, department_id
from (
       select first_name,salary, department_name, department_id, location_id
       from employees E, departments D
       where E.department_id = D.department_id
     ) A, locations L
where A.location_id = L.location_id 
     and 

select min(salary)
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
and l.state_province = 'Texas'

select avg(salary)
from employees e
where department_id = 50


select first_name, salary, department_name, e.department_id, (
select min(salary)
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
and l.city = 'South San Francisco'

		) "샌프 최저",
(select avg(salary)
from employees e
where department_id = 50) "50번 평균급여"		
		
from employees e, departments d
where e.department_id = d.department_id and
 e.salary > ( 
select min(salary)
from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id
and l.city = 'South San Francisco')

and salary > (
select avg(salary)
from employees e
where department_id = 50)

select * From locations
     
-------------------scott/tiger (emp, dept)

1. BLAKE와 동일한 부서에 속한 모든 사원의 이름및 입사일을 표시하는 질의를 작성하시오.
결과에서 BLAKE는 제외시킵니다.
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE') 
      and ename !='BLAKE'
 

      
      

2. 부서의 위치가 DALLAS인 모든 사원의 이름, 부서번호 , 직무를 표시하시오 
select ename, e.deptno, job
from emp e, dept d
where d.deptno = e.deptno and d.loc='DALLAS'

select * from emp


3. KING에게 보고하는 모든 사원의 이름과 급여를 표시하는 질의를 작성하시오 

select e2.ename, e2.sal, e2.mgr
from emp e1, emp e2
where e1.ename = 'KING'and e1.empno = e2.mgr

select *
from emp
where mgr = (select empno from emp where ename='KING')

select * from emp
 
se













 

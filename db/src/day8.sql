
--subquery
--'Steven King'과 같은 부서의 직원들을 소개

select * from employees
where department_id = (
select department_id from employees
where first_name = 'Steven' and last_name = 'King'

)

select * from employees
where department_id = any (
select department_id from employees
where first_name = 'Steven'

)
-- in은 =any랑 같다. (다중행 처리 가능)

--급여가 가장 많은 사람의 이름과 급여와 입사일
select first_name, salary, hire_date
from employees
where salary = (select max(salary) from employees)

--평균 급여보다 적은 급여를 받는 직원을 조회

select first_name, salary
from employees
where salary <= (select sum(salary) / count(*) from employees)

select sum(salary) / count(*) from employees
select avg(salary) from employees

--자신이 속한 부서의 평균보다 적은 급여를 받는 직원

select *
from (
		select department_id, avg(salary) avgSalary
		from EMPLOYEES
		group by department_id
	 ) A, employees e
where e.department_id = A.department_id and e.salary < A.avgSalary





--다중컬럼 subquery
--자신이 속한 부서의 최대 급여를 받는 직원 정보 조회
select *
from employees A
where (department_id, salary ) = (
					select department_id, max(salary)
					from employees
					where department_id = A.department_id
					group by department_id
				)

select * from departments



---------------------------

(select * from emp where to_char(hiredate, 'YYYY') = 1981 )
union 
(select * from emp where deptno = 10)

select * from emp union all select from dept

----컬럼의 개수와 타입을 맞춰줘야한다. 따라서 sal을 맞춰주기 위해 dept에 0을, 
--emp의 hiredate를 맞추기 위해 dept에 null을 추가해줌.
(select ename, sal, hiredate, ''
from emp)
union 
(select dname,0, null, loc
from dept)


insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(3, '정진', 'CLERK2', 7900, sysdate, 5000, 5, 30)

select * from 

--emp를 전부 긁어서 emp2로 긁어옴
select table emp2
as select * from emp


--where문에 false인 값을 넣어 데이터를 복사하지 않고 구조만 복사한다.
create table emp2
as select * from emp
where 0 = 1

select * from emp2

insert into emp2
 select * from emp where deptno = 10

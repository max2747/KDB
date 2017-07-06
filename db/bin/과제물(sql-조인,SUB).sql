desc 테이블명;
명령으로 테이블 구조 확인하세요.

======================================
1.
모든 부서의 이름과 위치코드 및 각 부서에서 근무하는 사원 수를 표시하는 쿼리문을 작성하십시오. 
단, 사원이 없는 부서도 함께 표시하십시오.

select location_id, department_id, countEmp
from (
select department_id, count(employee_id) countEmp
from employees
group by department_id ) A right outer join departments d
using(department_id)




=====================================
2.
평균 급여가 가장 높은 부서의 부서 코드 및 해당 부서의 최저 급여를 표시하는 쿼리문을 작성하십시오

select e.department_id, min(salary)
from employees e,( select * from(
				select department_id, avg(salary) kk
				from employees
				group by department_id
				order by 2 desc
				) where rownum <= 1) A
where e.department_id = A.department_id
group by e.department_id



=====================================
3.
성이 'De Haan' 사원의 관리자 사원번호, 성(last_name), 입사일 및 급여를 표시하는 SQL문을 작성하십시오.

select employee_id, last_name, hire_date, salary
from employees
where last_name = 'De Haan'


=====================================
4.
국가 명이 United States of America에서 근무하는 직원의 이름 중에서 연봉이 9000이상인 직원들의 이름, 연봉, 도시명을 조회하시오.

select emp.first_name, emp.salary, A.city
from (
	   select first_name, city
	   from employees e, departments d, locations l, countries c
	   where e.department_id = d.department_id and d.location_id = l.location_id 
	   and l.country_id = c.country_id and c.country_name ='United States of America'
 	) A, employees emp
where emp.first_name = A.first_name and salary >= 9000




======================================
5.  
부서이름별 직원의 인원수와 최대, 최소, 평균급여를 조회하시오.
단, 최대, 최소 급여가 같은 부서는 출력결과에서 제외한다. 그리고 평균는 소수점 2자리까지만 출력되도록 반올림한다. 

select department_name, count(employee_id), max(salary), min(salary), round(avg(salary), 2) "평균급여"
from employees e, departments d
where e.department_id = d.department_id
group by department_name
having max(salary) != min(salary)



======================================
6.
연봉이 10000 이상인 직원들의 부서명, 이름, 급여, 자신이 속한 부서의 평균급여를 조회하시오.
단, 자신이 속한 부서의 평균급여는 소수점 둘째 자리까지만 출력되도록 반올림한다. 



======================================  
7. 
이름이 'Sigal'이라는 직원의 이름과 급여, 자신이 속한 부서의 평균급여로 수정한 급여를 조회하는 문장을 작성하시오.
alias를 적용합니다.

=======================================
8.
근무 국가가 영국(United Kingdom)과 캐나다(Canada)인 직원들을 대상으로 급여가 12000 이상인 직원의 이름, 급여, 근무부서, 국가명을 출력하시오.


========================================
9.
job_title 명에 "Manager"라는 문자열이 포함된 job을 가진 직원들의 평균 연봉을 job_title 별로 평균연봉을 출력한다.

=======================================
10.
자신이 속한 팀의 평균연봉보다 많은 연봉을 받는 사원의 아이디, 부서아이디, 연봉, 팀의 평균연봉을 검색하십시오.


=======================================
11.
전체 사원의 평균급여와의 자신의 급여의 차이가 1000 이하인 급여를 받는 사원의 목록을 출력하시오.
예를들어 평균급여가 5000 일 경우 4000~6000 (4000과 6000 포함 그 사이) 사이의 급여를 받는 사원이 출력 대상이 됩니다.

     
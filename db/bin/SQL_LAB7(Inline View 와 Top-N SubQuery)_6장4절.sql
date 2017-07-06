==========================================
	Inline View 와 Top-N SubQuery
==========================================

1. 급여를 가장 많이 받는 상위 5명의 직원 정보를 조회하시오.

--rownum은 oracle이 제공하는 select row순서
--where에서 rownum을 이용시 반드시 1을 포함해야한다.

select * from (select * from employees order by salary desc)
where rownum <= 6 



 -- 1. select는 sort
 -- 2. select는 row순서부여
 -- 3. select는 특정 row를 select하기 위해
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




2. 커미션을 가장 많이 받는 상위 3명의 직원 정보를 조회하시오.

select * from (select * from employees
			   --where commission_pct is not null
			   order by commission_pct desc nulls last)
where rownum <= 3



3. 월별 입사자 수를 조회하되, 입사자 수가 5명 이상인 월만 출력하시오.

select to_char(hire_date, 'MM') 월, count(employee_id)
from employees
group by to_char(hire_date, 'MM')
having count(employee_id) >= 5



4. 년도별 입사자 수를 조회하시오. 
단, 입사자수가 많은 년도부터 출력되도록 합니다.

select to_char(hire_date, 'YYYY') 년도, count(employee_id)
from employees
group by to_char(hire_date, 'YYYY')
order by count(employee_id) desc




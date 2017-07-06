--단일행함수
--1.숫자함수

select 1+2, round(123.4567, 2), -- 반올림
       trunc(123.453, 1), --첫째자리 이후로 버린다.
       ceil(123.123), --올림 연산
       floor(123.3231) -- 버림
from dual --오라클의 더미테이블, 결과가 한번만 나옴.

--2. 문자함수
select 'oracle programming', initcap('oracle programming') --첫번째 문자만 대문자로
from dual

select 'ABCD', lower('ABCD')
from dual

select 'abcd', upper('abcd')
from dual

concat('sql', 'plus') -- sqlplus( ||와 같은 역할 ), 3개 이상 연결할때 concat을 또 인자로 넣어주면 됨. concat(concat('oracle', 'java'), '진흥원') -> oraclejava진흥원
substr('SQL*Plus', 5, 4) -- Plus; SQL*Plus에서 5번째에서 시작해서 4개의 문자를 가져옴
instr('SQL*Plus', '*') -- 4;SQL*Plus에서 *의 위치를 반환
lpad('sql', 5, '*') -- **sql ; 왼쪽을 *로 pad한다. 총 길이는 5개로
rpad('sql', 5, '*') -- sql** ; 오른쪽을 *로 pad한다. 총 길이는 5개
ltrim('*sql', '*') -- sql; 왼쪽 지정 문자를 삭제
rtrim('sql*', '*') -- sql; 오른쪽 지정 문자를 삭제
length('fdsa') -- 4;문자열 길이를 반환
lengthb('fdsadf') -- 문자열 바이트를 반환

select lengthb('가가가') from dual --9 ;한글은 1자가 3바이트.(utf-8은 세계 문자 1글자를 3바이트로 처리)

select lpad('abcde', 3, '*') -- 'abcde'라는 길이가 5인 문자열을 넣었고, 인자로 3을 넣으니 'abc'와 같이 총 길이 3을 출력함.
from dual

select substr('SQL*Plus', 10, 2) --NULL ; 인자가 문자열 길이를 초과하면 NULL을 반환한다.
from dual

select instr('sqlfdsa', '0') from dual -- 0 ; 찾고자 하는 문자가 없으면 0을 반환한다.

select ltrim('**sql**', '*') from dual -- sql** ; 왼쪽에 같은문자가 여러개나오면 그냥 다 삭제함.
select rtrim('*sql*a', 'q') from dual -- 맨 끝에만 비교한다음 인자로 넣은 문자만 지운다. ( 그 이외의 값은 문자열에 있어도 안지움)

--3. 날짜 함수
날짜 + 숫자 = 날짜
날짜 - 숫자 = 날짜
날짜 - 날짜 = 일수
날짜 + 숫자/24 = 날짜

select sysdate + 240/24 , add_months(sysdate, 2) "2개월 후",
       next_day(sysdate, '화') "다음화요일",
	   last_day('2016-02-01') "2016년 2월 마지막일",
	   to_char(sysdate, 'hh:mi:ss'), to_date('17-07-04', 'rr-mm-dd')
	   --to_char(salary, '9,999,999') 숫자를 문자로
from dual --2017-07-14(10일이 추가됨)

select hire_date 입사일 , trunc(months_between(sysdate, hire_date)/ 12) 년차
from employees

--4. 변환함수
select department_id, hire_date
from employees
where department_id = '80'


--부서 id가 10이면 개발부, 20번이면 영업부, 30번이면 총무부
--나머지는 기타 ( decode 예제 )
select department_id, decode(department_id, 10, '개발부', 
                             20, '영업부', 
                             30, '총무부', '기타')
from employees


-- 0~9999 -> A
-- 10000~20000 -> B
-- 20000 -> C
select department_id, salary, 
       decode(floor(salary/10000), 0, 'A',
                                   1, 'B',
                                   2, 'C'),
       case floor(salary/10000) when 0 then '만이하'
                                when 1 then '만원대'
                                when 2 then '이만원대'
                                else '기타' end,
 	   case when salary >= 0 and salary <= 9999 then '만이하'
 	        when salary between 10000 and 19999 then '만원대'
 	             else '이만원대' end
from employees



select * from jobs

--매니저이면 최소급여의 10%만 가져옴, 아니면 전부 가져옴.
select job_title, min_salary, 
       decode( substr(job_title, -7, 7), 'Manager', min_salary*0.1, min_salary) "decode예제",
       
       case when job_title like '%Manager' then min_salary*0.1
            else min_salary end "case예제"
from jobs

select job_title 
from jobs
where job_title like '%Manager%'



---그룹함수
select  department_id
  		count(*), count(salary), 
  		sum(salary), sum(salary)/count(salary), 
  		avg(salary)
from employees
group by cube(department_id)


select first_name, nvl(to_char(department_id), '부서없음')  null체크,
--nvl은 널인지 확인한 후 널이면 input값으로 바꿈
--주의할점은 department_id는 숫자, '부서없음'은 문자이기 때문에 문자로 통일해야함
	   nvl2(department_id,  
	   	    to_char(department_id) , '부서없음' )	null체크2
from employees



select avg(commission_pct) 받는사람평균, --받는사람들만 나눠서 계산한다.
       avg(nvl(commission_pct, 0)) 모든사람평균 --모든 사람으로 나눈다.
from employees

--부서별 최대급여, 최대급여가 5000 이상인 부서만 조회 ( 집계함수는 where절에서 사용할 수 없다 )
select department_id, max(salary)
from employees
group by department_id
having max(salary) >= 10000
order by 2

 --집계함수를 사용하지 않은 column이 보여지려면 반드시 group by 문법을 사용해야 한다.

--group by가 없으면 전체 하나의 행만 출력됨.
--그룹 함수는 count(*) 제외하고 널값을 뺴고 계산함.

-- join 유형
--1. Equi Join
--primary key와 foreign key로 지정된 컬럼을 조인,
 공통 컬럼을 비교해 같은 값을 가지는 행을 연결해 테이블을 만든다.

 --해석은 뒤에서부터 한다. 메인테이블을 앞으로 넣는다. 뒤에서부터 해석하기 떄문에 크기가 작은걸 뒤에 놓자.
  오라클
 select 
 from table1 t1, table2 t2
 where t1.행 = t2.행
 
---조인(DB벤더들의 문법)
 select *
 from  employees E, departments D
 where E.department_id = D.department_id
 --106건이 나오는데 kimberely가 department_id가 없기 때문에 106건이 나옴.
 
 -- from departments D, employees E 이렇게 넣으면 계산량이 늘어난다. 
 
 
 --outer join 이렇게하면 107건에 나옴. 
 select *
 from  employees E, departments D
 where E.department_id = D.department_id(+) --보충해주는쪽에 (+) 
 
 
 ------ANSI 표준 , DB벤더가 바뀌더라도 일관성이 유지
 select first_name, salary, department_name, department_id
 from employees E inner join departments D
 using (department_id) --이름이 같은 컬럼이면 join-using문을 사용하자.
 
  select first_name, salary, department_name, E.department_id
 from employees E inner join departments D
 on(E.department_id = D.department_id) --on으로 이름이 다른 칼럼을 join할 수 있다.
 
 select first_name, salary, department_name, E.department_id
 from employees E left outer join departments D
 on (E.department_id = D.department_id) --왼쪽으로 합치자.
 
  
 select first_name, salary, department_name, E.department_id
 from employees E full outer join departments D
 on (E.department_id = D.department_id) --왼쪽으로 합치자.
 
 
 --예제
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
 -- 비교연산자가 아니라 다른 연산을 통해 행을 연결해 결과를 생성함
  
select
from
where table1.column(+) = table2.column(+)

3. self join
자기 자신의 테이블과 조인 / 




select ename, sal, grade
from emp, salgrade
where sal between losal and hisal


select ename, sal, grade
from emp join salgrade
on sal between losal and hisal



select E.employee_id, E.first_name, M.employee_id, M.first_name
from employees M, employees E
where E.manager_id = M.employee_id(+) --(+)이거 넣으면 매니저 없어도 나옴 = 107가지
order by 1
--manager가 없는 steven은 제외해서 총 106가지가 나온다.

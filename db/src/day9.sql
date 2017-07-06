

drop table member;
create table member(
	user_id number(3) constraint member_pk primary key,
	user_name varchar2(10) not null,
	user_addr varchar2(100),
	user_email varchar2(20) constraint email_unique unique,
	user_major number(3) not null constraint member_major_fk references dept(deptno),
	age number constraint member_age_chk check(age between 20 and 40),
	gender char(1) constraint member_gender_chk check(gender in ('M', 'F'))
);

create table asdf (
	user_id number(3) constraint member_pk primary key,
	user_name varchar2(10) not null,
	user_major varchar2(14) references dept(dname)
)
--constraint table이름_칼럼이름_제약조건내용
--foreign key는 null을 허용.
--not null, primary key, foreign key, unique, check
insert into member values(1, 'abcde', '서울시 중구','aa@naver.com', 20, 40, 'M');

insert into member(user_id, user_name) values(2, 'tt');

insert into member(user_id, user_name, user_email) values(3, 'abcd', 'fdsa@naver.com');

select * from member;


drop table member

select * from emp where ename ='fdsa'; drop table member;
select * from tab;



--주문상세 table

create table order_detail(
	orderno number, --pk
	seq number, --pk
	goods_name varchar2(100),
	cnt number,
	constraint order_detail_pk primary key(orderno, seq)
)
insert into order_detail values(123, 1, '노트북', 2);
insert into order_detail values(123, 2, '노트북', 2);
insert into order_detail values(123, 3, '노트북', 2);

select * from order_detail






--권한, 보안 문제로 table의 일부만 보여줌. view를 보여주고 table을 감춘다.
-- 자주 사용되는 select문을 저장함으로써 query문을 간단하게 한다.
--view는 가상의 table => select문을 저장.


-- force : table이 존재하지 않아도 view 생성. noforce : table이 존재하는 경우에만 뷰 생성
-- replace : 

create or replace view emp_view 
as
select empno, ename from emp;


select * from emp_view

-- view를 통해 insert를 하게 되면 emp 테이블에도 추가 된다.
insert into emp_view(empno, ename) values(8888, 'asdfdsa');

select * from emp_view

select * from emp

delete 





select * from emp where ename = 'fdsa' or 1=1



--sequence 만들기
--sequence는 여러 테이블에서 사용 가능. 실패해도 증가함. 의미없이 row들을 구별하기 위해 사용하기 때문에 중간에 연속적으로 숫자가 나오지 않아도 상관 없음.
create sequence seq_num;

create table board(
	num number primary key,
	title varchar2(20),
	contents varchar2(2000),
	writer varchar2(30)

)

insert into board values(seq_num.nextval, 'DB lecture', '????', null);


select * from board;

insert into member(user_id, user_name, user_major) values(seq_num.nextval, 'fdsa', 10);

insert into member(
	user_id 

)










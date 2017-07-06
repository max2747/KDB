

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
--constraint table�̸�_Į���̸�_�������ǳ���
--foreign key�� null�� ���.
--not null, primary key, foreign key, unique, check
insert into member values(1, 'abcde', '����� �߱�','aa@naver.com', 20, 40, 'M');

insert into member(user_id, user_name) values(2, 'tt');

insert into member(user_id, user_name, user_email) values(3, 'abcd', 'fdsa@naver.com');

select * from member;


drop table member

select * from emp where ename ='fdsa'; drop table member;
select * from tab;



--�ֹ��� table

create table order_detail(
	orderno number, --pk
	seq number, --pk
	goods_name varchar2(100),
	cnt number,
	constraint order_detail_pk primary key(orderno, seq)
)
insert into order_detail values(123, 1, '��Ʈ��', 2);
insert into order_detail values(123, 2, '��Ʈ��', 2);
insert into order_detail values(123, 3, '��Ʈ��', 2);

select * from order_detail






--����, ���� ������ table�� �Ϻθ� ������. view�� �����ְ� table�� �����.
-- ���� ���Ǵ� select���� ���������ν� query���� �����ϰ� �Ѵ�.
--view�� ������ table => select���� ����.


-- force : table�� �������� �ʾƵ� view ����. noforce : table�� �����ϴ� ��쿡�� �� ����
-- replace : 

create or replace view emp_view 
as
select empno, ename from emp;


select * from emp_view

-- view�� ���� insert�� �ϰ� �Ǹ� emp ���̺��� �߰� �ȴ�.
insert into emp_view(empno, ename) values(8888, 'asdfdsa');

select * from emp_view

select * from emp

delete 





select * from emp where ename = 'fdsa' or 1=1



--sequence �����
--sequence�� ���� ���̺��� ��� ����. �����ص� ������. �ǹ̾��� row���� �����ϱ� ���� ����ϱ� ������ �߰��� ���������� ���ڰ� ������ �ʾƵ� ��� ����.
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










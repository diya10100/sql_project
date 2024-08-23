create database assessment;
use assessment;

create table Workers (WORKER_ID INT PRIMARY KEY,
	FIRST_NAME VARCHAR(70),
	LAST_NAME VARCHAR(70),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(50));

INSERT INTO Workers values(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00', 'HR'),
	(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00', 'Admin');
    

-- Q.1 
select * from workers order by first_name asc, department desc;

-- Q.2 
select * from workers where first_name in ('Vipul', 'Satish');

-- Q.3
select * from workers where first_name like '%h' and length(first_name) = 6;

-- Q.4 
select * from workers where salary between 10000 and 150000;

-- Q.5 
with Same_Salary_Workers
    as (select first_name, salary as Different_parameters from workers where (salary) in (select salary from workers group by salary having count(*) > 1)),
    Same_Departments_Workers
    as (select first_name, department from workers where (department) in (select department from workers group by department having count(*) > 1)),
    Same_Joining_Date
    as (select first_name, joining_date from workers where (joining_date) in (select joining_date from workers group by joining_date having count(*) > 1))
    select * from Same_Salary_Workers
	union all
    select * from Same_Departments_Workers
    union all
    select * from Same_Joining_Date;    with Same_Salary_Workers
    as (select first_name, salary as Different_parameters from workers where (salary) in (select salary from workers group by salary having count(*) > 1)),
    Same_Departments_Workers
    as (select first_name, department from workers where (department) in (select department from workers group by department having count(*) > 1)),
    Same_Joining_Date
    as (select first_name, joining_date from workers where (joining_date) in (select joining_date from workers group by joining_date having count(*) > 1))
    select * from Same_Salary_Workers
	union all
    select * from Same_Departments_Workers
    union all
    select * from Same_Joining_Date;

-- Q.6
select *  from workers order by  salary desc limit 6;

-- Q.7 
select department from workers group by department having department < 5;

-- Q.8
select count(department) as no_employees, department from workers group by department;

-- Q.9 
select first_name, last_name, department, salary
from workers
where (salary, department)
in (select max(salary), department from workers 
group by department);


-- Task 2

create table Students (STUDENT_ID INT PRIMARY KEY,
STUDENT_NAME TEXT,
SEX VARCHAR(15),
PERCENTAGE int,
CLASS INT,
SEC CHAR,
STREAM VARCHAR(30),
DOB DATE);

insert into Students values(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'MAAHI AGARWAL', 'Female', 56, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Male', 59, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-11-05'), 
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'),
(1006, 'JAHANVI Puri', 'Female', 60, 11, 'B', 'Commerce', '2008-11-07'),
(1007, 'Sanam Kumar', 'Male', 23, 12, 'F', 'Commerce', '1998-03-08'),
(1008, 'SAHIL SARAS', 'Male', 56, 11, 'C', 'Commerce', '2008-11-07'),
(1009, 'AKSHRA AGARWAL', 'Female', 72, 12, 'B', 'Commerce', '1996-10-01'),
(1010, 'STUTI MISHRA', 'Female', 39, 11, 'F', 'Science', '2008-11-23'),
(1011, 'HARSH AGARWAL', 'Male', 42, 11, 'C', 'Science', '1998-03-08'),
(1012, 'NIKUNJ AGARWAL', 'Male', 49, 12, 'C', 'Commerce', '1998-06-28'),
(1013, 'AKRITI SAXENA', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'TANI RASTOGI', 'Female', 82, 12, 'A', 'Science', '2008-11-23');


-- Q.1
select * from students;

-- Q.2 
select Student_Name, DOB from students;

-- Q.3
select * from students 
where percentage >= 80;

-- Q.4
select Student_Name, stream, percentage  
from students
where percentage > 80;

-- Q.5
select * from students
where stream = 'Science' and percentage > 75;

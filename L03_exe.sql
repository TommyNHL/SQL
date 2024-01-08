create database BOOTCAMP_EXE1;
use BOOTCAMP_EXE1;

-- in task 1, can ignore Table job grade
-- primary key, foreign key
drop table REGIONS;
create table REGIONS (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(25)
    );
insert into REGIONS (region_id, region_name)
	values (1, 'EUP');
insert into REGIONS (region_id, region_name)
	values (2, 'USA');
insert into REGIONS (region_id, region_name)
	values (3, 'ASIA');
select * from REGIONS;

drop table COUNTRIES;
create table COUNTRIES (
	country_id VARCHAR(2) PRIMARY KEY,
    country_name VARCHAR(40),
    region_id INT,
    foreign key (region_id) references REGIONS(region_id)
    );
insert into COUNTRIES (country_id, country_name, region_id)
	values ('DE', 'Germany', 1);
insert into COUNTRIES (country_id, country_name, region_id)
	values ('IT', 'Italy', 1);
insert into COUNTRIES (country_id, country_name, region_id)
	values ('JP', 'Japan', 3);
insert into COUNTRIES (country_id, country_name, region_id)
	values ('US', 'United State', 2);
select * from COUNTRIES;

drop table LOCATIONS;
create table LOCATIONS (
	location_id INT PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12),
    country_id VARCHAR(2),
    foreign key (country_id) references COUNTRIES(country_id)
    );
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
	values (1000, '1297 Via Cola di Rie', '989', 'Roma', null, 'IT');
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
	values (1100, '93091 Calle della Te', '10934', 'Venice', null, 'IT');
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
	values (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo', 'JP');
insert into LOCATIONS (location_id, street_address, postal_code, city, state_province, country_id)
	values (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
select * from LOCATIONS;

drop table DEPARTMENTS;
create table DEPARTMENTS (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(30),
    manager_id INT,
    location_id INT,
    foreign key (location_id) references LOCATIONS(location_id)
    );
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
	values (10, 'Administration', 200, 1100);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
	values (20, 'Marketing', 201, 1200);
insert into DEPARTMENTS (department_id, department_name, manager_id, location_id)
	values (30, 'Purchasing', 202, 1400);
select * from DEPARTMENTS;

drop table JOB_HISTORY;
create table JOB_HISTORY (
	employee_id INT PRIMARY KEY,
    start_date DATETIME,
    end_date DATETIME,
    job_id VARCHAR(10),
    department_id INT,
    foreign key (department_id) references DEPARTMENTS(department_id)
    );
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
	values (102, '1993-01-13', '1998-07-24', 'IT_PROG', 20);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
	values (101, '1993-10-28', '1997-03-15', 'MK_REP', 30);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
	values (100, '1996-02-17', '1999-12-19', 'ST_CLERK', 30);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
	values (103, '1998-03-24', '1999-12-31', 'MK_REP', 20);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
	values (109, '1986-10-28', '1997-03-15', 'ST_CLERK', 30);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
	values (108, '1984-02-17', '1999-12-19', 'IT_PROG', 30);
insert into JOB_HISTORY (employee_id, start_date, end_date, job_id, department_id)
	values (105, '1988-03-24', '1999-12-31', 'MK_REP', 20);
select * from JOB_HISTORY;

drop table EMPLOYEES;
create table EMPLOYEES (
	employee_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(25),
    email VARCHAR(25),
    phone_number VARCHAR(20),
    hire_date DATETIME,
    job_id VARCHAR(10),
    salary INT,
    commission_pct INT,
    manager_id INT,
    department_id INT,
    foreign key (department_id) references DEPARTMENTS(department_id),
    foreign key (employee_id) references JOB_HISTORY(employee_id)
    );
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	values (100, 'Steven', 'King', 'SKING', '515-1234567', '1987-06-17', 'ST_CLERK', 24000, 0, 109, 10);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	values (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515-1234568', '1987-06-18', 'MK_REP', 17000, 0, 103, 20);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	values (102, 'Lex', 'De Haan', 'LDEHAAN', '515-1234569', '1987-06-19', 'IT_PROG', 17000, 0, 108, 30);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	values (103, 'Alexander', 'Hunold', 'AHUNOLD', '590-4234567', '1987-06-20', 'MK_REP', 9000, 0, 105, 20);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	values (109, 'Peter', 'Ng', 'ABC', '590-4234547', '1986-06-20', 'ST_CLERK', 30000, 0, 109, 10);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	values (108, 'Gigi', 'Wong', 'CDE', '590-4234537', '1982-06-20', 'IT_PROG', 60000, 0, 108, 30);
insert into EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
	values (105, 'Iris', 'Lee', 'EFG', '590-4234517', '1981-06-20', 'MK_REP', 30000, 0, 105, 20);
select * from EMPLOYEES;

drop table JOBS;
create table JOBS (
    job_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(25),
    min_salary INT,
    max_salary INT
    );
insert into JOBS (job_id, job_title, min_salary, max_salary)
	values ('IT_PROG', 'Programmer', 30000, 80000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
	values ('MK_REP', 'Receptionist', 15000, 18000);
insert into JOBS (job_id, job_title, min_salary, max_salary)
	values ('ST_CLERK', 'Clerk', 15000, 20000);
select * from JOBS;

alter table JOB_HISTORY
	add constraint foreign key (job_id) references JOBS(job_id);

alter table EMPLOYEES
	add constraint foreign key (job_id) references JOBS(job_id),
    add constraint foreign key (employee_id) references JOB_HISTORY (employee_id);

drop table JOB_GRADES;
create table JOB_GRADES (
    grade_level VARCHAR(2) PRIMARY KEY,
    lowest_sal INT,
    highest_sal INT
    );
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
	values ('L1', 12000, 18000);
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
	values ('L2', 20000, 35000);
insert into JOB_GRADES (grade_level, lowest_sal, highest_sal)
	values ('L3', 40000, 70000);
select * from JOB_GRADES;

select l.location_id, l.street_address, l.city, l.state_province, c.country_name
	from LOCATIONS l
    left join COUNTRIES c on l.country_id = c.country_id;
    
select e.first_name, e.last_name, e.department_id
	from EMPLOYEES e;
    
select e.first_name, e.last_name, e.job_id, e.department_id
    from EMPLOYEES e left join DEPARTMENTS d on e.department_id = d.department_id
    left join LOCATIONS l on d.location_id = l.location_id
    where l.country_id = 'JP';

select e.employee_id, e.last_name as self_name, e.manager_id, m.last_name as head_name
    from EMPLOYEES e left join EMPLOYEES m on e.manager_id = m.employee_id;

select e.first_name, e.last_name, e.hire_date
	from EMPLOYEES e
	where e.hire_date > (select hire_date from EMPLOYEES where first_name = 'Lex' and last_name = 'De Haan');

select d.department_name, count(e.department_id)
	from DEPARTMENTS d left join EMPLOYEES e on d.department_id = e.department_id
    group by d.department_id;

select e.employee_id, j.job_title, DATEDIFF(h.end_date, h.start_date) as number_of_days
	from EMPLOYEES e left join JOBS j on e.job_id = j.job_id
    left join JOB_HISTORY h on e.employee_id = h.employee_id
	where e.department_id = 30;
    
select d.department_name, (CONCAT(e.first_name, ' ', e.last_name)) as manager_name, l.city, c.country_name
	from DEPARTMENTS d left join EMPLOYEES e on d.manager_id = e.employee_id
    left join LOCATIONS l on d.location_id = l.location_id
    left join COUNTRIES c on l.country_id = c.country_id;
    
select d.department_name, avg(e.salary) as average_salary_per_department
	from EMPLOYEES e left join DEPARTMENTS d on e.department_id = d.department_id
    group by e.department_id;

select * from JOBS;
select * from JOB_GRADES;

alter table JOBS add grade_level VARCHAR(2);
alter table JOBS drop column min_salary;
alter table JOBS drop column max_salary;
alter table JOBS
	add constraint foreign key (grade_level) references JOB_GRADES(grade_level);
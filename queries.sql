SELECT * from employees_list;
SELECT * from salaries;
SELECT * from departments;
SELECT * from department_empls;
SELECT * from titles;
SELECT * from dept_managers;

--1. Getting emp data and salaries
select a.emp_no, a.last_name, a.first_name, a.gender, s.salary
from employees_list a
join salaries s
on a.emp_no = s.emp_no

--2. Getting names of employees hired in 1986
select a.last_name, a.first_name, date_part('year', a.hire_date)
from employees_list a
where date_part('year', a.hire_date) = 1986

--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
select a.emp_no, a.last_name, a.first_name, dm.dept_no, dm.from_date, dm.to_date, d.dept_name
from employees_list a
join dept_managers dm
on a.emp_no = dm.emp_no
join departments d
on dm.dept_no = d.dept_no

--4. Emp names and their respective department numbers
select a.emp_no, a.last_name, a.first_name, d.dept_name
from employees_list a
join department_empls de
on a.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no

--5. First name is Hercules and last name begins with B
select a.last_name, a.first_name
from employees_list a
where a.first_name = 'Hercules' and a.last_name ~'^b';

--6. Empls from Sales Department
select a.emp_no, a.last_name, a.first_name, d.dept_name
from employees_list a
join department_empls de
on a.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name = 'Sales'

--7. Empls from Sales and Development
select a.emp_no, a.last_name, a.first_name, d.dept_name
from employees_list a
join department_empls de
on a.emp_no = de.emp_no
join departments d
on de.dept_no = d.dept_no
where d.dept_name = ANY('{Sales, Development}')

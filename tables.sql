-- Table: public.employees,
-- DROP TABLE public.employees_list;

CREATE TABLE public.employees_list
(
    emp_no integer,
	birth_date date, 
	first_name character varying(255) COLLATE pg_catalog."default",
    last_name character varying(255) COLLATE pg_catalog."default",
    gender character varying(255) COLLATE pg_catalog."default",
	hire_date date,
	CONSTRAINT primary_key_pkey PRIMARY KEY (emp_no)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.employees_list
    OWNER to postgres;
	

-- Salaries
-- DROP TABLE public.salaries;

CREATE TABLE public.salaries
(
    emp_no integer references employees_list (emp_no),
	salary integer, 
	from_date date,
	to_date date
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.salaries
    OWNER to postgres;
	
-- titles
-- DROP TABLE public.titles;

CREATE TABLE public.titles
(
    emp_no integer references employees_list (emp_no),
	title character varying(255) COLLATE pg_catalog."default",
	from_date date,
	to_date date
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.titles
    OWNER to postgres;
	
-- departments
--DROP TABLE public.departments;

CREATE TABLE public.departments
(
    dept_no character varying(255) COLLATE pg_catalog."default",
	dept_name character varying(255) COLLATE pg_catalog."default",
	CONSTRAINT primary_key_depts PRIMARY KEY (dept_no)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.departments
    OWNER to postgres;

-- department_empls
--DROP TABLE public.department_empls;

CREATE TABLE public.department_empls
(
	emp_no integer,
	dept_no character varying(255) COLLATE pg_catalog."default",
	from_date date,
	to_date date
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.department_empls
    OWNER to postgres;

--dept_managers
--DROP TABLE public.dept_managers

CREATE TABLE public.dept_managers
(
	dept_no character varying(255) COLLATE pg_catalog."default",
	emp_no integer,
	from_date date,
	to_date date
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.dept_managers
    OWNER to postgres;


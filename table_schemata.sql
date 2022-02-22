-- Creating tables with the given .csv files (departments, dept_emp, dept_manager, employees, salaries, titles)

-- Creating a table from department.csv
DROP TABLE departments

CREATE TABLE departments (
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
)

-- Creating a table from dept_emp.csv
DROP TABLE dept_emp

CREATE TABLE dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

-- Creating a table from dept_manager.csv
DROP TABLE dept_manager

CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

-- Creating a table from employees.csv
DROP TABLE employees

CREATE TABLE employees(
	emp_no INT,
	emp_title_id VARCHAR,
	birth_date DATE,		-- Date format: YYYY-MM-DD (https://www.w3schools.com/sql/sql_dates.asp)
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,			-- Date format: YYYY-MM-DD (https://www.w3schools.com/sql/sql_dates.asp)
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
)

-- Creating a table from salaries.csv
DROP TABLE salaries

CREATE TABLE salaries(
	emp_no INT,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
)

-- Creating a table from titles.csv
DROP TABLE titles

CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
)
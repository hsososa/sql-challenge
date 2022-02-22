-- Querying the imported .csv data

-- 1. List the following details of each employee: employee number, last name, first name, sex, & salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no

-- 2. List the first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-1-1'				-- 1st day of 1986
		AND hire_date <= '1986-12-31';		-- Last day of 1986

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, & first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B".
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
		AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM departments;
-- Used the above line to look-up the dept_no for Sales, which is d007
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no ='d007';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT * FROM departments;
-- Used the above line to look-up the dept_no for Sales and Development, which are d007 and d005, respectively
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007'
		OR departments.dept_no = 'd005';

-- 8. List the frequency count of employee last name (i.e., how many employees share each last name) in descending order
SELECT last_name, COUNT(last_name) AS "Frequency Count"
-- More information on COUNT function: https://www.w3schools.com/sql/sql_count_avg_sum.asp
FROM employees
GROUP BY last_name
ORDER by "Frequency Count" DESC;
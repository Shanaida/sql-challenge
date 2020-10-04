--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
SELECT department.dept_no, department.dept_name, department_manager.emp_no, employees.last_name, employees.first_name
FROM department
JOIN department_manager
ON department.dept_no = department_manager.dept_no
JOIN employees
ON department_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT department_emp.emp_no, employees.last_name, employees.first_name, department.dept_name 
FROM department_emp
JOIN employees
ON department_emp.emp_no = employees.emp_no
JOIN department
ON department_emp.dept_no = department.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT department_emp.emp_no, employees.last_name, employees.first_name, department.dept_name 
FROM department_emp
JOIN employees
ON department_emp.emp_no = employees.emp_no
JOIN department
ON department_emp.dept_no = department.dept_no
Where dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and dept name.
SELECT department_emp.emp_no, employees.last_name, employees.first_name, department.dept_name 
FROM department_emp
JOIN employees
ON department_emp.emp_no = employees.emp_no
JOIN department
ON department_emp.dept_no = department.dept_no
Where dept_name = 'Sales'
OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency_count_employee_last_names"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
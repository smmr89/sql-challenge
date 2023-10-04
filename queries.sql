SELECT *
FROM employees;

SELECT *
FROM titles;

SELECT *
FROM salaries;

SELECT *
FROM departments;

SELECT *
FROM managers;

SELECT *
FROM employee_dept_junction;

------------------------------------------
------------- DATA ANALYSIS --------------
------------------------------------------

-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON (s.emp_no = e.emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.

SELECT e.last_name, e.first_name, d.dept_name, m.emp_no, m.dept_no
FROM managers AS m
JOIN departments AS d
ON (m.dept_no = d.dept_no)
	JOIN employees AS e
	ON (e.emp_no = m.emp_no);

-- List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.

SELECT  e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM employees AS e
JOIN employee_dept_junction AS j
ON (j.emp_no = e.emp_no)
	JOIN departments AS d
	ON (j.dept_no = d.dept_no);

-- List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B.

SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, 
--and first name.

SELECT  e.emp_no, e.last_name, e.first_name
FROM employees AS e
JOIN employee_dept_junction AS j
ON (j.emp_no = e.emp_no)
	JOIN departments AS d
	ON (j.dept_no = d.dept_no)
	WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN employee_dept_junction AS j
ON (j.emp_no = e.emp_no)
	JOIN departments AS d
	ON (j.dept_no = d.dept_no)
	WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names (that is, how 
--many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name
ORDER BY "Last Name Count" DESC;
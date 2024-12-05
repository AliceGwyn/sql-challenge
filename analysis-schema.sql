--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary FROM employees
INNER JOIN salaries ON
	employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
SELECT dept_manager.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
	FROM dept_manager
INNER JOIN departments ON
	dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
	dept_manager.emp_no = employees.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
SELECT departments.dept_no, employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
	FROM departments
INNER JOIN dept_emp ON
	departments.dept_no = dept_emp.dep_no
INNER JOIN employees ON
	dept_emp.emp = employees.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name (2 points)
SELECT emp_no, last_name, first_name FROM employees
WHERE emp_no IN 
	(SELECT emp FROM dept_emp
	WHERE dep_no = 
		(SELECT dept_no FROM departments
		WHERE dept_name = 'Sales'));

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name FROM employees
INNER JOIN dept_emp ON
	employees.emp_no = dept_emp.emp
	INNER JOIN departments ON
	dept_emp.dep_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(last_name) FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


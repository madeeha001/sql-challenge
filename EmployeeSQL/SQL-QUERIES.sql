-- 1 List the employee number, last name, first name, sex, and salary of each employee.
SELECT last_name , salary , employees.emp_no
FROM employees
INNER JOIN salaries ON employees.emp_no= salaries.emp_no;

--2 List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp_no , last_name, first_name 
FROM employees
WHERE EXTRACT(year from hire_date)=1986;

-- 3 List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name.
SELECT dept_manager.dept_no,employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments. dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;


--4 List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name 
FROM dept_emp de
JOIN employees e 
ON de.emp_no= e.emp_no
INNER JOIN departments d ON d.dept_no=de.dept_no;


--5 List first name, last name, and sex of each employee whose first name
-- is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6 List each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM employees e 
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN  departments d ON d.dept_no= de.dept_no
WHERE d.dept_name = 'Sales';


--7 List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name 
FROM employees e 
JOIN dept_emp de 
ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no= de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';



--8 List the frequency counts, in descending order, of all the employee
-- last names (that is, how many employees share each last name).
SELECT last_name ,COUNT(*)
FROM employees
GROUP BY last_name 
ORDER BY COUNT(*) DESC;
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary 
FROM employees as emp
JOIN salaries as sal
ON emp.emp_no = sal.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
SELECT emp.first_name, emp.last_name, emp.hire_date 
FROM employees as emp 
-- WHERE RIGHT(emp.hire_date, 4) = '1986';
WHERE extract('year' from hire_date)= 1986;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dep.dept_no, dep.dept_name, dm.emp_no, emp.last_name, emp.first_name
FROM dept_manager as dm
JOIN employees as emp ON dm.emp_no= emp.emp_no
JOIN departments as dep ON dm.dept_no= dep.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name 
SELECT de.dept_no, de.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM dept_emp as de
JOIN employees as emp ON de.emp_no= emp.emp_no
JOIN departments as dep ON de.dept_no= dep.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT emp.last_name, emp.first_name, emp.sex
FROM employees as emp
WHERE emp.first_name ='Hercules' AND LEFT(last_name, 1)='B'

-- 6. List each employee in the Sales department, including their employee number, last name, and first name
SELECT dep.dept_name, emp.emp_no, emp.last_name,emp.first_name
FROM departments as dep
JOIN dept_emp as de ON dep.dept_no = de.dept_no
JOIN employees as emp ON de.emp_no = emp.emp_no
WHERE dep.dept_name ='Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
SELECT emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
FROM departments as dep
JOIN dept_emp as de ON dep.dept_no = de.dept_no
JOIN employees as emp ON de.emp_no = emp.emp_no
WHERE dep.dept_name ='Sales' OR dep.dept_name='Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT emp.last_name, COUNT(last_name) as frequency_counts
FROM employees as emp
GROUP BY emp.last_name
ORDER BY frequency_counts DESC;

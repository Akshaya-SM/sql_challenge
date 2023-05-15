-- Table Creation 
-- departments table
DROP TABLE departments

CREATE TABLE departments(
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;


-- dept_emp table  
DROP TABLE dept_emp;

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VHARCHAR(15) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;


-- dept_manager table
DROP TABLE dept_manager;

CREATE TABLE dept_manager(
	dept_no VARCHAR(15),
	emp_no  VARCHAR(15),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_manager;


-- employee table
DROP TABLE employees;

CREATE TABLE employees(
	emp_no  INT NOT NULL,
	emp_title_id VARCHAR(20) NOT NULL,
	birth_date DATE NOT NULL,
	first_name STRING(30) NOT NULL,
	last_name STRING(30) NOT NULL,
	sex VARCHAR(10) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

SELECT * FROM employees;


-- salaries table
DROP TABLE salaries;

CREATE TABLE salaries(
	emp_no VARCHAR(15) NOT NULL,
	salary INT(20) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;


-- titles table
DROP TABLE titles;

CREATE TABLE titles(
	title_id VARCHAR(15) NOT NULL,
	title STRING(30) NOT NULL,
	PRIMARY KEY(title_id)
);

SELECT * FROM titles;

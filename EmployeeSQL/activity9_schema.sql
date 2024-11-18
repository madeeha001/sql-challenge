CREATE TABLE titles(
title_id VARCHAR(7) PRIMARY KEY NOT NULL,
title VARCHAR(20)
);
CREATE TABLE employees(
emp_no INT PRIMARY KEY NOT NULL,
emp_title_id VARCHAR(7),
birth_date DATE,
first_name VARCHAR(30),
last_name VARCHAR(30),
sex VARCHAR(1),
hire_date DATE,
FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments(
dept_no VARCHAR(7) PRIMARY KEY NOT NULL,
dept_name VARCHAR(20)
);

CREATE TABLE salaries(
emp_no INT NOT NULL,
salary INT NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


CREATE TABLE dept_emp(
emp_no INT,
dept_no VARCHAR(7),
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


CREATE TABLE dept_manager(
dept_no VARCHAR(7),
emp_no INT,
FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

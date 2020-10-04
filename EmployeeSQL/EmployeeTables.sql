--drop table if exists
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Title;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Department_emp;
DROP TABLE IF EXISTS Department_manager;
DROP TABLE IF EXISTS Salaries;

-- Create tables
CREATE TABLE Department (
    dept_no VARCHAR NOT NULL PRIMARY KEY,
    dept_name TEXT NOT NULL
);

CREATE TABLE Title (
    title_id VARCHAR NOT NULL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE Employees (
    emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR NOT NULL,
    birth_date DATE NOT NULL,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL,
	CONSTRAINT fk_emp_title_id FOREIGN KEY(emp_title_id) REFERENCES Title(title_id)
);

CREATE TABLE Department_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR NOT NULL,
	CONSTRAINT fk_emp_no FOREIGN KEY(emp_no) REFERENCES Employees(emp_no),
	CONSTRAINT fk_dept_no FOREIGN KEY(dept_no) REFERENCES Department(dept_no)
);

CREATE TABLE Department_manager (
     dept_no VARCHAR NOT NULL,
	 emp_no INT NOT NULL,
	 CONSTRAINT fk_man_dept_no FOREIGN KEY(dept_no) REFERENCES Department(dept_no),
	 CONSTRAINT fk_man_emp_no FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)	
);

CREATE TABLE Salaries (
    emp_no INT NOT NULL,
    salary MONEY NOT NULL,
	CONSTRAINT fk_sal_emp_no FOREIGN KEY(emp_no) REFERENCES Employees(emp_no)
);


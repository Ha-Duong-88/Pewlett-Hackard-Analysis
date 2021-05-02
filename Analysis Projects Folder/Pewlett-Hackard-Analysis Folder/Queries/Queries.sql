-- Module 7 Exercises


-- Creating tables for PH-EmployeeDB
-- Make sure to indent parameters such as column names and primary keys
-- Make sure to enclose parameters within parenthesess
-- All th details of the table will be inside the parentheses
-- No comma after the last line of code before the closing parenthesis
-- Make sure to end SQL statement with closing parenthesis and semi colon
-- Semi colon signals the the statement is complete
-- pgAdmin will run all of the code in the editor, unless told otherwise. Highlight only code to run.

-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);


CREATE TABLE employees (
	emp_no INT NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);


CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL, 
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);


-- NOT NULL is used to ensure that the data is persistent for every employee
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

-- Re-added the PRIMARY KEY (emp_no) for dept_employees
CREATE TABLE dept_employees (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL, 
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no)REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Re-added the PRIMARY KEY (emp_no)for titles
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, from_date)
);


-----------
SELECT * FROM departments;

SELECT * FROM employees;

SELECT * FROM dept_employees;

SELECT * FROM dept_manager;

SELECT * FROM salaries;

SELECT * FROM titles
--------------------------------


-- Retirement Eligibility Search
-- We want SQL to look in the birth_date column for anyone born between January 1, 1952, and December 31, 1955.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';


--Query that will search for only 1952 birth dates.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';


--Query that will search for only 1953 birth dates.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';


--Query that will search for only 1954 birth dates.
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';


-- Query that will search for only 1955 birth dates.
-- Notice that there is no parentheses around the WHERE clause here
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Narrow the search for retirement eligibility --> Add another filter condition
-- Modify query to include a specific hiring range between 1952 and 1955
-- Look for employees borh betwee 1952 and 1955, who were also hired between 1985 and 1988

-- Retirement eligibility
-- Adjustment: place parenthesis around WHERE clause
-- Adjustment: Remove the semicolon since code block is not done
-- Add a 2nd condition for hiring range with AND keyword
-- Notice that the second condition is inside parentheses because this is a tuple.
-- In SQL, the tuples in this block of code are part of the syntax.
-- This places each condition in a group. Postgres looks for the first group first, then looks inside the second group to deliver the second condition.
-- In Python, data can be stored inside a tuple and accesses in the same way as a list.
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- COUNT the queries using the COUNT() function
-- Number of employees retiring
-- Adjust the above query to use a single column to get the count
-- New query is similiar to the original query above with one exception: The COUNT()function has been inserted after the SELECT statementm, and only one column is included.
-- This counts the number of rows in the first_name column. This is because the length of the query is the same regardless of which of the two columns we use in the COUNT function.
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- SELECT INTO 
-- Now we have a list of the retirement-eligible employees after running the above query with the COUNT() function
-- Only data that is saved as a table can be exported. We have a query that returns the results we need, now we can create table.
-- Adjustment: Modify the SELECT statement into a SELECT INTO statement. 
-- SELECT INTO statement tells Postgres instead of generating a list of results, the data is saved as a new table completely.
-- With the INTO retirement_info statement, we are saving the data into a table named "retirement_info"
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

-- EXPORT the data from the "retirement_info" table
-- Result: 41, 381 rows including hearder row confirmed in retirement_info.csv file exported
-- Make ure to save the queries (saved in .py file) to reference later if needed to adjust and alter existing code to reuse it later.
-- Copy queries created into VSC and save file as queries.sql

-- JOINS
-- Example: Get same list of employees—only we want them broken down into departments. The Employees and Departments tables don't have a common column between them.
-- Using the retirement_info table of all eligible retirement employees, recreate the table so that it includes the emp_no column
-- With this column in place, we will be able to join our new table full of future retirees to the dept_emp table so we know which departments will have job openings.
-- Recreate the retirement_inf table so that it contains unique identifiers (the emp_no colummn)
-- First, DROP TABLE retirement_info first before recreating the table
-- No need to include CASCADE because there are no relationships formed to other tables
DROP TABLE retirement_info


-- Create new table for retiring employees
-- SELECT INTO statement used
-- The retirement_info table generated now includes the emp_no column
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;


-- INNER JOIN = Want only the matching data from both tables
-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;


-- Join the retirement_info table with the dept_employees table and include the dept_no so we know which deparment each employee works in
-- ***Use LEFT JOIN to capture retirement_info table to identify which employees have already left the company
-- We want emp_no, first_name, last_name, and if person is presently employed with the company
-- LEFT JOIN retirement_info and dept_employees tables
-- LEFT JOIN = return all records from "left" table plus only matching record in the "right" table
-- Results: Data from two tables retirement_info and dept_employees joined
-- Joining retirement_info and dept_employees tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_employees.to_date
FROM retirement_info
LEFT JOIN dept_employees
ON retirement_info.emp_no = dept_employees.emp_no;


-- ALIASES or nicknames for tables for code readability 
-- Use ALIASES for the above left join on retirement_info and dept_employees tables
-- These ALIASES only exist within this query and aren't committed to that database.
-- We need to define the new ALIASES --> "as ri"
-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
-- SELECT only the specified columns from their tables
-- FROM points to the first table to be joined, departments (Table 1)
-- INNER JOIN points to the second table to be joined, dept_manager (Table 2)
-- ON indicates where Postgre should look for matches
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Update the INNER JOIN on deparments and dept_manager above using ALIASES
-- Each table's name and column is now on their own line for code readability
-- INNER JOIN = return records that. have matches on the tables on the columns specified
SELECT d.dept_no,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;


-- Use LEFT JOIN for retirement_info and dept_employee tables
-- We now have a list of all retirement-eligible employess but it's important to make sure that they are still employed
-- Info to include in new list: emp_no, first_name, last_name, to_date
-- First specify these columns and tables
-- Then create a new table to hold the information and name it "current_emp"
-- Then do LEFT JOIN on these two tables
-- Then add a filter using the WHERE classue and the date 9999-1-01 because this is a table of current employees
-- Result:  new table containing only the current employees who are eligible for retirement
-- Result:  33,118 records
-- Joining retirement_info and dept_employees tables
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_employees as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');
-- Check the table
SELECT * FROM current_emp

-- COUNT, GROUP BY AND ORDER BY WITH JOINS to separate the employees into their depts
-- Similar to COUNT and GROUP BY functions used in Pandas
-- COUNT() will count the rows of data in a dataset
-- The COUNT is used on the employee numbers
-- GROUP BY to group rows of identical data by type together in a table
-- GROUP BY is the "magic clause" that gives us the number of employees retiring from each department
-- ORDER BY to arrange the data so that it presents itself in descending or ascending order and gives us the number of retirng employees from each dept
-- IF we do NOT USE ORDER BY, output will be a randomly ordered output each time
-- Get the count of demployess for each dept
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;
-- Check the table
SELECT * FROM current_emp

-- Create a new table and export it as a CSV file
-- New table name = count_emp_retire_dept for current retirement-eligible employees by dept 
SELECT COUNT(ce.emp_no), de.dept_no
INTO count_emp_retire_dept
FROM current_emp as ce
LEFT JOIN dept_employees as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;
-- Check the table
SELECT * FROM count_emp_retire_dept

-- Create additional lists by filtering and ordering the data and joining more than one table together
-- List 1: Employee Information: A list of employees containing their unique employee number, their last name, first name, gender, and salary
-- employees table uses the emp_no as the primary key
-- salaries table has the additional information that we need as well as the same primary key
-- employees table holds the data for all employees, even the ones who are not retiring SO we have to filter by to_do column

-- First, verify if the to_date column in salaries table aligns with the employment date or something else
-- Results:  dates are all of the place
SELECT * FROM salaries;

-- ORDER BY DESC --> Order data in descending order
-- Sort bythe column in descending order so we know what are the most recent dates on this list
SELECT * FROM salaries
ORDER BY to_date DESC;

-- Next we'll need to pull employment dates from the dept_employees table again
-- Re-use the code (above) to filter the employees table to show only emmployees born and hires at the correct time BUT add gender column
-- Do NOT save this query into the same table used before --> Update the INTO statement and new temporary table name = emp_info
SELECT emp_no,
    first_name,
last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


-- Now that our employees table has been filtered again and is being saved into a new temporary table (emp_info), we need to join it to salaries table.
-- Next add to_date and salary columns to above query
-- Join to employees and salaries tables to get the to_date and salary columns to query
-- Note the use of ALIASES
-- Use INNER JOIN in query because we onlyy want matching records on the tables and columns specified
-- We have updated and added code to select columns from three tables
-- We have created a new temp table = emp_info
-- We have added ALIASES
-- We have joined two of the three tables
-- We have added a third join to query 
-- We have added filters to the third join to update the birth and hire dates filters to reference the correct table using an alias
-- Note that we have updated ALIASES in the WHERE clause
-- Add one last filter --> Add to_date of 999-01-01 from dept_employees table
SELECT e.emp_no,
    e.first_name,
e.last_name,
    e.gender,
    s.salary,
    de.to_date
-- Commented out the INTO statement for first time while we run code to see results first before creating new table
INTO emp_info 
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- Results: 33,118 records
-- Export this list as a CSV file into project folder

-- List 2: Management
-- Update list to include: manager's employee number, first name, last name, and their starting and ending employment dates.
-- We need to join the following tables: departments, dept_manager, dept_employees
-- Remember that we are still using our filtered employees table, current_emp for this query

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
-- Results: 5 records
-- How can only 5 depts have active managers?

-- List 3: Department Retirees
-- Final list needs to have the departments added to the current_emp table
-- We have consolidated most of the information into one table; now look at the department names and numbers needed
-- The dept_employees and departments have portion of the data needed so we have to do two more joins in next query
-- Info we want: emp_no, first_name, last_name, dept_name from current_emp, departments, and dept_employees tables
-- Notoce that we selected 4 columns from 2 tables yet there are 3 tables; that's because we don't need to see a column
-- But we do need the foreign and primary keys to link them together.
-- INTO statement to create new temp table = dept_info
-- Then name the ALIASES with the FROM statement from each table in join.
SELECT ce.emp_no,
		ce.first_name,
		ce.last_name,
		d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_employees AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- Results: some folks are appearing twice
-- Results: 36,619 records
-- Questions so far from above queries:
-- What's going on with salaries?
-- Why are there only 5 active managers for 9 departments?
-- Why are somem employees appearing twice?
-- To answer these questions we will create tailored lists

-- Create TAILORED LISTS
-- Create an additional containing only employees and their departments
-- The new list will contain everything in the retirement_info table, only tailored for the Sales team

-- Create a query that will return only the information relevant to the Sales team. 
-- The requested list includes: employee name, employee first name, employee last name, employee department name
SELECT ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   d.dept_name
FROM retirement_info as ri, departments as d
WHERE d.dept_name = 'Sales';


-- Query that will return the following information for the Sales and Development teams
-- Information requested: employee numbers, employee first name, employee last name, employee name
-- HINT: You'll need to use the IN condition with the WHERE clause. See the PostgreSQL documentation (Links to an external site.) for additional information.
SELECT ri.emp_no,
	   ri.first_name,
	   ri.last_name,
	   d.dept_name
FROM retirement_info as ri, departments as d
WHERE d.dept_name IN ('Sales','Development');

-- SUCCESS!!!








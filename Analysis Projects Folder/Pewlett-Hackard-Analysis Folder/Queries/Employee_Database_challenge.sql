-- Module 7 Challenge SQL
-- Deliverable 1: Number of Retiring Employees
-- Deliverable 2: Employees Eligible for the Mentorship Program

-- Deliverable 1 starts here --
-- Deliverable 1a.
-- Create Retirement Titles table to query
-- Remove duplicates
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
 		t.from_date,
       	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ASC;
-- Check retirement_titles output table matches challenge output image
SELECT * FROM retirement_titles
-- Another check to validate the emp_no in challenge output table has emp_no = 10001
-- SELECT * FROM retirement_titles
-- WHERE emp_no = '10001';

-- NOTE TO GRADER: Challenge starter code said to use ORDER BY DESC but output didn't match table image in the module
-- Therefore, replaced DESC to ASC to match challenge deliverable 1 image


-- Deliverable 1b.
-- Create Unique Titles table to query
-- Query to retrieve the emp_no, first and last name, and title columns from the Retirement Titles table
-- Use the DISTINCT ON statement to retrieve first occurrence of the emp_no for each set of rows defined by the ON() clause
-- Create a UNIQUE Titles table using the INTO clause
-- Sort the Unique Titles table in ascending order by emp_no
-- Sort the Unique Titles table in descending order by the last date (to_date) of the most recent title
SELECT DISTINCT ON (rt.emp_no) 
	   rt.emp_no,
	   rt.first_name,
	   rt.last_name,
	   rt.to_date,
	   rt.title
INTO unique_titles 
FROM retirement_titles as rt
ORDER BY rt.emp_no ASC, rt.to_date DESC;
-- Check unique_titles table
SELECT * FROM unique_titles 


-- Deliverable 1c.
-- Create Retiring Titles table to query
-- Query to retrieve the number of employees by their most recent job title who are about to retire
-- Use COUNT() function to retrieve the number of titles from the Unique Titles table 
-- Then, create a Retiring Titles table to hold the required information
-- GROUP the table BY title, then sort (ORDER BY) the count column in descending order
SELECT COUNT(ut.title), ut.title
INTO retiring_titles 
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(*) DESC;
-- Check table
SELECT * FROM retiring_titles


-- Deliverable 2 starts here --
-- Create mentorship-eligibility table to query
-- Current employees eligible for mentorship program
-- Current employees eligibility is based on birth_date year 1965
SELECT DISTINCT ON (e.emp_no)
		e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		t.from_date,
		t.to_date,
		t.title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN dept_employees as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;
-- Check mentorship_eligibilty table
SELECT * FROM mentorship_eligibilty

-- End of Challenge --






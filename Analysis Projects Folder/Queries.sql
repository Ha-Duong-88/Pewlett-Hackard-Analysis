-- Deliverable 1: Number of Retiring Employees
-- Remove duplicates
SELECT DISTINCT ON (e.emp_no) e.emp_no,
					e.first_name,
					e.last_name,
					t.title,
 					t.from_date,
       				t.to_date
-- INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;

-- Challenge code said to use DESC but output doesn't match image
-- Therefore, removed DESC to match challenge image

SELECT * FROM retirement_titles

-- Check to validate the emp_no in challenge output table
-- Table is ORDER BY in descending order
SELECT * FROM retirement_titles
WHERE emp_no = '10001';

-- Retrieve the emp_no, first and last name, and title columns from the Retirement Ttiles tale
SELECT * FROM retirement_titles
WHERE emp_no = '10001';


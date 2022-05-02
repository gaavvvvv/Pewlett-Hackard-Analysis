-- MOD 7 Challenge Deliverable 1
--Create Retirement Titles Table
SELECT e.emp_no, 
	e.first_name, 
	e.last_name, 
	t.title, 
	t.from_date, 
		t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN title as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;
-- SELECT * FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
-- SELECT * FROM unique_titles

--Number of Employees by their most recent job title
SELECT COUNT (emp_no),title
INTO retiring_titles
FROM unique_titles as u
GROUP BY u.title
ORDER BY count DESC;
-- SELECT * FROM retiring_titles;

-- MOD 7 Challenge Deliverable 2
-- Create Mentor Eligibility Table

SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentor_eligibility
FROM employees as e
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;
-- SELECT * FROM mentor_eligibility;

	

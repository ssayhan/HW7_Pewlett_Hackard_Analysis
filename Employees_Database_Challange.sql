-- Deliverable 1: The Number of Retiring Employees by Title
-- Retiring Employess

SELECT e.emp_no,e.first_name, e.last_name,
		ts.titles, ts.from_date, ts.to_date
INTO retirement_title
FROM employees as e
INNER JOIN titles as ts
ON (e.emp_no = ts.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_title;

-- Retiring Employees by Title (Without Dublicates)

SELECT DISTINCT ON (rt.emp_no)
			rt.emp_no,
			rt.first_name,
			rt.last_name,
			rt.titles
INTO unique_titles
FROM retirement_title as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

-- The number of retiring employees by titles

SELECT titles, COUNT(*) 
INTO retiring_titles
FROM unique_titles
GROUP BY titles
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2: The Employees Eligible for the Mentorship Program

SELECT DISTINCT ON (e.emp_no)
	e.emp_no, 
	e.first_name, 
	e.last_name, 
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.titles
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentorship_eligibility

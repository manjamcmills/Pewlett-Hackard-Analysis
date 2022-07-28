--Retrieve the emp_no, first_name, and last_name columns from the Employees table.
--Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	tit.title,
	tit.from_date,
	tit.to_date
INTO retirement_titles
FROM employees as emp
INNER JOIN titles as tit
ON (emp.emp_no = tit.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (ret.emp_no) ret.emp_no,
	ret.first_name,
	ret.last_name,
	ret.title
INTO unique_titles
FROM retirement_titles as ret
WHERE (ret.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;


--give mentors only their highest title
SELECT DISTINCT ON (tit.emp_no) tit.emp_no, tit.title
INTO mentor_titles
FROM titles as tit
ORDER BY emp_no ASC, to_date DESC;

--Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
--Retrieve the from_date and to_date columns from the Department Employee table.
--Retrieve the title column from the Titles tab
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, 
	emp.first_name, 
	emp.last_name,
	emp.birth_date,
	demp.from_date,
	demp.to_date,
	mtit.title
INTO mentorship_eligibilty
FROM employees as emp
INNER JOIN dept_emp AS demp
ON (emp.emp_no = demp.emp_no)
INNER JOIN mentor_titles AS mtit 
ON (emp.emp_no = mtit.emp_no)
WHERE (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (demp.to_date = '9999-01-01')
ORDER BY emp_no ASC





--start of challenge
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        ti.title,
        ti.from_date,
        ti.to_date
INTO retirement_titles
FROM employees AS e
    INNER JOIN titles AS ti
        ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC;

-- Retiring Titles
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;


-- Deliverable 2

SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
		ti.title

INTO mentoriship
FROM employees AS e
    INNER JOIN dept_employee AS de
        ON (de.emp_no = e.emp_no)
    INNER JOIN titles AS ti
        ON (ti.emp_no = e.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31');
		

---
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
birth_date,
from_date,
to_date,
title

INTO mentorship_eligibility
FROM mentoriship
ORDER BY emp_no ASC;
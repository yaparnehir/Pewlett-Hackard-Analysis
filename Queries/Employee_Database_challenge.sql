-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date

INTO Retirement_table
FROM employees as e
Join titles as ti
on ti.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title,
rt.to_date
INTO unique_titles
FROM Retirement_table as rt
WHERE rt.to_date between '9999-01-01' and '9999-01-02'
ORDER BY rt.emp_no, rt.to_date DESC;


select * from retiring_titles


SELECT  count(title) as "count", title 
INTO retiring_titles
from unique_titles
group by title
order by "count" desc;

-- -- -- -- -- -- -- -- Deliverable 2 ----------- 
SELECT * from dept_emp


Select Distinct on (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
from employees as e
inner join dept_emp as de
on (e.emp_no= de.emp_no)
inner join titles as ti 
on(e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
Order by e.emp_no;
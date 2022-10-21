-- headcount
SELECT 
    COUNT(emp_no) headcount
FROM
    employees;

-- departments
SELECT 
    dept_name, COUNT(emp_no) amount
FROM
    departments
        JOIN
    dept_emp USING (dept_no)
GROUP BY dept_name
ORDER BY COUNT(emp_no) DESC;

-- job titles
SELECT 
    title, COUNT(emp_no) amount
FROM
    titles
        JOIN
    employees USING (emp_no)
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- top average salary
select distinct 
first_name, 
last_name, 
avg(salary) over(partition by emp_no order by salary desc range between unbounded preceding and unbounded following) avg_salary 
from salaries 
join 
employees using(emp_no) 
order by avg(salary) over(partition by emp_no order by salary desc range between unbounded preceding and unbounded following) desc limit 10;

-- male and female
SELECT 
    gender, COUNT(gender) gender
FROM
    employees
GROUP BY gender
ORDER BY COUNT(gender) DESC;

-- last hire date
SELECT 
    max(hire_date)
FROM
    employees;

-- average salary base on gender
SELECT 
    gender, AVG(salary) average_salary
FROM
    employees
        JOIN
    salaries USING (emp_no)
GROUP BY gender
ORDER BY avg(salary) DESC;

-- average salary
SELECT 
    AVG(salary)
FROM
    salaries;

-- average salary group by department
SELECT 
    dept_name, AVG(salary) average_salary
FROM
    departments
        JOIN
    dept_emp USING (dept_no)
        JOIN
    salaries USING (emp_no)
GROUP BY dept_name
ORDER BY AVG(salary) DESC;
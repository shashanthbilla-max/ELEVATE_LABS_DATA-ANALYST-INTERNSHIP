INSERT INTO public.employees(
	emp_id, emp_name, dept_id, salary)
	VALUES (1, 'vikky', 101, 50000),
	       (2,'gopi',102,60000),
		   (3,'sai',103,55000),
		   (4,'varun',104,45000),
		   (5,'shashanth',105,50000);


select * from employees;


INSERT INTO public.departments(
	dept_id, dept_name)
	VALUES (101, 'HR'),
	        (102,'IT'),
			(103,'FINANCE'),
			(104,'MARKETING');

select * from departments;


//inner join
select
    e.emp_name,
	d.dept_name,
	e.salary
 from employees e
 inner join departments d
 on e.dept_id=d.dept_id;

//left join
 SELECT 
    e.emp_name,
    d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

//right join
SELECT 
    e.emp_name,
    d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

//full join
SELECT 
    e.emp_name,
    d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;

//cross join
SELECT 
    e.emp_name,
    d.dept_name
FROM employees e
CROSS JOIN departments d;

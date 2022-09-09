select  *  from  employees.salaries inner join dept_emp,departments
where salaries.salary = (SELECT MAX(salary) FROM salaries)
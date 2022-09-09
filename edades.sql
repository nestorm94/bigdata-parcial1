select e.first_name , e2.cuenta as mismo_dia from employees as e 
inner join( 	select e.birth_date, count(*) as cuenta from employees as e 
group by e.birth_date ) as e2 on e2.birth_date = e.birth_date
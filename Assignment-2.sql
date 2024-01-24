--Q1
select customer.cust_name, salesman.salesman_name, customer.city
from customer inner join salesman 
on customer.salesman_id = salesman.salesman_id
where customer.city = salesman.city

--Q2
select orders.ord_no, orders.purch_amt, customer.cust_name, customer.city
from orders inner join customer
on orders.customer_id = customer.customer_id 
where orders.purch_amt > 500 and orders.purch_amt < 2000

--Q3
select salesman.salesman_name, customer.cust_name, customer.city, salesman.commission
from salesman inner join customer
on customer.salesman_id= salesman.salesman_id

--Q4
select customer.cust_name, customer.city, orders.ord_no, orders.purch_amt, salesman.salesman_id, salesman.commission, salesman.salesman_name
from orders 
inner join customer
on customer.customer_id = orders.customer_id
inner join salesman
on orders.salesman_id = salesman.salesman_id
where salesman.commission > ((12*orders.purch_amt)/100)

--Q5
select distinct customer.cust_name, customer.city, orders.ord_no, orders.purch_amt, salesman.salesman_id, salesman.commission, salesman.salesman_name
from orders 
inner join customer
on customer.customer_id = orders.customer_id
inner join salesman
on orders.salesman_id = salesman.salesman_id
where salesman.commission > ((12*orders.purch_amt)/100) and salesman.city != customer.city

--Q6
select orders.ord_no, orders.ord_date, orders.purch_amt, customer.cust_name, customer.grade, salesman.salesman_name, salesman.commission
from orders
inner join customer
on orders.customer_id = customer.customer_id
inner join salesman
on orders.salesman_id = salesman.salesman_id

--Q7
select orders.ord_no, orders.ord_date, orders.purch_amt, customer.cust_name, customer.grade, salesman.salesman_name, salesman.commission
from orders
inner join customer
on orders.customer_id = customer.customer_id
inner join salesman
on orders.salesman_id = salesman.salesman_id

--Q8
select customer.cust_name, customer.city, customer.grade, salesman.salesman_name, salesman.city
from customer
left join salesman
on customer.salesman_id = salesman.salesman_id
order by customer.customer_id

--Q9
select customer.customer_id, customer.cust_name, customer.city, customer.grade, salesman.salesman_name, salesman.city
from customer
left join salesman
on customer.salesman_id = salesman.salesman_id
where customer.grade < 300
order by customer.customer_id

--Q10
select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt
from customer
left join orders
on customer.customer_id = orders.customer_id
order by orders.ord_date

--Q11
select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt, salesman.salesman_name, salesman.commission
from customer
left join orders
on customer.customer_id = orders.customer_id
left join salesman
on salesman.salesman_id = orders.salesman_id

--Q12
select 
	salesman.salesman_name,
	count(customer.salesman_id) as customers
from salesman
left join customer
on customer.salesman_id = salesman.salesman_id
group by customer.salesman_id, salesman.salesman_name
order by customers

--Q13
select salesman.salesman_name, customer.cust_name, customer.city, customer.grade, orders.ord_no, orders.ord_date, orders.purch_amt
from salesman
left join customer
on customer.salesman_id = salesman.salesman_id
left join orders
on orders.customer_id = customer.customer_id

--Q14
select salesman.salesman_name, customer.cust_name, customer.city, customer.grade, orders.ord_no, orders.ord_date, orders.purch_amt
from salesman
left join customer
on customer.salesman_id = salesman.salesman_id
left join orders
on orders.customer_id = customer.customer_id
where (orders.purch_amt > 2000 and grade > 0) or grade = 0

--Q15
select salesman.salesman_name, customer.cust_name, customer.city, customer.grade, orders.ord_no, orders.ord_date, orders.purch_amt
from salesman
left join customer
on customer.salesman_id = salesman.salesman_id
left join orders
on orders.customer_id = customer.customer_id
where (orders.purch_amt > 2000 and grade > 0) or grade = 0

--Q16
select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt
from orders
left join customer
on orders.customer_id = customer.customer_id
where grade > 0

--Q17
select *
from salesman
full outer join customer
on customer.salesman_id = salesman.salesman_id

--Q18
select *
from salesman
cross join	customer
where salesman.city = customer.city

--Q19
select *
from salesman
cross join	customer
where salesman.city = customer.city and customer.grade < 1

--Q20
select *
from salesman
cross join	customer
where salesman.city != customer.city and customer.grade > 1
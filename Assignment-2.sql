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
select customer.cust_name, customer.city, salesman.salesman_name, salesman.city,salesman.commission
from salesman 
inner join customer
on customer.salesman_id = salesman.salesman_id
inner join orders
on orders.salesman_id = salesman.salesman_id
where salesman.commission > orders.purch_amt

--Q5
select customer.cust_name, customer.city, salesman.salesman_name, salesman.city, salesman.commission
from salesman 
inner join customer
on customer.salesman_id = salesman.salesman_id
inner join orders
on orders.salesman_id = salesman.salesman_id
where salesman.commission > orders.purch_amt and salesman.city != customer.city

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
select customer.cust_name, customer.city, customer.grade, salesman.salesman_name, salesman.city
from customer
left join salesman
on customer.salesman_id = salesman.salesman_id
where customer.grade < 300
order by customer.customer_id

--Q10
select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt
from customer
inner join orders
on customer.customer_id = orders.customer_id
order by orders.ord_date

--Q11
select
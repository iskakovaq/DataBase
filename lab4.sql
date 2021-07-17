create database lab5;

create table Customers(
                          customer_id integer primary key ,
                          cust_name text,
                          city text,
                          garde integer,
                          salesman_id integer,
                          grade int not null
);

create table Orders(
                       ord_no integer primary key ,
                       purch_amt float,
                       ord_date date,
                       customer_id integer references customers(customer_id),
                       salesman_id integer
);

insert into customers values (3002,'Nick Rimando','New York',100,5001),
                             (3005,'Graham Zusi','California',200,5002),
                             (3001, 'Brad Guzan', 'London', NULL, 5005),
                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                             (3007, 'Brad Davis', 'New York', 200, 5001),
                             (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                             (3008, 'Julian Green', 'London', 300, 5002);

insert into orders values (70001, 150.5, '2012-10-05', 3005, 5002),
                          (70009, 270.65, '2012-09-10', 3001, 5005),
                          (70002, 65.26, '2012-10-05', 3002, 5001),
                          (70004, 110.5, '2012-08-17', 3009, 5003),
                          (70007,948.5,'2012-09-10',3005,5002),
                          (70005,2400.6,'2012-07-27',3007,5001),
                          (70008,5760,'2012-09-10',3002,5001);

SELECT SUM (purch_amt)
FROM orders; -----------3

SELECT AVG (purch_amt)
FROM orders; ---------4

SELECT COUNT(*)
FROM customers; --------------5

SELECT MIN (purch_amt)
FROM orders; --------------6

SELECT MAX( grade )
FROM Customers; ---------------6

SELECT *
FROM Customers
WHERE cust_name LIKE '%n'; --------------7

SELECT * FROM orders
WHERE customer_id IN
      (SELECT customer_id
       FROM Customers
       WHERE city ='New York'); ----------------8

select *
from Customers
where exists (select ord_no from Orders where purch_amt>10 and Orders.customer_id = Customers.customer_id); --------9

SELECT ord_no
FROM Orders
where purch_amt>(select avg(purch_amt)from Orders); -------10

SELECT purch_amt,
       char_length(purch_amt),
       CASE
           when char_length(purch_amt) between 0 and 100 then 'low'
           when char_length(purch_amt) between 100 and 1000 then 'high'
           else 'veryhigh'
           end

from orders;/11
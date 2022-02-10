#Report the number of customers in Denmark, Norway, and Sweden.
select  * from products where productName like '%Ford%';

#List products ending in ‘ship’.
select  * from products where productName like '%ship';

#-Find products containing the name ‘Ford’.
select * , count(country)  from customers where country in ('Denmark', 'Norway', 'Sweden')
group by country;


#What are the products with a product code in the range S700_1000 to S700_1499
SELECT * FROM products
                  INNER JOIN productlines on products.productLine = productlines.productLine
where productCode > 'S700_1000'
  AND productCode < 'S700_1499';

#hoặc
select * from products where  productCode between  's700_1000' and 's700_1499';



#Which customers have a digit in their name?
select  * from customers where customername regexp'[0-9]';


#List the names of employees called Larry or Barry.
select lastName, firstName from employees
where lastName in ('Larry', 'barry') or firstName in ('Larry', 'barry');

#Lấy ra quốc gia có số lượng customer đông nhất
select country,count(country)from customers
group by country
order by  count(country) desc
    limit 1;


#Lấy ra customer có tổng tiền mua hàng lớn nhất
select customers.customername,orderdetails.orderNumber,sum(quantityOrdered*priceEach) as total from orderdetails

                                                                                                        join orders on orderdetails.orderNumber = orders.orderNumber
                                                                                                        join customers on orders.customerNumber = customers.customerNumber
group by orderNumber
order by total desc
    limit 3;

#List all the records in the Payments table. Display only the first 10 rows of results.


#Display all the values for paymentDate in the Payments table. Sort the results by paymentDate in descending order.


# List all the payments greater than twice the average amount ?


#How many distinct products does classicmodels sell ?


#List all the products purchased by Herkku Gifts.


#List the names of employees with non-alphabetic characters in their names.







#Thực hành 1:

select productCode, productName, buyprice, quantityInStock
from products
where buyprice > 56.76
  and quantityInStock > 10;

SELECT productCode, productName, buyprice, textDescription
FROM products
         INNER JOIN productlines on products.productLine = productlines.productLine
where buyprice > 56.76
  AND buyprice < 95.59;

select productCode, productName, buyprice, quantityInStock, productVendor, productLine
from products
where productLine = 'Classic Cars'
   or productVendor = 'Min Lin Diecast'


    #[Thực hành] Truy vấn dữ liệu từ nhiều bảng
select customers.customerNumber, customerName, phone, paymentDate, amount
from customers
         inner join payments on customers.customerNumber = payments.customerNumber
where city = 'Las Vegas'

    #left join
select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers
         left join orders on customers.customerNumber = orders.customerNumber

    #khách hàng chưa đặt hàng
select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers LEFT JOIN orders on customers.customerNumber = orders.customerNumber
where orderNumber is null


    #[Thực hành] Câu lệnh GROUP BY
select status from orders
group by status
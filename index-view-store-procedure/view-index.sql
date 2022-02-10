#VIEW
create view customer_views as select customerName,customerNumber,phone from customers;

select * from  customer_views;

alter  view customer_views as  select customerNumber, customerName,phone from customers;

create or replace view customer_views as select customerNumber,customerName,phone,contactLastName,contactFirstName from customers;

create or replace view customer_views as select customerNumber,customerName,phone,contactLastName from customers;

delete from customer_views where customerNumber = 125;

drop  view customer_views;






// update db qua view
CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName,phone

FROM customers;

UPDATE customer_views
SET customerName = 'kkk'
WHERE customername = 'hhh';









#INDEX
Thực hành 1:
SELECT * FROM customers WHERE customerNumber = 175;

#check index
EXPLAIN SELECT * FROM customers WHERE customerNumber = 176;

# tạo index
ALTER TABLE customers ADD INDEX idx_customerNumber(customerNumber);
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;


#thêm Index cho những cột mà có thể có nhiều hơn 1 kết quả
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

#xóa chỉ mục
ALTER TABLE customers DROP INDEX idx_full_name;



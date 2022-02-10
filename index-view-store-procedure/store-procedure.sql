#Thực hành
(1)
DELIMITER //     #phân cách bộ nhớ lưu trữ thủ tục Cache và mở ra một ô lưu trữ mới.

CREATE PROCEDURE findAllCustomers()

BEGIN   #khai báo bắt đầu của Procedure và kết thúc Procedure

SELECT * FROM customers;

END //

DELIMITER ; #đóng lại ô lưu trữ



call findAllCustomers();


(2)
DELIMITER //

DROP PROCEDURE IF EXISTS `findAllCustomers`//    #xóa



(3)
DELIMITER //    #Tham số loại IN

CREATE PROCEDURE getCusById

(IN cusNum INT(11))

BEGIN

SELECT * FROM customers WHERE customerNumber = cusNum;

END //

DELIMITER ;

CALL getCusById(175);


(4)
DELIMITER //  #Tham số loại OUT

CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

SELECT COUNT(customerNumber)

INTO total

FROM customers

WHERE city = in_city;

END//

DELIMITER ;

CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;



(5)
#Tham số INOUT là sự kết hợp giữa IN và OUT
DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;
#Gọi store procedure:

SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8

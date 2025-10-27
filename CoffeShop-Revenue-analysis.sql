-------CHECK TABLE, Rows & Colunm--------
SELECT*
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

--------------CHECKING STORE INFORMATION---------

SELECT COUNT (DISTINCT store_id) As number_Of_Shops
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

SELECT DISTINCT store_location
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

SELECT DISTINCT product_category
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

SELECT DISTINCT product_type
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

SELECT DISTINCT product_detail
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

--------- First Operating-----------------
------Opening & Closing Date(hours)--------

SELECT MIN(transaction_date)AS first_operating_date
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

SELECT MAX(transaction_date)AS last_operating_date
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

SELECT MIN(transaction_time)AS Opening_hour
FROM CASESTUDY.BRIGHT.COFFE_SHOP;

SELECT MAX(transaction_time)AS Closing_hour
FROM CASESTUDY.BRIGHT.COFFE_SHOP;


--- first of Jan and end of June__

------------CALCULATE REVENUE by (Day,Week,month-)------------------

SELECT transaction_date,
    DAYNAME(transaction_date)AS day_name,
    CASE
     WHEN day_name IN ('Sun', 'Sat')THEN 'Weekend'
     ELSE 'Weekday'
    END AS day_classification,
    MONTHNAME(transaction_date)AS Month_name,
    transaction_time,
     CASE
        WHEN transaction_time BETWEEN '06:00:00'AND '11:59:59' THEN 'Morning'
        WHEN transaction_time BETWEEN '12:00:00'AND '16:59:59' THEN 'Afternoon'
        WHEN transaction_time >= '17:00:00' THEN 'Evening'
      END AS time_Classification,   
   
   HOUR(transaction_time) AS hour_Of_day,

-------------------------------------------------
       ---CATEGORICAL DATA--
         store_location,
         product_category,
         product_detail,
         product_type,
         unit_price,
         transaction_qty,
         
-----------------------------------------------------
        --- TRANSACTIONA ID & Revenue---
       COUNT (DISTINCT transaction_id) AS number_of_sales,
             
             ---Revenue---
       SUM(transaction_qty*unit_price) AS revenue
        
FROM CASESTUDY.BRIGHT.COFFE_SHOP
GROUP BY ALL;  

---------Revenue per transaction----------------
SELECT transaction_id,
    transaction_qty*unit_price AS revenue
FROM CASESTUDY.BRIGHT.COFFE_SHOP

----Today Number of Transactions Made at shop----

SELECT COUNT (transaction_id) AS Number_Of_Sale
FROM CASESTUDY.BRIGHT.COFFE_SHOP

---- Calculate Revenue by Store Location---

SELECT store_location,
        SUM(transaction_qty*unit_price) As Revenue
FROM CASESTUDY.BRIGHT.COFFE_SHOP
GROUP BY store_location;

---- Calculate Product Category---

SELECT product_category,
       SUM(transaction_qty*unit_price) AS revenue,
       Store_location,
       transaction_date,
FROM CASESTUDY.BRIGHT.COFFE_SHOP
GROUP BY product_category,
         Store_location,
         transaction_date
ORDER BY revenue DESC;


# Using the schema da1
use da1;

# displaying the records of sales table
select * from sales;

# Find all orders shipped via 'Economy' mode with a total amount > 25000
select * 
from sales 
where Ship_Mode='Economy' and Total_Amount>25000;

# Retrieve all sales data for 'Technology' category in 'Ireland' made after '2020-01-01'
select * 
from sales 
where Category='Technology'
 and COUNTRY='Ireland'
 and Order_Date > '2020-01-01';

# List the top 10 most profitable sales transactions in descending order
select *
from sales
order by Total_Amount desc 
limit 10;

# Find all customers whose name starts with 'J' and ends with'n'
select Customer_Name 
from sales
where Customer_Name like 'J%n';

# Retrieve all product names that contain 'Acco' anywhere in the name
select Product_Name
from sales
where Product_Name like '%Acco%';

# Get the top 5 cities with the highest total sales amount
select City,sum(Total_amount) as `Total_sales_Amnt`
from sales 
group by City
order by `Total_sales_Amnt` desc
limit 5;

# Find the total revenue,average unit cost, and total number of orders
select sum(Total_amount) as `Total_Revenue`,
avg(Total_amount) as `Avg_Unit_Cost`,
count(Order_ID) as `Total_No_Orders`
from sales;

# Get total sales per product category
select sum(Total_Amount) as `Total_Sales` , Product_Name
from sales 
group by Product_Name;

# Get customers who have placed orders worth more than 50000
select Customer_Name, sum(Total_amount) as `Total_Price`
from sales 
group by Customer_Name
having `Total_Price` > 50000;

# Find the top 5 customers by sales revenue using DENSE_RANK()
select Customer_Name, Total_Amount, dense_rank()
over (order by Total_Amount desc) as denseRank
from sales
limit 5;




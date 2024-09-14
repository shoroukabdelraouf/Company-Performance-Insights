select * from Customers order by "Loyalty Number" asc ;
-- Questions :
-- 1) From 2016-2021, which ORDER_YEAR had the lowest QUANTITY_SO0LD for Photography products?
with year_sales as (
  select "Order Year", sum("Quantity Sold") as sales_per_year
  from Customers
  where "Product Line" = 'Photography' and "Order Year" between 2016 and 2021
  group by "Order Year"
)
 select "Order Year"
 from year_sales
 where sales_per_year = ( select min(sales_per_year) from year_sales);
 
 -- 2) Which PRODUCT_LINE has the highest QUANTITY_SOLD?
 with PLine_sales as (
 select "Product Line" , sum("Quantity Sold") as sales_per_PLine
 from Customers
 group by "Product Line")
 select "Product Line" 
 from PLine_sales
 where sales_per_PLine = ( select max(sales_per_PLine) from PLine_sales);
 
 -- 3) Which EDUCATION of the loyalty members had the highest amount of QUANTITY_SOLD in 2020?
 with education_sales as (
  select education ,  sum("Quantity Sold") as sales_education
  from Customers
  where  "Order Year" =2020
  group by education
 )
  select education
  from education_sales
  where sales_education = ( select max(sales_education) from education_sales);
  
 -- 4) What is the CUSTOMER_NAME who provided the highest REVENUE in 2022?
 select "Customer Name"
 from Customers
 where  revenue=(select max(revenue) from Customers  where "Order Year" = 2022 );


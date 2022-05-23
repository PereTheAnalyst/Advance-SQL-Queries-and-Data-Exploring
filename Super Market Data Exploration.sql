-- In this Project we will be exploring supermarket sales to answer some questions our stake holders are asking 
-- First we will look at our data 

Select Distinct *
From dbo.[supermarket_sales - Sheet1]

-- Now we will see which branch on average brings in the highest gross income

select Branch, City, avg(gross_income) as avg_gross_income
From dbo.[supermarket_sales - Sheet1]
group by Branch, City
order by avg_gross_income desc
-- Austin store C on avg has the highest avg income

--- Now we will look at the total amount of money that each branch makes 
select Branch, City, sum(Total) as total_income
From dbo.[supermarket_sales - Sheet1]
group by Branch, City
order by total_income desc
-- Austin store C has the most money income 

 --- Now we will see what type of customers spend the most money on average at the store
 Select customer_type, avg(total) as Total_money
 From dbo.[supermarket_sales - Sheet1]
 group by Customer_type
-- members spend more money on avg  
 -- Now we will see the total max and min by product line

 Select Product_line, Max(total) as max_total, Min(total) as min_total 
 From dbo.[supermarket_sales - Sheet1]
 Group by Product_line 
 order by max_total desc
 -- Fashion accessories have products that sell for the highest price and lowest price 

 Select gender, sum(Total) as sum_total
 from dbo.[supermarket_sales - Sheet1]
 group by Gender

--- Women spend the most money at the store 

Select Branch, avg(Rating) as rating, City
From dbo.[supermarket_sales - Sheet1]
Group by Branch, City
order by  avg(Rating) desc

-- Lastly we look at the avg unit price of products in Electronics from the Dallas Location and we will group by payment style 

Select Avg(Unit_price) as price, Payment
From dbo.[supermarket_sales - Sheet1]
Where City = 'Dallas' And Product_line = 'electronic accessories'
group by Payment
order by price desc
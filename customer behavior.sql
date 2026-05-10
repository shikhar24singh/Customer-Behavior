select * from customer


select gender, SUM(purchase_amount) as revenue
from customer
group by gender


select customer_id, purchase_amount
from customer
where discount_applied = 'Yes' and purchase_amount > (select avg(purchase_amount) from customer)


select item_purchased, round(avg(review_rating :: numeric),2) as "average_product_rating"
from customer
group by item_purchased
order by avg(review_rating) desc
limit 5


select shipping_type, round(avg(purchase_amount), 2) as "Purchase Amount"
from customer
where shipping_type in ('Standard', 'Express')
group by shipping_type


select subscription_status, count(customer_id) as "Total Customers", Round(sum(purchase_amount),2) as "Total Revenue", Round(avg(purchase_amount),2) as "Average Spend"
from customer
group by subscription_status
order by "Total Revenue", "Average Spend"

select item_purchased as "Item", round(100 * SUM(case when discount_applied = 'Yes' then 1 else 0 end)/count(*),2) as "Discount Rate"
from customer
group by item_purchased
order by "Discount Rate" desc
limit 5


with customer_type as(
select previous_purchases,
case
	when previous_purchases = 1 then 'NEW'
	when previous_purchases  between 2 and 10 then 'RETURNING'
	when previous_purchases > 10 then 'LOYAL'
	end as "Customer Segment"
from customer
)
select "Customer Segment", count(*) as "Number Of Customers"
from customer_type
group by "Customer Segment"
order by "Number Of Customers" desc


with item_counts as(
select category, item_purchased, count(customer_id) as item_sales,
ROW_NUMBER() over (partition by category order by count(customer_id) desc) as item_rank
from customer
group by category, item_purchased
)
select item_rank, category, item_purchased, item_sales
from item_counts
where item_rank <= 3


select subscription_status, count(customer_id) as "Returning Customer"
from customer
where previous_purchases > 10
group by subscription_status


select age_group,
SUM(purchase_amount :: numeric) as total_revenue
from customer
group by age_group
order by total_revenue desc
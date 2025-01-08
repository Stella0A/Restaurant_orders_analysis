### This project is part of my upskilling on certain tools such as SQL. Knowing how important SQL is I am taking the first quarter of 2025 to improve my SQL and work on projects
# Project 1 Case Study - Restaurant_orders_analysis.

# Background
This data was gotten from Maven Analytics featuring a quarter's worth of orders from a fictitious restaurant serving international cuisine, including the date and time of each order, the items ordered, and additional details on the type, name and price of the items.

## Analysis
What were the least and most ordered items? What categories were they in?
### Least order item and category
SELECT m.item_name, 
      COUNT(m.item_name) as Quantity, 
      m.category
FROM restaurant_db.menu_items as m
JOIN restaurant_db.order_details as o
ON m.menu_item_id = o.item_id
GROUP BY m.item_name, m.category
ORDER BY Quantity ASC
LIMIT 1;
![image](https://github.com/user-attachments/assets/ce9e850d-d956-416c-82ef-2b8d97c73932)


What do the highest spend orders look like? Which items did they buy and how much did they spend?

Were there certain times that had more or less orders?

Which cuisines should we focus on developing more menu items for based on the data?

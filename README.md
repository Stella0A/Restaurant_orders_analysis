### Knowing how important SQL is I am taking the first quarter of 2025 to relearn and improve my SQL by practicing with various projects each week
# Project 1 Case Study - Restaurant_orders_analysis.

# Background
This data was obtained from Maven Analytics featuring a quarter's worth of orders from a fictitious restaurant serving international cuisine, including the date and time of each order, the items ordered, and additional details on the type, name, and price of the items.

## Analysis
- What were the least and most ordered items? What categories were they in?
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
| item_name | Quantity | category |
|----------|---------- |---------|
| Chicken Taco| 123  | Mexican |


### Most ordered item and category
      SELECT 
            m.item_name, 
            COUNT(m.item_name) as Quantity, 
            m.category
      FROM restaurant_db.menu_items as m
      JOIN restaurant_db.order_details as o
      ON m.menu_item_id = o.item_id
      GROUP BY m.item_name, m.category
      ORDER BY Quantity DESC
      LIMIT 1;
| item_name | Quantity | category |
|----------|---------- |---------|
| Hamburger | 622      | American |


### What do the highest spend orders look like? Which items did they buy and how much did they spend?
      SELECT 
          m.item_name,
          m.category,
          MAX(m.price) AS price
      FROM restaurant_db.menu_items AS m
      GROUP BY m.item_name, m.category
      ORDER BY price DESC
      LIMIT 5;
| item_name | category | price  |
|----------|---------- |---------|
| Shrimp Scampi    | Italian | 19.95
| Meat Lasagna	 | Italian |17.95
| Korean Beef Bowl | Asian	 | 17.95
| Pork Ramen       | Asian	| 17.95
| Spaghetti & Meatballs	| Italian | 17.95


### Were there certain times that had more or less orders?
      SELECT 
          HOUR(o.order_time) AS order_hour, 
          COUNT(o.order_id) AS total_orders
      FROM restaurant_db.order_details AS o
      GROUP BY order_hour
      ORDER BY total_orders DESC;
| order_hour | total_orders |
|----------|---|
| 12	|   1672 |
| 13	| 1575 |
| 17	|1370 |
| 18	| 1307 |
| 19	| 1085 |
| 16	| 1054 |
| 14	| 968  |
| 20	| 889  |
| 15	| 751  |
| 11	| 630  |
| 21	| 608  |
| 22	| 309  |
| 23	| 11   |
| 10	| 5    |


### Which cuisines should we focus on developing more menu items for based on the data?
      SELECT 
          m.category AS cuisine,
          COUNT(o.order_id) AS total_orders,
          SUM(m.price) AS total_sales
      FROM restaurant_db.order_details AS o
      JOIN restaurant_db.menu_items AS m
      ON o.item_id = m.menu_item_id
      GROUP BY m.category
      ORDER BY total_sales DESC;
      
| cuisine  | total_orders  | total_sales |
|----------|---------------|------------|
| Italian  |  2948	   | 49462.70 |
| Asian    |  3470	   | 46720.65 |
| Mexican  |  2945	   | 34796.80 |
| American |  2734	   | 28237.75 |



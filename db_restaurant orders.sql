#What were the least and most ordered items? What categories were they in?
#Least order item and category
SELECT m.item_name, COUNT(m.item_name) as Quantity, m.category
FROM restaurant_db.menu_items as m
JOIN restaurant_db.order_details as o
ON m.menu_item_id = o.item_id
GROUP BY m.item_name, m.category
ORDER BY Quantity ASC
LIMIT 1;

#Most ordered item and category
SELECT m.item_name, COUNT(m.item_name) as Quantity, m.category
FROM restaurant_db.menu_items as m
JOIN restaurant_db.order_details as o
ON m.menu_item_id = o.item_id
GROUP BY m.item_name, m.category
ORDER BY Quantity DESC
LIMIT 1;

#What do the highest spend orders look like? Which items did they buy and how much did they spend?    
SELECT 
    m.item_name,
    m.category,
    MAX(m.price) AS price
FROM 
    restaurant_db.menu_items AS m
GROUP BY 
    m.item_name, m.category
ORDER BY 
    price DESC
LIMIT 5;

#Were there certain times that had more or less orders?
SELECT 
    HOUR(o.order_time) AS order_hour, 
    COUNT(o.order_id) AS total_orders
FROM 
    restaurant_db.order_details AS o
GROUP BY 
    order_hour
ORDER BY 
    total_orders DESC;

#Which cuisines should we focus on developing more menu items for based on the data?
SELECT 
    m.category AS cuisine,
    COUNT(o.order_id) AS total_orders,
    SUM(m.price) AS total_sales
FROM 
    restaurant_db.order_details AS o
JOIN 
    restaurant_db.menu_items AS m
ON 
    o.item_id = m.menu_item_id
GROUP BY 
    m.category
ORDER BY 
    total_sales DESC;



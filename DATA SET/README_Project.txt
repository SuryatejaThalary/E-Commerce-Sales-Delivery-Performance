E-COMMERCE SALES & DELIVERY PERFORMANCE PROJECT

Tables:
1. Customers       - customer master
2. Products        - product master
3. Sellers         - seller master
4. Orders          - main sales fact table (60,000 rows)
5. Payments        - payment transactions (60,000 rows)
6. Deliveries      - delivery performance (60,000 rows)
7. Date_Dimension  - Power BI date dimension

Relationships:
Customers[customer_id]  1 ---- * Orders[customer_id]
Products[product_id]    1 ---- * Orders[product_id]
Sellers[seller_id]      1 ---- * Orders[seller_id]
Orders[order_id]        1 ---- 1 Payments[order_id]
Orders[order_id]        1 ---- 1 Deliveries[order_id]
Date_Dimension[date]    1 ---- * Orders[order_date]

Recommended Power BI model:
Date_Dimension -> Orders <- Customers
                         <- Products
                         <- Sellers
Orders -> Payments
Orders -> Deliveries

Main KPIs:
- Total Sales = SUM(Orders[net_sales])
- Total Profit = SUM(Orders[profit])
- Total Orders = DISTINCTCOUNT(Orders[order_id])
- Average Order Value = DIVIDE([Total Sales], [Total Orders])
- Average Delivery Days = AVERAGE(Deliveries[actual_delivery_days])
- On-Time Delivery % = DIVIDE(
    CALCULATE(COUNTROWS(Deliveries), Deliveries[delivery_status] = "On Time"),
    CALCULATE(COUNTROWS(Deliveries), Deliveries[delivery_status] IN {"On Time","Delayed","Early"})
  )
- Cancellation Rate
- Return Rate
- Discount %
- Sales by Category / Region / Channel
- Seller Performance
- Delivery Partner Performance
- Payment Method Performance

SQL practice areas:
SELECT, WHERE, ORDER BY, GROUP BY, HAVING, JOINs, CASE,
CTEs, subqueries, window functions, RANK/DENSE_RANK,
DATEPART, DATEDIFF, aggregations, NULL handling and views.
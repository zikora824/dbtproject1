Intern Task: End-to-End Data Modeling and Dashboard Project
Project Title: Fleet Spare Parts Sales Performance Analysis
Background / Business Context:
Our company manages sales of spare parts for fleet vehicles across different regions (Lagos, Abuja, Port Harcourt, Kano, Ibadan).
Management wants improved visibility into sales performance, customer behavior, and payment patterns.
You are to build a full data transformation pipeline using dbt, then create an interactive dashboard using Power BI, Looker Studio, or Tableau.
Dataset Overview (Provided CSVs):
1. customers.csv - Contains customer info: customer_id, customer_name, region, signup_date, customer_segment.
2. products.csv - Contains product info: product_id, product_name, category, price.
3. orders.csv - Contains transaction info: order_id, customer_id, order_date, product_id, quantity, total_amount, payment_status, payment_method.
4. payments.csv - Contains payment info for completed orders: order_id, payment_date, payment_method, amount_paid.
Task Deliverables:
1. DBT Data Modeling:
- Staging Models (stg_): Clean and standardize customers, products, orders, payments.
- Intermediate Models (int_): Join customers and orders (int_customer_orders), Join orders and payments (int_order_payments).
- Final Model (fct_): fct_customer_sales showing total sales, order count, average order value, payment completion rate.
2. DBT Testing:
- Apply tests for not null keys, unique keys, accepted values for payment status.
3. DBT Documentation:
- Document all models and columns.
4. Dashboard:
- KPIs: Total Sales, Number of Customers, Completed Orders. - Sales Trends: Over time.
- Sales by Region.
- Product Performance: Top-selling products.
- Payment Analysis: Completed vs Pending/Failed.
- Filters: Date, Region, Product.
5. Insights Summary:
- Write a 1-page summary of key insights from your analysis.
Stretch Goal (Optional):
- Implement incremental models in dbt. - Automate dashboard refresh.
What to Submit:
- DBT Project folder.
- Dashboard screenshots or link.

- 1-page insights summary.

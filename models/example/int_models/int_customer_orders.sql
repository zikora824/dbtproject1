with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
)

select customers.customer_id,customers.customer_name,customers.region,customers.signup_date,customers.customer_segment,
orders.order_id,orders.order_date::date,orders.product_id,
CASE
  WHEN orders.quantity::int > 0 THEN orders.quantity::int
  ELSE 1
END AS quantity,orders.total_amount,orders.payment_status,payment_method
from customers
left join  orders
    on orders.customer_id = customers.customer_id

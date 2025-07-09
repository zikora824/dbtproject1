with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
)

select 
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    orders.product_id,
    orders.quantity,
    orders.payment_status,
    orders.payment_method,
    CASE 
        WHEN payments.payment_date IS NULL THEN '1970-01-01'
        ELSE payments.payment_date
    END AS payment_date,

    CASE 
        WHEN payments.payment_method IS NULL THEN 'unknown'
        ELSE payments.payment_method
    END AS payment_method_1,

    CASE 
        WHEN payments.total_amount IS NULL THEN 0
        ELSE payments.total_amount
    END AS total_amount

    -- COALESC(payments.payment_date, '1970-01-01'),
    -- COALESC(payments.payment_method, 'unknown') as payment_method_paid,
    -- COALESC(payments.total_amount, 0)
from orders
left join payments
    on orders.order_id = payments.order_id



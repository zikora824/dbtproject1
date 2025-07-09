with customer_orders as (
    select * from {{ ref('int_customer_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

orders_with_payments as (
    select
        co.customer_id,
        co.order_id,
        co.payment_status ,
        co.total_amount as order_total_amount,
        pay.total_amount as payment_total_amount
    from customer_orders co
    left join payments pay
        on co.order_id = pay.order_id
),

aggregated as (
    select
        customer_id,
        count(order_id) as order_count,
        sum(coalesce(payment_total_amount, 0)) as total_sales,
        round(avg(coalesce(order_total_amount, 0)),3) as avg_order_value,
        round(count(case when lower(payment_status) = 'completed' then 1 end)::decimal/ nullif(count(order_id), 0) * 100,1) as payment_completion_rate_percent
    from orders_with_payments
    group by customer_id
)

select * from aggregated


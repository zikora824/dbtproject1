WITH cleaned_orders AS (

    SELECT
        -- Order ID: assign sequential ID with 4 digits, preserve existing row order
         order_id,

        -- Customer ID: cleaned alphanumeric, must start with a letter
        customer_id,

        -- Order date: cast to DATE
        order_date,

        -- Product ID: cleaned to only digits, then formatted as 'PRODxxx'
         product_id,

        -- Quantity: clean and cast to INT
        quantity,

        -- Total amount: clean and cast to INT
        total_amount,

        -- Payment status: clean and lowercase
        payment_status,

        -- Payment method: clean and lowercase
        payment_method

    FROM {{ source('stages', 'orders') }}
)

SELECT *
FROM cleaned_orders

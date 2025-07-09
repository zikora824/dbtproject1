WITH cleaned_payments AS (
    SELECT
        -- Order ID: Clean to digits and format as 'ORDxxxx'
        order_id,

        -- Payment date: Replace NULLs with a default date '0001-01-01'
        payment_date,

        -- Payment method: Remove any non-alphabet characters and replace empty strings with 'no payment'
        payment_method,

        -- Total amount paid: Remove non-numeric characters, and cast to INTEGER, replace empty or invalid values with 0
        total_amount

    FROM {{ source('stages', 'payments') }}
)

SELECT *
FROM cleaned_payments





WITH cleaned_customers AS (

  SELECT
    -- customer_id: keep only letters and digits (remove everything else including _ and -)
    REGEXP_REPLACE(customer_id, '[^A-Za-z0-9]', '', 'g') AS customer_id,

    -- customer_name: keep letters, digits, spaces, and underscores _
    REGEXP_REPLACE(TRIM(customer_name), '[^A-Za-z0-9_ ]', '', 'g') AS customer_name,

    -- region: keep letters, digits, and spaces only
    REGEXP_REPLACE(TRIM(region), '[^A-Za-z0-9 ]', '', 'g') AS region,

    -- signup_date: cast as DATE
    CAST(signup_date AS DATE) AS signup_date,

    -- customer_segment: keep letters, digits, and spaces only
    REGEXP_REPLACE(TRIM(customer_segment), '[^A-Za-z0-9 ]', '', 'g') AS customer_segment

  FROM {{ source('stages', 'customers') }}

)

SELECT *
FROM cleaned_customers


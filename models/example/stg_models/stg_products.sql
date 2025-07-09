WITH cleaned_products AS (

    SELECT
        -- Product ID: clean and format to 'PRODxxx'
        'PROD' || LPAD(REGEXP_REPLACE(product_id, '\D', '', 'g'), 3, '0') AS product_id,

        -- Product Name: remove digits/specials, trim, INITCAP
        INITCAP(
            REGEXP_REPLACE(TRIM(product_name::TEXT), '[^A-Za-z ]', '', 'g')
        ) AS product_name,

        -- Category: remove digits/specials, trim, INITCAP
        INITCAP(
            REGEXP_REPLACE(TRIM(category::TEXT), '[^A-Za-z ]', '', 'g')
        ) AS category,

        -- Price: remove any formatting, cast to INT
        CAST(REGEXP_REPLACE(TRIM(price::TEXT), '[^0-9]', '', 'g') AS INT) AS price

    FROM {{ source('stages', 'products') }}

)

SELECT *
FROM cleaned_products

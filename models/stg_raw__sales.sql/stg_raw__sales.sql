{{ config(materialized='view') }}

-- Load and rename raw sales data
WITH source AS (
    SELECT *
    FROM {{ source('raw', 'sales') }}
),

renamed AS (
    SELECT
        date_date,
        orders_id AS sales_id,
        pdt_id AS product_id,
        quantity,
        revenue AS amount
        -- Note: margin column not found in source, remove or calculate separately if needed
    FROM source
)

SELECT * FROM renamed

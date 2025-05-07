{{ config(materialized='view') }}

-- Load and clean raw product data
WITH source AS (
    SELECT * 
    FROM {{ source('raw', 'product') }}
),

renamed AS (
    SELECT
        products_id,
        CAST(purchSE_PRICE AS FLOAT64) AS purchase_price
    FROM source
)

SELECT * FROM renamed

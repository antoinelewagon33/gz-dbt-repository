{{ config(materialized='view') }}

WITH source AS (

    SELECT * FROM {{ source('raw', 'product') }}

),

renamed AS (

    SELECT
        products_id,
        name,
        CAST(purchse_price AS FLOAT64) AS purchase_price
    FROM source

)

SELECT * FROM renamed

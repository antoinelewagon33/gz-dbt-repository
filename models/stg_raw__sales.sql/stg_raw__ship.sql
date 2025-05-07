{{ config(materialized='view') }}

-- Load and clean raw shipping data
WITH source AS (
    SELECT *
    FROM {{ source('raw', 'ship') }}
),

renamed AS (
    SELECT
        orders_id,
        shipping_fee,
        -- Nous gardons uniquement shipping_fee et ignorons shipping_fee_1
        CAST(ship_cost AS FLOAT64) AS ship_cost,
        CAST(logCost AS FLOAT64) AS logistic_cost
    FROM source
)

SELECT * FROM renamed

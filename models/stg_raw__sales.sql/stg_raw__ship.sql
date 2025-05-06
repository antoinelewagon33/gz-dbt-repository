{{ config(materialized='view') }}

WITH source AS (

    SELECT * FROM {{ source('raw', 'ship') }}
    WHERE shipping_fee <> shipping_fee_1

),

renamed AS (

    SELECT
        orders_id,
        CAST(ship_cost AS FLOAT64) AS ship_cost,
        shipping_fee
    FROM source

)

SELECT * FROM renamed

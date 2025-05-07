{{ config(materialized='view') }}

WITH source AS (

    SELECT * FROM {{ source('raw', 'sales') }}

),

renamed AS (

    SELECT
        date_date,
        orders_id AS sales_id,
        pdt_id AS product_id,
        revenue AS amount,
        quantity
    FROM source

)

SELECT * FROM renamed

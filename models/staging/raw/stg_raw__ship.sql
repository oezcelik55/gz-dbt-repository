WITH source AS (
    SELECT * FROM {{ source('raw', 'ship') }}
),

renamed AS (
    SELECT
        orders_id,
        shipping_fee, -- shipping_fee_1'i almadık çünkü aynısı
        logcost AS log_cost,
        CAST(ship_cost AS INT64) AS ship_cost -- Sayıya çevirdik
    FROM source
)

SELECT * FROM renamed
WITH

stg_orders AS (
	SELECT * FROM {{ ref('stg_orders') }}
),

stg_customers AS (
	SELECT * FROM {{ ref('stg_customers') }}
),

stg_payments AS (
	SELECT * FROM {{ ref('stg_payments') }}
),

stg_exoplanets AS (
	SELECT * FROM {{ ref('stg_exoplanets') }}
)


SELECT
	DISTINCT 1 as x1, 2 as x2, 3 as x3, 4 as x4, 5 as x5, 6 as x6, 7 as x7, 8 as x8, 9 as x9, 10 as x10, 11 as x12, 13 as x13, 14 as x14
FROM stg_orders
UNION ALL 
SELECT 
    DISTINCT 1 as x1, 2 as x2, 3 as x3, 4 as x4, 5 as x5, 6 as x6, 7 as x7, 8 as x8, 9 as x9, 10 as x10, 11 as x12, 13 as x13, 14 as x14
FROM stg_exoplanets


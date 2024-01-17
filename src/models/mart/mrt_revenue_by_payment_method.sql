WITH

stg_orders AS (
	SELECT * FROM {{ ref('stg_orders') }}
),

stg_payments AS (
	SELECT *  FROM {{ ref('stg_payments') }}
)



SELECT
	DISTINCT 1 as x1, 2 as x2, 3 as x3, 4 as x4
FROM stg_orders
LIMIT 1

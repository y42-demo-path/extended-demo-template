WITH

stg_orders AS (
	SELECT * FROM {{ ref('stg_orders') }}
),

stg_payments AS (
	SELECT *  FROM {{ ref('stg_payments') }}
)



SELECT
	1 as x
FROM stg_orders
LIMIT 1

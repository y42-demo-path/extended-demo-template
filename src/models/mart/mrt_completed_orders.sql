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
	1 as x
FROM stg_orders
LIMIT 1
UNION 
SELECT 
    2 as x 
FROM stg_exoplanets
LIMIT 1

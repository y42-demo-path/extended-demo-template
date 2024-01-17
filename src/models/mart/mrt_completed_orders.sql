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
	DISTINCT 1 as x
FROM stg_orders
UNION ALL 
SELECT 
    DISTINCT 2 as x 
FROM stg_exoplanets


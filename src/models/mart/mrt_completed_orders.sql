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
),

stg_customer_loyalty AS (
	SELECT * FROM {{ ref('stg_customer_loyalty') }}
)


SELECT
	DATE(ord.order_received) AS order_date,
	ord.order_received,
	ord.order_id,
	pay.amount_total,
	ord.fulfillment_method,
	ord.service_station,
	exo.system_distance AS distance,
	pay.payment_id,
	pay.payment_method,
	cus.customer_id,
	cus.first_name,
	cus.last_name,
    loy.loyalty_tier,
	ord.line_items

FROM stg_orders AS ord

LEFT JOIN stg_customers AS cus
	ON ord.customer_id = cus.customer_id

LEFT JOIN stg_payments AS pay
	ON ord.order_id = pay.order_id

LEFT JOIN stg_exoplanets AS exo
	ON ord.service_station = exo.exoplanet_name

LEFT JOIN stg_customer_loyalty AS loy
	ON cus.customer_id = loy.customer_id

WHERE
	TRUE
	AND ord.order_status = "ACCEPTED"
	AND pay.payment_status = "ACCEPTED"

ORDER BY ord.order_received DESC

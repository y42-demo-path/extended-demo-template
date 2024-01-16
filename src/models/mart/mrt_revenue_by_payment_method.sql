WITH

stg_orders AS (
	SELECT "order_id",
        "customer_id",
        "fulfillment_method",
        "line_items",
        "service_station",
        "order_status",
        "order_received" FROM {{ ref('stg_orders') }}
),

stg_payments AS (
	SELECT "payment_id",
        "order_id",
        "amount_total",
        "payment_method",
        "payment_status" FROM {{ ref('stg_payments') }}
)


SELECT
	DATE(ord.order_received) AS order_date,
	pay.payment_method,
	SUM(pay.amount_total) AS gross_revenue,
	SUM(IF(ord.order_status = "ACCEPTED" AND pay.payment_status = "ACCEPTED", pay.amount_total, 0)) AS net_revenue

FROM stg_orders AS ord

LEFT JOIN stg_payments AS pay
	ON ord.order_id = pay.order_id

WHERE
	TRUE
	AND pay.payment_method IS NOT NULL

GROUP BY order_date, pay.payment_method
	
ORDER BY order_date DESC, pay.payment_method ASC

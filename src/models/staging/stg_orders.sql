WITH

source AS (
	SELECT * FROM {{ source('raw_space_fuel_shop', 'public_orders') }}
),

renamed AS (
	SELECT
		id AS order_id,
		customer_id,
		fulfillment_method,
		line_items,
		service_station,
		status,
		updated_at AS order_received
	FROM source
)

SELECT
	"order_id",
	"customer_id",
	"fulfillment_method",
	"line_items",
	"service_station",
	CASE
		WHEN status = "0" THEN "CANCELLED"
		WHEN status = "1" THEN "DECLINED"
		WHEN status = "2" THEN "ACCEPTED"
	END AS status

FROM renamed

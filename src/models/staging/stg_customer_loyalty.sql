WITH

source AS (
	SELECT * FROM {{ source('raw_customer_loyalty', 'Customer_loyalty_Customer_loyalty') }}
),

renamed AS (
	SELECT
		`Customer_ID` AS customer_id,
		parse_timestamp('%FT%TZ', `Member_since`) AS member_since,
		cast(source.`Points` AS int) AS total_points,
		tier AS tier
	FROM source
)

SELECT
	customer_id,
	member_since,
	total_points,
	tier AS loyalty_tier

FROM renamed

ORDER BY member_since ASC

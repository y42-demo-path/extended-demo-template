WITH

source AS (
	SELECT * FROM {{ source('raw_customer_loyalty', 'Customer_loyalty_Customer_loyalty') }}
),

renamed AS (
	SELECT
		`Customer_ID` AS customer_id,
		Member_since AS member_since,
		cast(source.`Points` AS int) AS total_points,
		tier AS tier
	FROM source
)

SELECT
	customer_id,
	member_since,
	total_points,
	tier AS loyalty_level,
	CASE
		WHEN tier = "1" THEN "BRONZE"
		WHEN tier = "2" THEN "SILVER"
		WHEN tier = "3" THEN "GOLD"
		WHEN tier = "4" THEN "PLATINUM"
		WHEN tier = "5" THEN "DIAMOND"
	END AS loyalty_tier

FROM renamed

ORDER BY member_since ASC

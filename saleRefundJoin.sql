
-- Sale and Refund Pair 1

(SELECT *
FROM group_6."TRNSACT"
WHERE "STYPE"  = 'R'
AND "SKU" = '3644059'
AND "TRANNUM" = '01900'
AND "SEQ" = '742200017'
AND "INTERID" = '288300156'
)

UNION

(SELECT  *
FROM group_6."TRNSACT"
WHERE "STYPE"  = 'P'
AND "SKU" = '3644059'
-- AND "TRANNUM" = '01900'
--AND "SEQ" = '742200017'
AND "INTERID" = '288300156'
LIMIT 1)


--------------------------------------

-- Sale and Refund Pair 2


(
SELECT *
FROM group_6."TRNSACT"
WHERE "STYPE"  = 'P'
AND "SKU" = '3120236'
-- AND "TRANNUM" = '01900'
--AND "SEQ" = '742200017'
AND "INTERID" = '335300212'
)

UNION
(
SELECT *
FROM group_6."TRNSACT"
WHERE "STYPE"  = 'R'
AND "SKU" = '3120236'
AND "TRANNUM" = '03900'
AND "SEQ" = '321100003'
AND "INTERID" = '335300212'
)


--------------------------------------------------------------------


-- Counts of nonzero INTERID

SELECT 

SUM(CASE 
		WHEN "INTERID" = '000000000' THEN 1
		ELSE 0
	END) AS ZERO_COUNT,
SUM(CASE 
		WHEN "INTERID" = '000000000' THEN 0
		ELSE 1
	END) AS NON_ZERO
FROM group_6."TRNSACT"
WHERE "STYPE"  = 'R'



-- ZERO:6,259,597	NON-ZERO: 3,008,205


---------------------------------------

-- JOINING Sale and Refunds


SELECT 
SALE."SKU", 
SALE."SALEDATE" AS SALE_DATE,
SALE."STORE" AS SALE_STORE,
REFUND."SALEDATE" AS REFUND_DATE,
REFUND."STORE" AS REFUND_STORE
FROM group_6."TRNSACT" AS SALE
INNER JOIN group_6."TRNSACT" AS REFUND
ON SALE."INTERID" = REFUND."INTERID"
AND SALE."SKU" = REFUND."SKU"
WHERE SALE."STYPE"  = 'P'
AND REFUND."STYPE" = 'R'
AND REFUND."SALEDATE" >= SALE."SALEDATE"
LIMIT 100



--------------------------------------


-- GROUP BY the tables first and then join the queries to avoid duplications in join


SELECT
SALE."SKU", 
SALE."SALEDATE" AS SALE_DATE,
SALE."STORE" AS SALE_STORE,
REFUND."SALEDATE" AS REFUND_DATE,
REFUND."STORE" AS REFUND_STORE
FROM
(
SELECT "SKU", "STORE", "REGISTER", "TRANNUM", "SALEDATE", "SEQ", "INTERID", "STYPE"
FROM group_6."TRNSACT"
WHERE "STYPE"  = 'P'
GROUP BY "SKU", "STORE", "REGISTER", "TRANNUM", "SALEDATE", "SEQ", "INTERID", "STYPE"
) AS SALE

INNER JOIN

(
SELECT "SKU", "STORE", "REGISTER", "TRANNUM", "SALEDATE", "SEQ", "INTERID", "STYPE"
FROM group_6."TRNSACT"
WHERE "STYPE"  = 'R'
GROUP BY "SKU", "STORE", "REGISTER", "TRANNUM", "SALEDATE", "SEQ", "INTERID", "STYPE"
) AS REFUND

ON SALE."INTERID" = REFUND."INTERID"
WHERE  REFUND."SALEDATE" >= SALE."SALEDATE"
LIMIT 100



/* 
Is there a refund period such as 1 months that should be added as a filter in the WHERE statement ?
There are Refund matches that are months later than the purchase.
*/











LIMIT 10




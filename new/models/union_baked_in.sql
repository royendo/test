WITH first_half AS (
  SELECT
      Advertiser,
      Product,
      Metrics,
      DateColumn,
      Revenue
  FROM "Baked_in_Jan_June"
  UNPIVOT (
      Revenue FOR DateColumn IN (
          '1/1/2024', '1/8/2024', '1/15/2024', '1/22/2024', '1/29/2024',
          '2/5/2024', '2/12/2024', '2/19/2024', '2/26/2024', '3/4/2024',
          '3/11/2024', '3/18/2024', '3/25/2024', '4/1/2024', '4/8/2024',
          '4/15/2024', '4/22/2024', '4/29/2024', '5/6/2024', '5/13/2024',
          '5/20/2024', '5/27/2024', '6/3/2024', '6/10/2024', '6/17/2024',
          '6/24/2024'
      )
  )
),
second_half AS (
  SELECT
      Advertiser,
      Product,
      Metrics,
      DateColumn,
      Revenue
  FROM "Baked_In_July_Dec"
  UNPIVOT (
      Revenue FOR DateColumn IN (
          '11/4/2024', '11/11/2024', '11/18/2024', '12/2/2024', '12/9/2024',
          '7/8/2024', '8/19/2024', '11/25/2024', '8/12/2024', '10/21/2024',
          '9/9/2024', '7/22/2024', '12/16/2024', '9/16/2024', '10/14/2024',
          '9/23/2024', '8/5/2024', '7/15/2024', '9/2/2024', '10/7/2024',
          '10/28/2024', '8/26/2024', '9/16/2024', '7/29/2024', '7/1/2024',
          '7/8/2024', '9/23/2024', '12/23/2024'
      )
  )
)
SELECT 
    CAST(STRPTIME(DateColumn, '%m/%d/%Y') AS DATE) AS datetime,
    Advertiser,
    Product,
    Metrics,
    Revenue,
    -- Assign Sales Channel Type based on Product value
    CASE
        WHEN Product LIKE '%Podcast%' THEN 'Baked In'
        WHEN Product LIKE '%Social%' THEN 'Social'
        ELSE 'Other'
    END AS "Sales Channel Type"
FROM first_half
UNION ALL
SELECT 
    CAST(STRPTIME(DateColumn, '%m/%d/%Y') AS DATE) AS datetime,
    Advertiser,
    Product,
    Metrics,
    Revenue,
    -- Assign Sales Channel Type based on Product value
    CASE
        WHEN Product LIKE '%Podcast%' THEN 'Baked In'
        WHEN Product LIKE '%Social%' THEN 'Social'
        ELSE 'Other'
    END AS "Sales Channel Type"
FROM second_half
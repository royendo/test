WITH BNB_Aggregated AS (
    SELECT 
        Publisher,
        Advertiser,
        Metrics,
        
        sales AS sales,
        date,
        NULL AS Audio_Impressions,
        NULL AS Total_Revenue_USD,
        NULL AS Sales_Channel_Type,
        NULL AS Sales_Channel_ID,
        NULL AS Sales_Channel,
        NULL AS Impressions,
        'BNB' AS earning_type
    FROM 
        BNB_model_tz
),
Direct_Aggregated AS (
    SELECT 
        "Publisher" AS Publisher,
        "Advertiser" AS Advertiser,
        NULL AS Metrics,
        "Total Revenue (USD)" AS sales,
        date,
        "Audio Impressions" AS Audio_Impressions,
        "Total Revenue (USD)" AS Total_Revenue_USD,
        NULL AS Sales_Channel_Type,
        NULL AS Sales_Channel_ID,
        NULL AS Sales_Channel,
        NULL AS Impressions,
        'DIRECT' AS earning_type
    FROM 
        DIRECT_model
),
Programmatic_Aggregated AS (
    SELECT 
        "Publisher" AS Publisher,
        NULL AS Advertiser,
        NULL AS Metrics,
        "Net Revenue (USD)" AS sales,
        date,
        NULL AS Audio_Impressions,
        NULL AS Total_Revenue_USD,
        "Sales Channel Type" AS Sales_Channel_Type,
        "Sales Channel ID" AS Sales_Channel_ID,
        "Sales Channel" AS Sales_Channel,
        "Impressions" AS Impressions,
        'PROGRAMMATIC' AS earning_type
    FROM 
        PROGRAMMATIC_model
)

SELECT * FROM BNB_Aggregated
UNION ALL
SELECT * FROM Direct_Aggregated
UNION ALL
SELECT * FROM Programmatic_Aggregated 
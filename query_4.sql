SELECT campaign_name, channel, spend, clicks, conversions, ROUND(spend * 1.0 / NULLIF(conversions, 0), 2) AS [cpa],
CASE
WHEN spend * 1.0 / conversions < 15 THEN 'Great'
WHEN spend * 1.0 / conversions BETWEEN 15 AND 30 THEN 'Okay'
WHEN spend * 1.0 / conversions > 30 THEN 'Poor'
ELSE 'Unknown'
END AS cpa_rating
FROM campaigns
WHERE date BETWEEN '2025-02-01' AND '2025-02-28'
ORDER BY [cpa] ASC
LIMIT 3;

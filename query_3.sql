SELECT campaign_name, channel, spend, revenue, ROUND(revenue * 1.0 / NULLIF(spend, 0), 2) AS roas,
CASE
WHEN revenue * 1.0 / NULLIF(spend, 0) >= 4 THEN 'High'
WHEN revenue * 1.0 / NULLIF(spend, 0) BETWEEN 2 AND 3.99 THEN 'Good'
WHEN revenue * 1.0 / NULLIF(spend, 0) < 2 THEN 'Low'
ELSE 'X'
END AS roas_label
FROM campaigns
WHERE date BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY campaign_name, channel,
ORDER BY roas DESC
LIMIT 5;

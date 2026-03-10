SELECT channel, SUM(spend) AS [total_spend], SUM(revenue) AS [total_revenue], SUM(clicks) AS [total_clicks], COUNT(campaign_id) AS [total_camapigns]
ROUND(SUM(revenue) * 1.0 / NULLIF(SUM(SPEND), 0), 2) AS [avg_roas], ROUND(SUM(spend) * 1.0 / NULLIF(SUM(clicks), 0), 2) as [avg_cpc]
FROM campaigns
WHERE date BETWEEN '2025-02-01' AND '2025-02-14'
GROUP BY channel
HAVING COUNT (campaign_id) >= 2
ORDER BY [total_spend] DESC;

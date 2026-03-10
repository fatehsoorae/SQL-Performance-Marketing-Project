SELECT chanel, SUM(spend) AS [total_spend], SUM(revenue) AS [total_reveue]
ROUND(SUM(revenue) * 1.0 / NULLIF(SUM(SPEND), 0), 2) AS [avg_roas], COUNT(camapign_id) AS [total_campaigns],
SUM(CASE WHEN revenue * 1.0 / spend  >= 3 THEN 1 ELSE 0 END) AS profitable_camaigns
FROM camapgins
WHERE date BETWEEN '2025-02-01' AND '2025-02-28'
GROUP BY CHANNEL
ORDER BY [profitable_campaigns] DESC;

SELECT sum(event_amount_usd) AS total_usd, event_from_address_name, event_currency, date_trunc('day', block_timestamp) AS dt
FROM terra.transfers
WHERE event_from = 'terra13yxhrk08qvdf5zdc9ss5mwsg5sf7zva9xrgwgc'
AND dt > CURRENT_DATE - 30
AND event_currency IN ('LUNA', 'UST')
GROUP BY 2,3,4
UNION
SELECT sum(event_amount_usd) *-1 AS total_usd, event_from_address_name, event_currency, date_trunc('day', block_timestamp) AS dt
FROM terra.transfers 
WHERE event_to = 'terra13yxhrk08qvdf5zdc9ss5mwsg5sf7zva9xrgwgc'
AND dt > CURRENT_DATE - 30
AND event_currency IN ('LUNA', 'UST')
GROUP BY 2,3,4
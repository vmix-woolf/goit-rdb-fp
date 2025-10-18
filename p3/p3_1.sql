USE pandemic;

-- Аналіз випадків сказу (rabies) за країнами
SELECT
    c.name AS country,
    c.code AS country_code,
    ROUND(AVG(ic.number_rabies), 3) AS avg_rabies,
    ROUND(MIN(ic.number_rabies), 3) AS min_rabies,
    ROUND(MAX(ic.number_rabies), 3) AS max_rabies,
    ROUND(SUM(ic.number_rabies), 3) AS total_rabies
FROM infectious_cases ic
         JOIN countries c ON ic.country_id = c.id
WHERE ic.number_rabies IS NOT NULL
GROUP BY c.name, c.code
ORDER BY avg_rabies DESC
LIMIT 10;

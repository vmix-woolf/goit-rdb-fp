SELECT
    c.name AS country,
    ic.year,
    get_years_diff(ic.year) AS years_diff
FROM infectious_cases ic
         JOIN countries c ON ic.country_id = c.id
ORDER BY ic.year ASC
LIMIT 10;

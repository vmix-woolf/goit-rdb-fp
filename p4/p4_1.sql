USE pandemic;

-- Побудова дати 1 січня року, поточної дати і різниці в роках
SELECT
    c.name AS country,           		-- Для наочності покажемо країну
    ic.year AS year_value,       		-- Початковий рік з таблиці
    MAKEDATE(ic.year, 1) AS year_start_date,  -- Дата першого січня відповідного року
    CURDATE() AS current_date_value,   	-- Поточна дата (без часу)
    TIMESTAMPDIFF(
            YEAR,
            MAKEDATE(ic.year, 1),
            CURDATE()
    ) AS years_diff              		-- Різниця в роках між двома датами
FROM infectious_cases ic
    JOIN countries c ON c.id = ic.country_id
    WHERE ic.year IS NOT NULL    		-- Відсіюємо порожні значення року
    ORDER BY ic.year
    LIMIT 10;

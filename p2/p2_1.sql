USE pandemic;

-- Створюємо таблицю країн з унікальними назвами та кодами
CREATE TABLE countries AS
SELECT DISTINCT
    country AS name,
    country_code AS code
FROM infectious_cases
ORDER BY country;

-- Додаємо первинний ключ для таблиці countries
ALTER TABLE countries
    ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

-- Додаємо колонку country_id у таблицю infectious_cases
ALTER TABLE infectious_cases
    ADD COLUMN country_id INT NULL;

-- Додаємо первинний ключ до infectious_cases ДО створення зв'язку
ALTER TABLE infectious_cases
    ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

-- Оновлюємо значення country_id відповідно до таблиці countries
SET SQL_SAFE_UPDATES = 0;

UPDATE infectious_cases ic
    JOIN countries c ON ic.country = c.name
SET ic.country_id = c.id;

SET SQL_SAFE_UPDATES = 1;

-- Видаляємо старі колонки, що дублюються
ALTER TABLE infectious_cases
    DROP COLUMN country,
    DROP COLUMN country_code;

-- Додаємо зовнішній ключ (зв’язок з таблицею countries)
ALTER TABLE infectious_cases
    ADD CONSTRAINT fk_country
        FOREIGN KEY (country_id) REFERENCES countries(id);

-- Переміщуємо колонку id на перше місце у таблиці countries
ALTER TABLE countries
    MODIFY COLUMN id INT AUTO_INCREMENT FIRST;

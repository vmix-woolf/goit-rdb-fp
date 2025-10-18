CREATE FUNCTION `get_years_diff`(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    -- Якщо на вхід прийшов NULL — повертаємо NULL
    IF input_year IS NULL THEN
        RETURN NULL;
    END IF;

    -- Різниця в роках між 1 січня заданого року та поточною датою
    RETURN TIMESTAMPDIFF(
        YEAR,
        MAKEDATE(input_year, 1),  -- будуємо дату 'YYYY-01-01'
        CURDATE()                 -- поточна дата
    );
END

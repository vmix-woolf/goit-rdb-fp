USE pandemic;

SET SQL_SAFE_UPDATES = 0;

-- Оновлення порожніх рядків до NULL, щоб уникнути помилок при зміні типів
UPDATE infectious_cases
SET
    Number_yaws = NULLIF(Number_yaws, ''),
    polio_cases = NULLIF(polio_cases, ''),
    cases_guinea_worm = NULLIF(cases_guinea_worm, ''),
    Number_rabies = NULLIF(Number_rabies, ''),
    Number_malaria = NULLIF(Number_malaria, ''),
    Number_hiv = NULLIF(Number_hiv, ''),
    Number_tuberculosis = NULLIF(Number_tuberculosis, ''),
    Number_smallpox = NULLIF(Number_smallpox, ''),
    Number_cholera_cases = NULLIF(Number_cholera_cases, '');

-- Зміна структури таблиці відповідно до типів даних
ALTER TABLE infectious_cases
    MODIFY Entity VARCHAR(255) NOT NULL,
    MODIFY Code VARCHAR(30) NULL,
    MODIFY Year INT NULL,
    MODIFY Number_yaws FLOAT NULL DEFAULT NULL,
    MODIFY polio_cases INT NULL DEFAULT NULL,
    MODIFY cases_guinea_worm INT NULL DEFAULT NULL,
    MODIFY Number_rabies FLOAT NULL DEFAULT NULL,
    MODIFY Number_malaria FLOAT NULL DEFAULT NULL,
    MODIFY Number_hiv FLOAT NULL DEFAULT NULL,
    MODIFY Number_tuberculosis FLOAT NULL DEFAULT NULL,
    MODIFY Number_smallpox FLOAT NULL DEFAULT NULL,
    MODIFY Number_cholera_cases INT NULL DEFAULT NULL;

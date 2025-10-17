-- Перейменування колонок у стилі snake_case та уніфікація назв
ALTER TABLE infectious_cases
    CHANGE COLUMN Entity country VARCHAR(255) NOT NULL,
    CHANGE COLUMN Code country_code VARCHAR(10) NULL,
    CHANGE COLUMN Year year INT NULL,
    CHANGE COLUMN Number_yaws number_yaws FLOAT NULL DEFAULT NULL,
    CHANGE COLUMN polio_cases polio_cases INT NULL DEFAULT NULL,
    CHANGE COLUMN cases_guinea_worm guinea_worm_cases INT NULL DEFAULT NULL,
    CHANGE COLUMN Number_rabies number_rabies FLOAT NULL DEFAULT NULL,
    CHANGE COLUMN Number_malaria number_malaria FLOAT NULL DEFAULT NULL,
    CHANGE COLUMN Number_hiv number_hiv FLOAT NULL DEFAULT NULL,
    CHANGE COLUMN Number_tuberculosis number_tuberculosis FLOAT NULL DEFAULT NULL,
    CHANGE COLUMN Number_smallpox number_smallpox FLOAT NULL DEFAULT NULL,
    CHANGE COLUMN Number_cholera_cases cholera_cases INT NULL DEFAULT NULL;

DESCRIBE infectious_cases;

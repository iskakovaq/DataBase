CREATE DATABASE lab2;
CREATE table countries(
                          country_id serial primary key ,
                          country_name varchar (50),
                          region_id integer,
                          population integer);
INSERT INTO countries VALUES (1, 'Austria', 7, 100000);

INSERT INTO countries (country_id, country_name) VALUES (2, 'Italy');

INSERT INTO countries VALUES (3, 'China', NULL);

INSERT INTO countries (country_name, region_id, population) VALUES ('India', 4, 200000),
                                                                               ('Pakistan', 5, 300000),
                                                                               ('France', 6,500000);
ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries VALUES (DEFAULT, DEFAULT, 1,200000);

INSERT INTO countries VALUES (DEFAULT);

CREATE TABLE countries_new(
    LIKE countries);
INSERT INTO countries_new SELECT * FROM countries;
UPDATE countries SET region_id = 1 WHERE region_id IS NULL;
UPDATE countries SET population = population * 1.1 RETURNING country_name, population AS "New Population";
DELETE FROM countries WHERE population < 100000;
DELETE FROM countries_new  USING countries  WHERE countries_new.country_id=countries.country_id RETURNING*;
DELETE FROM countries RETURNING *;
SELECT * FROM countries;
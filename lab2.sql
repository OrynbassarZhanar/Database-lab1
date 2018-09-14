CREATE DATABASE  lab_2;
CREATE TABLE countries(
  country_id SERIAL CONSTRAINT o_key PRIMARY KEY,
  country_name varchar(50),
  region_id INTEGER,
  population INTEGER
);
select * from countries;
INSERT INTO countries VALUES (1, 'Kazakhstan', 3, 70000);
INSERT INTO countries VALUES (2, 'China', 6, 2000000);
INSERT INTO countries VALUES (3, 'USA');
INSERT INTO countries (country_id, region_id) VALUES (DEFAULT, NULL);
INSERT INTO countries VALUES (DEFAULT, 'Russia', 11, 45000),
                             (DEFAULT, 'Spain', 9, 64000),
                             (DEFAULT , 'France', 7, 45000);
ALTER TABLE ONLY countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
INSERT INTO countries (country_name) VALUES (DEFAULT);
INSERT INTO countries VALUES (DEFAULT);
CREATE TABLE countries_new ( LIKE countries including all);
INSERT INTO countries_new select * from countries;
UPDATE countries SET region_id=1 WHERE region_id is NULL;
UPDATE countries SET population=(population*0.1)+population
RETURNING country_name, population AS "New Population";
DELETE FROM countries WHERE population <100000;
DELETE FROM countries_new USING countries WHERE countries_new.country_id=countries.country_id
RETURNING *;
DELETE FROM countries RETURNING *;
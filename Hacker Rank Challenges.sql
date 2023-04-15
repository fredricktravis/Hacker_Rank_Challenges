/* 1. Query the NAME field for all American cities in the CITY table with populations larger than 120000.
The CountryCode for America is USA.*/
SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND CountryCode = 'USA';

/* 2. Query all columns for all American cities in the CITY table with populations larger than 100000.
The CountryCode for America is USA.*/
SELECT *
FROM CITY
WHERE POPULATION > 100000 AND CountryCode = 'USA';

/* 3. Query all columns (attributes) for every row in the CITY table.*/
SELECT *
FROM CITY;

/* 4. Query all columns for a city in CITY with the ID 1661.*/
SELECT *
FROM CITY
WHERE ID = 1661;

/* 5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN*/
SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/* 6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN*/
SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/* 7. Query a list of CITY and STATE from the STATION table.*/
SELECT CITY, STATE
FROM STATION;

/* 8. Query a list of CITY names from STATION for cities that have an even ID number.
Print the results in any order, but exclude duplicates from the answer. */
SELECT
DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0;

/* 9. Find the difference between the total number of CITY entries in the table
and the number of distinct CITY entries in the table. */
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;

/* 10. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths
(i.e.: number of characters in the name).
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.*/
SELECT CITY, LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) >= ALL(SELECT LENGTH(CITY) FROM STATION)
ORDER BY CITY;
SELECT CITY, LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) <= ALL(SELECT LENGTH(CITY) FROM STATION)
ORDER BY CITY
LIMIT 1;

/* 11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
Your result cannot contain duplicates.*/
SELECT CITY
FROM STATION
WHERE CITY LIKE 'A%';
SELECT CITY
FROM STATION
WHERE CITY LIKE 'E%';
SELECT CITY
FROM STATION
WHERE CITY LIKE 'I%';
SELECT CITY
FROM STATION
WHERE CITY LIKE 'O%';
SELECT CITY
FROM STATION
WHERE CITY LIKE 'U%';

/* 12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.*/
SELECT
DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a';
SELECT
DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%e';
SELECT
DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%i';
SELECT
DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%o';
SELECT
DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%u';

/* 13. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%') AND (CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')
ORDER BY CITY;

/* 14. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
SELECT
DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

/* 15. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates*/
SELECT
DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, LENGTH(CITY), 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

/* 16. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
Your result cannot contain duplicates*/
SELECT
DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u') OR LOWER(SUBSTR(CITY, LENGTH(CITY), 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

/* 17. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
Your result cannot contain duplicates.*/
SELECT
DISTINCT CITY
FROM STATION
WHERE LOWER(SUBSTR(CITY, 1, 1)) NOT IN ('a', 'e', 'i', 'o', 'u') AND LOWER(SUBSTR(CITY, LENGTH(CITY), 1)) NOT IN ('a', 'e', 'i', 'o', 'u');

/* 18. Query the Name of any student in STUDENTS who scored higher than 75 Marks.
Order your output by the last three characters of each name.
If two or more students both have names ending in the same last three characters
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.*/
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75 ORDER BY SUBSTR(NAME, LENGTH(NAME)-2, 3), ID;

/* 19. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order*/
SELECT name
FROM Employee ORDER BY name ASC;

/* 20. Write a query that prints a list of employee names (i.e.: the name attribute)
for employees in Employee having a salary greater than 2000 per month who have been employees for less than 10 months.
Sort your result by ascending employee_id.*/
SELECT name
FROM Employee
WHERE SALARY > 2000 AND MONTHS < 10
ORDER BY employee_id ASC;
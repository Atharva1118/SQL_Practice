
USE StarterSQL;

-- =========================================================
-- STRING FUNCTIONS
-- =========================================================

-- LENGTH()
-- Definition: Returns the length of a string in bytes.
SELECT name, LENGTH(name) AS name_length
FROM users;


-- CHAR_LENGTH()
-- Definition: Returns the number of characters in a string.
SELECT name, CHAR_LENGTH(name) AS character_count
FROM users;


-- UPPER()
-- Definition: Converts a string to uppercase.
SELECT name, UPPER(name) AS uppercase_name
FROM users;


-- LOWER()
-- Definition: Converts a string to lowercase.
SELECT email, LOWER(email) AS lowercase_email
FROM users;


-- CONCAT()
-- Definition: Combines two or more strings into one string.
SELECT CONCAT(name, ' - ', email) AS user_details
FROM users;


-- CONCAT_WS()
-- Definition: Combines strings using a specified separator.
SELECT CONCAT_WS(' | ', name, gender, email) AS user_details
FROM users;


-- SUBSTRING()
-- Definition: Extracts a specified part of a string.
SELECT name, SUBSTRING(name, 1, 3) AS first_three_characters
FROM users;


-- LEFT()
-- Definition: Returns a specified number of characters from the left side of a string.
SELECT name, LEFT(name, 3) AS first_three_characters
FROM users;


-- RIGHT()
-- Definition: Returns a specified number of characters from the right side of a string.
SELECT name, RIGHT(name, 3) AS last_three_characters
FROM users;


-- TRIM()
-- Definition: Removes leading and trailing spaces from a string.
SELECT name, TRIM(name) AS trimmed_name
FROM users;


-- REPLACE()
-- Definition: Replaces occurrences of a specified string with another string.
SELECT email, REPLACE(email, '@gmail.com', '@example.com') AS new_email
FROM users;


-- REVERSE()
-- Definition: Reverses the characters in a string.
SELECT name, REVERSE(name) AS reversed_name
FROM users;


-- INSTR()
-- Definition: Returns the position of the first occurrence of a substring.
SELECT email, INSTR(email, '@') AS at_position
FROM users;


-- =========================================================
-- NUMERIC FUNCTIONS
-- =========================================================

-- ABS()
-- Definition: Returns the absolute (positive) value of a number.
SELECT salary, ABS(salary) AS absolute_salary
FROM users;


-- CEIL()
-- Definition: Rounds a number upward to the nearest integer.
SELECT salary, CEIL(salary) AS rounded_up_salary
FROM users;


-- FLOOR()
-- Definition: Rounds a number downward to the nearest integer.
SELECT salary, FLOOR(salary) AS rounded_down_salary
FROM users;


-- ROUND()
-- Definition: Rounds a number to the specified number of decimal places.
SELECT salary, ROUND(salary, 0) AS rounded_salary
FROM users;


-- TRUNCATE()
-- Definition: Removes decimal places without rounding the number.
SELECT salary, TRUNCATE(salary, 1) AS truncated_salary
FROM users;


-- MOD()
-- Definition: Returns the remainder of a division.
SELECT id, MOD(id, 2) AS remainder
FROM users;


-- POWER()
-- Definition: Returns a number raised to the specified power.
SELECT salary, POWER(salary, 2) AS salary_power
FROM users;


-- SQRT()
-- Definition: Returns the square root of a number.
SELECT salary, SQRT(salary) AS square_root
FROM users;


-- RAND()
-- Definition: Returns a random floating-point number between 0 and 1.
SELECT name, RAND() AS random_number
FROM users;


-- SIGN()
-- Definition: Returns -1 for negative, 0 for zero, and 1 for positive numbers.
SELECT salary, SIGN(salary) AS salary_sign
FROM users;


-- =========================================================
-- DATE AND TIME FUNCTIONS
-- =========================================================

-- NOW()
-- Definition: Returns the current date and time.
SELECT NOW() AS current_datetime;


-- CURDATE()
-- Definition: Returns the current date.
SELECT CURDATE() AS current_date;


-- CURTIME()
-- Definition: Returns the current time.
SELECT CURTIME() AS current_time;


-- DATE()
-- Definition: Extracts the date part from a date or datetime value.
SELECT created_at, DATE(created_at) AS created_date
FROM users;


-- YEAR()
-- Definition: Extracts the year from a date.
SELECT name, YEAR(date_of_birth) AS birth_year
FROM users;


-- MONTH()
-- Definition: Extracts the month number from a date.
SELECT name, MONTH(date_of_birth) AS birth_month
FROM users;


-- DAY()
-- Definition: Extracts the day of the month from a date.
SELECT name, DAY(date_of_birth) AS birth_day
FROM users;


-- HOUR()
-- Definition: Extracts the hour from a time or datetime value.
SELECT name, HOUR(created_at) AS created_hour
FROM users;


-- MINUTE()
-- Definition: Extracts the minute from a time or datetime value.
SELECT name, MINUTE(created_at) AS created_minute
FROM users;


-- SECOND()
-- Definition: Extracts the second from a time or datetime value.
SELECT name, SECOND(created_at) AS created_second
FROM users;


-- DATEDIFF()
-- Definition: Returns the difference between two dates in days.
SELECT name, DATEDIFF(CURDATE(), date_of_birth) AS days_difference
FROM users;


-- DATE_ADD()
-- Definition: Adds a specified time interval to a date.
SELECT name,
       DATE_ADD(date_of_birth, INTERVAL 1 YEAR) AS date_after_one_year
FROM users;


-- DATE_SUB()
-- Definition: Subtracts a specified time interval from a date.
SELECT name,
DATE_SUB(date_of_birth, INTERVAL 1 YEAR) AS date_before_one_year
FROM users;


-- DAYNAME()
-- Definition: Returns the name of the weekday for a given date.
SELECT name, DAYNAME(date_of_birth) AS birth_day_name
FROM users;


-- MONTHNAME()
-- Definition: Returns the name of the month for a given date.
SELECT name, MONTHNAME(date_of_birth) AS birth_month_name
FROM users;


-- =========================================================
-- AGGREGATE FUNCTIONS
-- =========================================================

-- COUNT()
-- Definition: Counts the number of rows or non-NULL values.
SELECT COUNT(*) AS total_users
FROM users;


-- SUM()
-- Definition: Calculates the total sum of a numeric column.
SELECT SUM(salary) AS total_salary
FROM users;


-- AVG()
-- Definition: Calculates the average value of a numeric column.
SELECT AVG(salary) AS average_salary
FROM users;


-- MIN()
-- Definition: Returns the smallest value from a column.
SELECT MIN(salary) AS minimum_salary
FROM users;


-- MAX()
-- Definition: Returns the largest value from a column.
SELECT MAX(salary) AS maximum_salary
FROM users;


-- =========================================================
-- NULL FUNCTIONS
-- =========================================================

-- IFNULL()
-- Definition: Returns an alternative value when the given value is NULL.
SELECT name, IFNULL(salary, 0) AS salary
FROM users;


-- COALESCE()
-- Definition: Returns the first non-NULL value from a list of expressions.
SELECT name,
       COALESCE(email, 'No Email') AS email
FROM users;


-- NULLIF()
-- Definition: Returns NULL if two expressions are equal; otherwise returns the first expression.
SELECT name, NULLIF(salary, 0) AS salary
FROM users;


-- =========================================================
-- CONDITIONAL FUNCTIONS
-- =========================================================

-- IF()
-- Definition: Returns one value if a condition is TRUE and another value if FALSE.
SELECT name,
       IF(is_active = 1, 'Active', 'Inactive') AS status
FROM users;


-- CASE
-- Definition: Checks multiple conditions and returns a value for the first TRUE condition.
SELECT name,
       salary,
       CASE
           WHEN salary >= 100000 THEN 'High'
           WHEN salary >= 50000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_category
FROM users;


-- =========================================================
-- TYPE CONVERSION FUNCTIONS
-- =========================================================

-- CAST()
-- Definition: Converts a value from one data type to another.
SELECT name,
       CAST(salary AS UNSIGNED) AS converted_salary
FROM users;


-- CONVERT()
-- Definition: Converts a value from one data type to another.
SELECT name,
       CONVERT(salary, UNSIGNED) AS converted_salary
FROM users;

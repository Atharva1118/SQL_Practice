-- ============================================================
-- MYSQL UNION AND UNION ALL
-- ============================================================

USE startersql;


-- ============================================================
-- CREATE ADMIN_USERS TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS admin_users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary INT
);


-- ============================================================
-- INSERT DATA INTO ADMIN_USERS
-- ============================================================

INSERT INTO admin_users
(id, name, email, gender, date_of_birth, salary)
VALUES
(101, 'Anil Kumar', 'anil@example.com', 'Male', '1985-04-12', 60000),
(102, 'Pooja Sharma', 'pooja@example.com', 'Female', '1992-09-20', 58000),
(103, 'Rakesh Yadav', 'rakesh@example.com', 'Male', '1989-11-05', 54000),
(104, 'Fatima Begum', 'fatima@example.com', 'Female', '1990-06-30', 62000);


-- ============================================================
-- CHECK ADMIN_USERS
-- ============================================================

SELECT * FROM admin_users;


-- ============================================================
-- 1. UNION
-- ============================================================

-- UNION combines the results of two or more SELECT statements.
-- UNION removes duplicate rows automatically.
-- Both SELECT statements must have the same number of columns.
-- Corresponding columns should have compatible data types.

SELECT
    email,
    name,
    'USER' AS role
FROM users

UNION

SELECT
    email,
    name,
    'ADMIN' AS role
FROM admin_users;


-- ============================================================
-- 2. UNION ALL
-- ============================================================

-- UNION ALL combines the results of two or more SELECT statements.
-- UNION ALL does NOT remove duplicate rows.
-- Every row from both SELECT statements is returned.

SELECT
    email,
    name
FROM users

UNION ALL

SELECT
    email,
    name
FROM admin_users;


-- ============================================================
-- 3. UNION WITH DISTINCT NAMES
-- ============================================================

-- UNION removes duplicate names automatically.
-- If the same name exists in both tables, it appears only once.

SELECT name
FROM users

UNION

SELECT name
FROM admin_users

ORDER BY name;


-- ============================================================
-- 4. UNION ALL WITH NAMES
-- ============================================================

-- UNION ALL keeps duplicate names.
-- If the same name exists in both tables, it appears multiple times.

SELECT name
FROM users

UNION ALL

SELECT name
FROM admin_users

ORDER BY name;


-- ============================================================
-- 5. UNION WITH WHERE
-- ============================================================

-- Get male users and male admin users in one result.

SELECT
    name,
    email,
    'USER' AS role
FROM users
WHERE gender = 'Male'

UNION

SELECT
    name,
    email,
    'ADMIN' AS role
FROM admin_users
WHERE gender = 'Male';


-- ============================================================
-- 6. UNION ALL WITH SALARY
-- ============================================================

-- Combine salary information from users and admin_users.
-- The role column tells us whether the person is a user or admin.

SELECT
    name,
    salary,
    'USER' AS role
FROM users

UNION ALL

SELECT
    name,
    salary,
    'ADMIN' AS role
FROM admin_users;


-- ============================================================
-- 7. UNION WITH WHERE AND ORDER BY
-- ============================================================

-- Get users and admins whose salary is greater than 60000.
-- The final ORDER BY sorts the combined result.

SELECT
    name,
    salary,
    'USER' AS role
FROM users
WHERE salary > 60000

UNION ALL

SELECT
    name,
    salary,
    'ADMIN' AS role
FROM admin_users
WHERE salary > 60000

ORDER BY salary DESC;


-- ============================================================
-- 8. UNION WITH THREE COLUMNS
-- ============================================================

-- Both SELECT statements return exactly 3 columns.
-- The columns must be compatible.

SELECT
    name,
    email,
    salary
FROM users

UNION

SELECT
    name,
    email,
    salary
FROM admin_users;


-- ============================================================
-- 9. UNION ALL WITH THREE COLUMNS
-- ============================================================

SELECT
    name,
    email,
    salary
FROM users

UNION ALL

SELECT
    name,
    email,
    salary
FROM admin_users;


-- ============================================================
-- IMPORTANT UNION RULES
-- ============================================================

-- Rule 1:
-- Both SELECT statements must return the SAME NUMBER of columns.

-- Correct:

SELECT name, email
FROM users

UNION

SELECT name, email
FROM admin_users;


-- Rule 2:
-- Corresponding columns should have compatible data types.

-- Example:
-- VARCHAR with VARCHAR
-- INT with INT
-- DATE with DATE


-- Rule 3:
-- UNION removes duplicate rows.

SELECT name
FROM users

UNION

SELECT name
FROM admin_users;


-- Rule 4:
-- UNION ALL keeps duplicate rows.

SELECT name
FROM users

UNION ALL

SELECT name
FROM admin_users;


-- Rule 5:
-- ORDER BY is generally written at the end
-- of the complete UNION query.

SELECT name
FROM users

UNION

SELECT name
FROM admin_users

ORDER BY name;


-- ============================================================
-- INVALID UNION EXAMPLE
-- ============================================================

-- The following query is invalid because the first SELECT
-- returns 2 columns while the second SELECT returns 1 column.

-- SELECT name, email
-- FROM users
-- UNION
-- SELECT name
-- FROM admin_users;


-- ============================================================
-- UNION VS UNION ALL
-- ============================================================

-- UNION:
-- Combines results from multiple SELECT statements.
-- Removes duplicate rows.
-- Usually slower than UNION ALL because duplicate removal
-- requires additional processing.


-- UNION ALL:
-- Combines results from multiple SELECT statements.
-- Keeps duplicate rows.
-- Usually faster than UNION because duplicate removal
-- is not performed.


-- ============================================================
-- SIMPLE EXAMPLE
-- ============================================================

-- Suppose users contains:
--
-- A
-- B
-- C
--
-- And admin_users contains:
--
-- B
-- C
-- D
--
-- UNION result:
--
-- A
-- B
-- C
-- D
--
-- UNION ALL result:
--
-- A
-- B
-- C
-- B
-- C
-- D


-- ============================================================
-- QUICK CHEAT SHEET
-- ============================================================

-- UNION
-- Combine + Remove duplicates

SELECT column1, column2
FROM table1

UNION

SELECT column1, column2
FROM table2;


-- UNION ALL
-- Combine + Keep duplicates

SELECT column1, column2
FROM table1

UNION ALL

SELECT column1, column2
FROM table2;


-- ============================================================
-- MOST IMPORTANT POINTS TO REMEMBER
-- ============================================================

-- 1. Same number of columns
-- 2. Compatible data types
-- 3. UNION removes duplicates
-- 4. UNION ALL keeps duplicates
-- 5. ORDER BY goes at the end

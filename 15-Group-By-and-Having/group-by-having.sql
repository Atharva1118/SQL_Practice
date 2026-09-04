-- ============================================================
-- GROUP BY AND HAVING IN MYSQL
-- ============================================================

USE CodeWithHarry;


-- ============================================================
-- GROUP BY
-- ============================================================

-- GROUP BY is used to group rows that have the same values
-- in one or more columns.
--
-- It is commonly used with aggregate functions such as:
-- COUNT()
-- SUM()
-- AVG()
-- MIN()
-- MAX()


-- ============================================================
-- BASIC GROUP BY
-- ============================================================

-- Find the average salary for each gender.

-- SELECT Gender, AVG(Salary) AS 'Average Salary'
-- FROM users
-- GROUP BY Gender;


-- ============================================================
-- GROUP BY WITH COUNT()
-- ============================================================

-- Find the average salary and total number of users
-- for each gender.

SELECT
    Gender,
    AVG(Salary) AS 'Average Salary',
    COUNT(*) AS 'COUNT'
FROM users
GROUP BY Gender;


-- ============================================================
-- WHERE vs HAVING
-- ============================================================

-- WHERE is used to filter individual rows
-- BEFORE grouping.

-- HAVING is used to filter groups
-- AFTER GROUP BY.


-- ❌ This is incorrect:
--
-- SELECT Gender, AVG(Salary) AS 'Average Salary', COUNT(*) AS 'COUNT'
-- FROM users
-- GROUP BY Gender
-- WHERE AVG(Salary) > 61000;


-- ============================================================
-- WHERE BEFORE GROUP BY + HAVING AFTER GROUP BY
-- ============================================================

-- First, WHERE filters users whose id is less than 5000.
-- Then GROUP BY creates groups based on Gender.
-- Finally, HAVING filters those groups.

SELECT
    Gender,
    AVG(Salary) AS 'Average Salary',
    COUNT(*) AS 'COUNT'
FROM users
WHERE id < 5000
GROUP BY Gender
HAVING AVG(Salary) < 6155500
   AND COUNT(*) < 19;


-- ============================================================
-- GROUP BY WITH REFERRED USERS
-- ============================================================

-- Count how many users were referred by each user.

-- referred_by_id IS NOT NULL ensures that users
-- without a referrer are excluded.

SELECT
    referred_by_id,
    COUNT(*) AS total_referred
FROM users
WHERE referred_by_id IS NOT NULL
GROUP BY referred_by_id
HAVING COUNT(*) > 1;


-- ============================================================
-- ROLLUP
-- ============================================================

-- ROLLUP is used to generate subtotals and a grand total
-- for grouped data.

-- Example:

-- SELECT
--     Gender,
--     AVG(Salary) AS 'Average Salary',
--     COUNT(*) AS 'COUNT'
-- FROM users
-- WHERE id < 5000
-- GROUP BY Gender WITH ROLLUP;


-- ============================================================
-- ROLLUP WITH HAVING
-- ============================================================

SELECT
    Gender,
    AVG(Salary) AS 'Average Salary',
    COUNT(*) AS 'COUNT'
FROM users
WHERE id < 5000
GROUP BY Gender WITH ROLLUP
HAVING AVG(Salary) < 69500;


-- ============================================================
-- EXECUTION ORDER
-- ============================================================

-- The logical order is generally:
--
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- SELECT
-- ORDER BY
-- LIMIT


-- ============================================================
-- IMPORTANT DIFFERENCE
-- ============================================================

-- WHERE  → Filters individual rows.
--
-- GROUP BY → Groups rows.
--
-- HAVING → Filters groups.
--
-- ROLLUP → Adds subtotals and grand totals.


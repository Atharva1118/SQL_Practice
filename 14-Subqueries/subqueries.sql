-- ============================================================
-- SUBQUERIES IN MYSQL
-- ============================================================

USE CodeWithHarry;


-- ============================================================
-- WHAT IS A SUBQUERY?
-- ============================================================

-- A subquery is a query nested inside another query.
--
-- The inner query executes first, and its result
-- is used by the outer query.


-- ============================================================
-- SUBQUERY WITH AVG()
-- ============================================================

-- Find the average salary of all users.

SELECT AVG(salary)
FROM users;


-- Find users whose salary is less than the average salary.

SELECT *
FROM users
WHERE salary < (
    SELECT AVG(salary)
    FROM users
);


-- Find users whose salary is greater than the average salary.

SELECT *
FROM users
WHERE salary > (
    SELECT AVG(salary)
    FROM users
);


-- ============================================================
-- SUBQUERY WITH IN
-- ============================================================

-- Find users whose referred_by_id belongs to a user
-- whose salary is greater than ₹70,000.

SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
    SELECT id
    FROM users
    WHERE salary > 70000
);


-- Find users whose referred_by_id belongs to a user
-- whose salary is greater than ₹50,000.

SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
    SELECT id
    FROM users
    WHERE salary > 50000
);


-- ============================================================
-- SUBQUERY WITH AVG() + IN
-- ============================================================

-- Find users whose referred_by_id belongs to a user
-- whose salary is greater than the average salary.

SELECT id, name, referred_by_id
FROM users
WHERE referred_by_id IN (
    SELECT id
    FROM users
    WHERE salary > (
        SELECT AVG(salary)
        FROM users
    )
);


-- ============================================================
-- SUBQUERY IN SELECT
-- ============================================================

-- Display every user's name and salary along with
-- the average salary of all users.

SELECT
    name,
    salary,
    (SELECT AVG(salary) FROM users) AS average_salary
FROM users;


-- ============================================================
-- END OF SUBQUERIES PRACTICE
-- ============================================================

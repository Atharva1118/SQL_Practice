-- ============================================================
-- VIEWS IN MYSQL
-- ============================================================

USE CodeWithHarry;


-- ============================================================
-- WHAT IS A VIEW?
-- ============================================================

-- A VIEW in MySQL is a virtual table based on the result
-- of a SELECT query.
--
-- A view does not store the data itself.
-- It displays data from the original/base tables.
--
-- Therefore, when the data in the base table changes,
-- the view automatically reflects those changes.


-- ============================================================
-- CREATE A VIEW
-- ============================================================

-- Create a view containing users whose salary is above ₹70,000.

CREATE VIEW rich_users AS
SELECT *
FROM users
WHERE salary > 70000;


-- ============================================================
-- DISPLAY DATA FROM THE VIEW
-- ============================================================

SELECT *
FROM rich_users;


-- ============================================================
-- VIEWS REFLECT LIVE DATA
-- ============================================================

-- Update a user's salary in the original users table.

UPDATE users
SET salary = 30000
WHERE id = 2;


-- Query the view again.

SELECT *
FROM rich_users;


-- The user whose salary was changed to ₹30,000
-- will no longer appear in the rich_users view.
--
-- We did NOT update the view itself.
-- The view automatically reflects the current data
-- from the users table.


-- ============================================================
-- REMOVE / DELETE A VIEW
-- ============================================================

DROP VIEW rich_users;


-- ============================================================
-- END OF VIEWS PRACTICE
-- ============================================================

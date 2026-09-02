-- ============================================================
-- MYSQL INDEXES
-- ============================================================

USE CodeWithHarry;


-- ============================================================
-- WHAT IS AN INDEX?
-- ============================================================

-- Indexes in MySQL are used to speed up data retrieval.
--
-- They work like the index of a book:
-- instead of searching through every row, MySQL can
-- use the index to find matching rows faster.
--
-- Indexes are especially useful for:
-- WHERE
-- JOIN
-- ORDER BY
-- GROUP BY
--
-- However, indexes also require additional storage
-- and can make INSERT, UPDATE, and DELETE operations
-- slightly more expensive.


-- ============================================================
-- SHOW ALL INDEXES
-- ============================================================

-- Show all indexes defined on the users table.

SHOW INDEXES FROM users;

-- This shows all indexes currently defined on the users table,
-- including the automatically created PRIMARY KEY index.


-- ============================================================
-- CREATING A SINGLE-COLUMN INDEX
-- ============================================================

-- Create an index on the email column.

-- CREATE INDEX idx_email
-- ON users(email);

-- The index can help when searching by email:

-- SELECT *
-- FROM users
-- WHERE email = 'atharva@gmail.com';


-- ============================================================
-- CREATING A MULTI-COLUMN INDEX
-- ============================================================

-- Create a composite (multi-column) index
-- on gender and salary.

CREATE INDEX idx_gender_salary
ON users(gender, salary);


-- ============================================================
-- USING THE MULTI-COLUMN INDEX
-- ============================================================

SELECT *
FROM users
WHERE gender = 'Female'
AND salary > 70000;


-- ============================================================
-- COLUMN ORDER MATTERS
-- ============================================================

-- The index was created as:

-- (gender, salary)

-- Therefore, queries using gender as the first condition
-- can benefit from this index.

-- Example:

-- SELECT *
-- FROM users
-- WHERE gender = 'Female';


-- ============================================================
-- VIEW INDEXES AGAIN
-- ============================================================

SHOW INDEXES FROM users;


-- ============================================================
-- DROPPING AN INDEX
-- ============================================================

-- Remove the single-column email index:

-- DROP INDEX idx_email
-- ON users;

-- Remove the composite index:

-- DROP INDEX idx_gender_salary
-- ON users;


-- ============================================================
-- VIEW TABLE DATA
-- ============================================================

-- SELECT *
-- FROM users;


-- ============================================================
-- END OF INDEXES PRACTICE
-- ============================================================

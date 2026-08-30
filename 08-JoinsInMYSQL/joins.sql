-- MySQL JOINs Practice

-- sql
-- ============================================================
-- JOINS IN MYSQL
-- ============================================================

USE startersql;


-- ============================================================
-- CHECK TABLES
-- ============================================================

-- SELECT * FROM users;
-- SELECT * FROM addresses;


-- ============================================================
-- 1. INNER JOIN
-- ============================================================

-- Returns only the rows that have matching values
-- in BOTH tables.

-- users.id = addresses.user_id

SELECT
    users.name,
    users.gender,
    addresses.city,
    addresses.state,
    addresses.id AS address_id
FROM users
INNER JOIN addresses
    ON users.id = addresses.user_id;


-- ============================================================
-- 2. LEFT JOIN
-- ============================================================

-- Returns ALL rows from the LEFT table (users)
-- and matching rows from the RIGHT table (addresses).
--
-- If there is no matching address,
-- the address columns contain NULL.

SELECT
    users.name,
    users.gender,
    addresses.city,
    addresses.state,
    addresses.id AS address_id
FROM users
LEFT JOIN addresses
    ON users.id = addresses.user_id;


-- ============================================================
-- 3. RIGHT JOIN
-- ============================================================

-- Returns ALL rows from the RIGHT table (addresses)
-- and matching rows from the LEFT table (users).
--
-- If there is no matching user,
-- the user columns contain NULL.

SELECT
    users.name,
    users.gender,
    addresses.city,
    addresses.state,
    addresses.id AS address_id
FROM users
RIGHT JOIN addresses
    ON users.id = addresses.user_id;



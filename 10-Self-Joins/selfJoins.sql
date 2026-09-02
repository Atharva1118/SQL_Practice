
-- ============================================================
-- SELF JOINS IN MYSQL
-- ============================================================

-- A Self Join is a JOIN where a table is joined with itself.
-- It is useful when rows in the same table are related to each other.
--
-- Example:
-- A user can be referred by another user from the same users table.


-- ============================================================
-- CREATE DATABASE
-- ============================================================

CREATE DATABASE IF NOT EXISTS CodeWithHarry;
USE CodeWithHarry;


-- ============================================================
-- CREATE USERS TABLE
-- ============================================================

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    salary DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- INSERT USERS DATA
-- ============================================================

INSERT INTO users
(name, email, gender, date_of_birth, salary)
VALUES
('Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00),
('Ananya', 'ananya@example.com', 'Female', '1990-11-23', 72000.00),
('Raj', 'raj@example.com', 'Male', '1988-02-17', 58000.00),
('Sneha', 'sneha@example.com', 'Female', '2000-08-09', 50000.00),
('Farhan', 'farhan@example.com', 'Male', '1993-12-30', 61000.00),
('Priyanka', 'priyanka@example.com', 'Female', '1985-07-12', 84000.00),
('Aisha', 'aisha@example.com', 'Female', '1997-03-25', 56000.00),
('Aditya', 'aditya@example.com', 'Male', '1992-06-17', 69000.00),
('Meera', 'meera@example.com', 'Female', '1989-09-05', 77000.00),
('Ishaan', 'ishaan@example.com', 'Male', '2001-10-02', 45000.00),
('Tanvi', 'tanvi@example.com', 'Female', '1994-04-18', 62000.00),
('Rohan', 'rohan@example.com', 'Male', '1986-12-01', 75000.00),
('Zoya', 'zoya@example.com', 'Female', '1998-01-15', 54000.00),
('Karan', 'karan@example.com', 'Male', '1990-08-22', 68000.00),
('Nikita', 'nikita@example.com', 'Female', '1987-03-10', 71000.00),
('Manav', 'manav@example.com', 'Male', '1996-11-29', 61000.00),
('Divya', 'divya@example.com', 'Female', '1991-02-28', 57000.00),
('Harshit', 'harshit@example.com', 'Male', '1993-09-09', 65000.00),
('Ritika', 'ritika@example.com', 'Female', '1999-05-05', 52000.00),
('Imran', 'imran@example.com', 'Male', '1995-07-30', 63000.00),
('Juhi', 'juhi@example.com', 'Female', '1992-10-14', 59000.00),
('Tushar', 'tushar@example.com', 'Male', '1990-01-08', 73000.00),
('Lata', 'lata@example.com', 'Female', '1984-11-11', 78000.00),
('Yash', 'yash@example.com', 'Male', '1997-06-06', 64000.00),
('Fatima', 'fatima@example.com', 'Female', '1993-03-03', 55000.00);


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
-- INSERT ADMIN USERS
-- ============================================================

INSERT INTO admin_users
(id, name, email, gender, date_of_birth, salary)
VALUES
(101, 'Anil Kumar', 'anil@example.com', 'Male', '1985-04-12', 60000),
(102, 'Pooja Sharma', 'pooja@example.com', 'Female', '1992-09-20', 58000),
(103, 'Rakesh Yadav', 'rakesh@example.com', 'Male', '1989-11-05', 54000),
(104, 'Fatima Begum', 'fatima@example.com', 'Female', '1990-06-30', 62000);


-- ============================================================
-- ADD REFERRED_BY_ID COLUMN
-- ============================================================

ALTER TABLE users
ADD COLUMN referred_by_id INT;


-- ============================================================
-- UPDATE REFERRAL INFORMATION
-- ============================================================

UPDATE users
SET referred_by_id = 1
WHERE id IN (2, 3, 13, 14, 15, 16, 18, 20);

UPDATE users
SET referred_by_id = 2
WHERE id IN (1, 4, 7, 21, 25);


-- ============================================================
-- VIEW USERS TABLE
-- ============================================================

SELECT *
FROM users;


-- ============================================================
-- SELF JOIN USING INNER JOIN
-- ============================================================

-- Syntax:
--
-- SELECT
--     a.id,
--     a.name AS user_name,
--     b.name AS referred_by
-- FROM users a
-- INNER JOIN users b
--     ON a.referred_by_id = b.id;


-- ============================================================
-- SELF JOIN USING LEFT JOIN
-- ============================================================

SELECT
    a.id,
    a.name AS user_name,
    b.name AS referred_by
FROM users a
LEFT JOIN users b
    ON a.referred_by_id = b.id;


-- ============================================================
-- EXPLANATION
-- ============================================================

-- 'a' refers to the user being queried.
-- 'b' refers to the user who referred them.
--
-- The same 'users' table is used twice with different aliases.
--
-- LEFT JOIN is used so that users whose referred_by_id is NULL
-- are also included in the result.
--
-- INNER JOIN only returns users who have a matching referrer.


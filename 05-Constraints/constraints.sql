USE startersql;

-- =========================================================
-- CONSTRAINTS IN MYSQL
-- =========================================================

-- =========================================================
-- Creating a Table with Constraints
-- =========================================================

-- CREATE TABLE users (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100) NOT NULL,
--     email VARCHAR(100) UNIQUE NOT NULL,
--     gender ENUM('Male', 'Female', 'Other'),
--     date_of_birth DATE,
--     salary DECIMAL(10, 2),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- =========================================================
-- Inserting Data into the Table
-- =========================================================

-- INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
-- ('Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00),
-- ('Ananya', 'ananya@example.com', 'Female', '1990-11-23', 72000.00),
-- ('Raj', 'raj@example.com', 'Male', '1988-02-17', 58000.00),
-- ('Sneha', 'sneha@example.com', 'Female', '2000-08-09', 50000.00),
-- ('Farhan', 'farhan@example.com', 'Male', '1993-12-30', 61000.00),
-- ('Priyanka', 'priyanka@example.com', 'Female', '1985-07-12', 84000.00),
-- ('Aisha', 'aisha@example.com', 'Female', '1997-03-25', 56000.00),
-- ('Aditya', 'aditya@example.com', 'Male', '1992-06-17', 69000.00),
-- ('Meera', 'meera@example.com', 'Female', '1989-09-05', 77000.00),
-- ('Ishaan', 'ishaan@example.com', 'Male', '2001-10-02', 45000.00),
-- ('Tanvi', 'tanvi@example.com', 'Female', '1994-04-18', 62000.00),
-- ('Rohan', 'rohan@example.com', 'Male', '1986-12-01', 75000.00),
-- ('Zoya', 'zoya@example.com', 'Female', '1998-01-15', 54000.00),
-- ('Karan', 'karan@example.com', 'Male', '1990-08-22', 68000.00),
-- ('Nikita', 'nikita@example.com', 'Female', '1987-03-10', 71000.00),
-- ('Manav', 'manav@example.com', 'Male', '1996-11-29', 61000.00),
-- ('Divya', 'divya@example.com', 'Female', '1991-02-28', 57000.00),
-- ('Harshit', 'harshit@example.com', 'Male', '1993-09-09', 65000.00),
-- ('Ritika', 'ritika@example.com', 'Female', '1999-05-05', 52000.00),
-- ('Imran', 'imran@example.com', 'Male', '1995-07-30', 63000.00),
-- ('Juhi', 'juhi@example.com', 'Female', '1992-10-14', 59000.00),
-- ('Tushar', 'tushar@example.com', 'Male', '1990-01-08', 73000.00),
-- ('Lata', 'lata@example.com', 'Female', '1984-11-11', 78000.00),
-- ('Yash', 'yash@example.com', 'Male', '1997-06-06', 64000.00),
-- ('Fatima', 'fatima@example.com', 'Female', '1993-03-03', 55000.00);

-- =========================================================
-- 1. UNIQUE Constraint
-- =========================================================

-- UNIQUE constraint prevents duplicate values in a column.

-- Example:
-- The email column has a UNIQUE constraint.
-- If we try to insert an email that already exists,
-- MySQL throws a duplicate entry error.

-- INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
-- ('Aarav', 'aarav@example.com', 'Male', '1995-05-14', 65000.00);

-- Error Code: 1062.
-- Duplicate entry 'aarav@example.com' for key 'users.email'

-- Adding a UNIQUE constraint to an existing column:

-- ALTER TABLE users
-- ADD CONSTRAINT unique_email UNIQUE (email);

-- =========================================================
-- 2. NOT NULL Constraint
-- =========================================================

-- NOT NULL ensures that a column cannot contain NULL values.

-- The name and email columns were created with NOT NULL.

-- Trying to insert NULL into the email column:

-- INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
-- ('Aarav', NULL, 'Male', '1995-05-14', 65000.00);

-- Error Code: 1048.
-- Column 'email' cannot be null

-- Adding NOT NULL to an existing column:

-- ALTER TABLE users
-- MODIFY COLUMN name VARCHAR(100) NOT NULL;

-- Making the column nullable again:

-- ALTER TABLE users
-- MODIFY COLUMN name VARCHAR(100) NULL;

-- =========================================================
-- 3. CHECK Constraint
-- =========================================================

-- CHECK constraint ensures that values in a column
-- satisfy a specific condition.

-- Example:
-- Date of birth must be after 1920-01-01.

-- ALTER TABLE users
-- ADD CONSTRAINT chk_dob CHECK (date_of_birth > '1920-01-01');

-- Trying to insert a value that violates the CHECK constraint:

-- INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
-- ('Aarav', 'aarav@example.com', 'Male', '1905-05-14', 65000.00);

-- Error Code: 3819.
-- Check constraint 'chk_dob' is violated.

-- =========================================================
-- 4. DEFAULT Constraint
-- =========================================================

-- DEFAULT provides a value automatically when no value
-- is supplied during INSERT.

-- Adding a column with a DEFAULT value:

-- ALTER TABLE users
-- ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- =========================================================
-- 5. PRIMARY KEY Constraint
-- =========================================================

-- PRIMARY KEY uniquely identifies each row in a table.
-- A primary key cannot contain NULL values
-- and cannot contain duplicate values.

-- =========================================================
-- 6. AUTO_INCREMENT
-- =========================================================

-- AUTO_INCREMENT automatically generates the next number
-- for a column, commonly used with a PRIMARY KEY.

-- =========================================================
-- Quick Summary
-- =========================================================

-- UNIQUE       -> Prevents duplicate values
-- NOT NULL     -> Prevents NULL values
-- CHECK        -> Restricts values using a condition
-- DEFAULT      -> Provides a default value
-- PRIMARY KEY  -> Uniquely identifies each row
-- AUTO_INCREMENT -> Automatically generates numbers

-- =========================================================
-- View Current Data
-- =========================================================

SELECT * FROM users;

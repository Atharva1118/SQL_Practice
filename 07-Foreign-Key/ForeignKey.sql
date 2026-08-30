# StarterSQL – Foreign Key Practice

-- ============================================================
-- DATABASE SETUP
-- ============================================================

CREATE DATABASE IF NOT EXISTS startersql;
USE startersql;


-- ============================================================
-- USERS TABLE
-- Parent Table
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
-- INSERT DATA INTO USERS
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
-- ADDRESSES TABLE
-- Child Table
-- ============================================================

CREATE TABLE IF NOT EXISTS addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    pincode VARCHAR(10),

    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);


-- ============================================================
-- INSERT DATA INTO ADDRESSES
-- ============================================================

INSERT INTO addresses
(user_id, street, city, state, pincode)
VALUES
(1, '221B MG Road', 'Mumbai', 'Maharashtra', '400001'),
(22, '14 Park Street', 'Kolkata', 'West Bengal', '700016'),
(3, '32 Residency Road', 'Bengaluru', 'Karnataka', '560025'),
(24, '5 North Usman Road', 'Chennai', 'Tamil Nadu', '600017'),
(5, '17 Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001'),
(6, '55 Banjara Hills', 'Hyderabad', 'Telangana', '500034'),
(7, '88 Connaught Place', 'Delhi', 'Delhi', '110001'),
(8, '10 MG Marg', 'Dehradun', 'Uttarakhand', '248001'),
(9, '23 Brigade Road', 'Bengaluru', 'Karnataka', '560025'),
(10, '45 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(11, '67 Ashoka Road', 'Delhi', 'Delhi', '110001'),
(12, '89 MG Road', 'Pune', 'Maharashtra', '411001'),
(13, '12 Brigade Road', 'Bengaluru', 'Karnataka', '560025'),
(14, '34 Park Street', 'Kolkata', 'West Bengal', '700016'),
(15, '56 Connaught Place', 'Delhi', 'Delhi', '110001'),
(16, '78 Marine Drive', 'Mumbai', 'Maharashtra', '400020'),
(17, '90 MG Marg', 'Dehradun', 'Uttarakhand', '248001'),
(18, '11 North Usman Road', 'Chennai', 'Tamil Nadu', '600017'),
(19, '33 Residency Road', 'Bengaluru', 'Karnataka', '560025'),
(20, '22 Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001');


-- ============================================================
-- VIEW TABLES
-- ============================================================

SELECT * FROM users;

SELECT * FROM addresses;


-- ============================================================
-- FOREIGN KEY
-- DELETE FOREIGN KEY FROM EXISTING TABLE
-- ============================================================

-- Syntax:
-- ALTER TABLE table_name
-- DROP FOREIGN KEY constraint_name;

-- Example:
-- ALTER TABLE addresses
-- DROP FOREIGN KEY fk_user;


-- ============================================================
-- ADD FOREIGN KEY LATER
-- ============================================================

-- Syntax:
-- ALTER TABLE child_table
-- ADD CONSTRAINT constraint_name
-- FOREIGN KEY (child_column)
-- REFERENCES parent_table(parent_column);

-- Example:

-- ALTER TABLE addresses
-- ADD CONSTRAINT fk_user
-- FOREIGN KEY (user_id)
-- REFERENCES users(id);


-- ============================================================
-- ON DELETE CASCADE
-- ============================================================

-- If a user is deleted,
-- the corresponding address is automatically deleted.

-- Example:

-- ALTER TABLE addresses
-- DROP FOREIGN KEY fk_user;

-- ALTER TABLE addresses
-- ADD CONSTRAINT fk_user
-- FOREIGN KEY (user_id)
-- REFERENCES users(id)
-- ON DELETE CASCADE;


-- ============================================================
-- ON DELETE SET NULL
-- ============================================================

-- If a user is deleted,
-- user_id in addresses becomes NULL.

-- IMPORTANT:
-- user_id must allow NULL values.

-- Example:

-- ALTER TABLE addresses
-- DROP FOREIGN KEY fk_user;

-- ALTER TABLE addresses
-- ADD CONSTRAINT fk_user
-- FOREIGN KEY (user_id)
-- REFERENCES users(id)
-- ON DELETE SET NULL;


-- ============================================================
-- ON DELETE RESTRICT
-- ============================================================

-- If an address exists for a user,
-- the user cannot be deleted.

-- The DELETE operation is rejected.

-- Example:

-- ALTER TABLE addresses
-- DROP FOREIGN KEY fk_user;

-- ALTER TABLE addresses
-- ADD CONSTRAINT fk_user
-- FOREIGN KEY (user_id)
-- REFERENCES users(id)
-- ON DELETE RESTRICT;


-- ============================================================
-- TEST ON DELETE CASCADE
-- ============================================================

-- First check the address:

-- SELECT * FROM addresses
-- WHERE user_id = 22;

-- Delete the user:

-- DELETE FROM users
-- WHERE id = 22;

-- Check the address again:

-- SELECT * FROM addresses
-- WHERE user_id = 22;

-- With ON DELETE CASCADE,
-- the address will also be deleted.


-- ============================================================
-- CHECK FOREIGN KEYS
-- ============================================================

-- SHOW CREATE TABLE addresses;


-- ============================================================
-- END
-- ============================================================
```

### Quick Foreign Key Cheat Sheet

```sql
-- DELETE FOREIGN KEY

ALTER TABLE addresses
DROP FOREIGN KEY fk_user;


-- ADD FOREIGN KEY

ALTER TABLE addresses
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES users(id);


-- ADD FOREIGN KEY + CASCADE

ALTER TABLE addresses
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE;


-- ADD FOREIGN KEY + SET NULL

ALTER TABLE addresses
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE SET NULL;


-- ADD FOREIGN KEY + RESTRICT

ALTER TABLE addresses
ADD CONSTRAINT fk_user
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE RESTRICT;

-- CASCADE  → Delete parent → Delete child
-- SET NULL → Delete parent → FK becomes NULL
-- RESTRICT → Delete parent → ERROR / deletion prevented


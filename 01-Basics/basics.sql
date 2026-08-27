
 -- For creating database
-- Create Database startersql;

-- To set Database for use
-- USE startersql;

-- To create a table in database
-- CREATE TABLE users (
--  id INT AUTO_INCREMENT PRIMARY KEY,
--  name VARCHAR(100) NOT NULL,
--  email VARCHAR(100) UNIQUE NOT NULL,
--  gender ENUM('Male', 'Female', 'Other'),
--  date_of_birth DATE,
--  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );

-- For selecting all columns from a table
-- Select * from users;

-- For selecting specific columns from  a table 
-- Select email,gender from users;

-- For renaming the table
-- Rename table users to Customers;
-- Rename table customers to users;


-- To add colums in the existing table
-- Alter table users 
-- add column is_active boolean default True; 

-- To delete table from a existing table
-- Alter Table users
-- Drop column is_active;

-- To change the type of column in a table
-- Alter Table users
-- Modify column name varchar(150);

-- To move the position of a column  after a specific column
-- ALTER TABLE users
-- MODIFY COLUMN gender ENUM('Male', 'Female', 'Other')
-- AFTER name;

-- To move the position of the column at first
-- Alter table users 
-- Modify column email varchar(100) FIRST;


-- Inserting values into tables
-- Insert into users
-- values ('atharvag1811@gmail.com',1,'Atharva','Male','2005-11-18',default);

-- FOr inserting specific values in a table
-- Insert into users(email,name,gender,date_of_birth)
-- values('arnav@gmail.com','Arnav Patil','Male','2006-01-01');


-- Inserting Multiple Rows at a time
-- Insert into users(name,email,gender,date_of_birth)
-- Values
-- ('Anshika Patil','anupatil@gmail.com','Female','2017-06-27'),
-- ('Saisha Patil','saipatil@gmail.com','Female','2017-01-06'),
-- ('Shriyan Patil','shriyanpatil@gmail.com','Male','2018-06-27');

Select * from users;

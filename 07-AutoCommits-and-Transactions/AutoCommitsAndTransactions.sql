-- Auto Commit and Transactions

-- 1. Disabling AutoCommit
-- When AutoCommit is off, you can explicitly control when to commit or rollback
-- changes.
-- To Disable AutomCommit
-- Set autocommit=0;
-- This turns off AutoCommit, meaning that changes you make won’t be saved to the
-- database unless you explicitly tell MySQL to commit them.

-- 2. COMMIT — Save Changes to the Database
-- Once you’ve made changes and you’re confident that everything is correct, you can
-- use the COMMIT command to save those changes.

-- To commit a transaction
-- Commit;
-- This saves all the changes made since the last COMMIT or ROLLBACK . After this
-- point, the changes become permanent.

-- 3. ROLLBACK — Revert Changes to the Last Safe Point
-- If you make an error or decide you don’t want to save your changes, you can
-- rollback the transaction to its previous state.

-- To rollback a transaction:
-- ROLLBACK;

--  4. Enabling AutoCommit Again
-- If you want to turn AutoCommit back on (so that every statement is automatically
-- committed), you can do so with:
-- SET autocommit = 1;


Use startersql;
Set autocommit=0;
Select * from users;
delete from users where id=6;
Select * from users;
RollBack;
delete from users where id=5;
Commit;
Select * from users;
Set autocommit=1;

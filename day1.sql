-- =========================
-- Day 1 — Bank Accounts System
-- =========================
-- Step 1 — Create table `accounts`
-- Columns:
-- id → primary key
-- holder_name → not null
-- email → unique not null
-- balance → must be >= 0
-- account_type → default 'savings'
-- created_at → default current_timestamp
CREATE TABLE accounts (
    id serial PRIMARY KEY,
    holder_name varchar(50) NOT NULL,
    email varchar(100) UNIQUE NOT NULL,
    balance int CHECK (balance >= 0),
    account_type varchar(50) DEFAULT 'savings',
    created_at timestamp DEFAULT CURRENT_TIMESTAMP
);

-- Step 2 — ALTER operations
-- 1. Add column `status` default 'active'
ALTER TABLE accounts
    ADD status varchar(50) DEFAULT 'active';

-- 2. Add column `age` with constraint age >= 18
ALTER TABLE accounts
    ADD age int CHECK (age >= 18);

-- 3. Rename column `holder_name` → `name`
ALTER TABLE accounts RENAME COLUMN holder_name TO name;

-- 4. Drop column `status`
ALTER TABLE accounts
    DROP COLUMN status;

-- Step 3 — Insert values
INSERT INTO accounts (name, email, balance, account_type, age)
VALUES
    ('Rahul Sharma', 'rahul@mail.com', 5000, 'savings', 25),
    ('Amit Verma', 'amit@mail.com', 12000, 'current', 32),
    ('Neha Gupta', 'neha@mail.com', 3000, 'savings', 21),
    ('John Smith', 'john@mail.com', 25000, 'current', 45),
    ('Priya Mehta', 'priya@mail.com', 1000, 'savings', 19),
    ('David Lee', 'david@mail.com', 7000, 'savings', 29);

-- Q1
-- Update all accounts with balance < 5000
-- set account_type = 'basic'
UPDATE
    accounts
SET
    account_type = 'basic'
WHERE
    balance < 5000;

-- Q2
-- Delete accounts where age > 40
DELETE FROM accounts
WHERE age > 40;

-- Q3 (Hard)
-- Increase balance by 2000
-- where account_type = 'savings'
-- AND balance < 6000
UPDATE
    accounts
SET
    balance = balance + 2000
WHERE
    account_type = 'savings'
    AND balance < 6000;

-- Q4 (Hard)
-- Select all users
-- where age between 20 and 30
-- AND balance > 4000
SELECT
    *
FROM
    accounts
WHERE
    age BETWEEN 20 AND 30
    AND balance > 4000;

-- Q5
-- TRUNCATE table
TRUNCATE TABLE accounts;


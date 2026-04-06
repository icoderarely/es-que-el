# Daily SQL Practice

This repository contains my daily SQL practice.
Each day includes:

- Problem statement (in README)
- SQL solution (in `.sql` file)

---

# Day 1 — Bank Accounts System

**File:** [day1.sql](./day1.sql)

## Questions

### Step 1 — Create table `accounts`

Create a table with:

- id → primary key
- holder_name → not null
- email → unique not null
- balance → must be >= 0
- account_type → default 'savings'
- created_at → default current_timestamp

---

### Step 2 — ALTER operations

1. Add column `status` default 'active'
2. Add column `age` with constraint age >= 18
3. Rename column `holder_name` → `name`
4. Drop column `status`

---

### Step 3 — Insert sample records

```sql

('Rahul Sharma', 'rahul@mail.com', 5000, 'savings', 25),
('Amit Verma', 'amit@mail.com', 12000, 'current', 32),
('Neha Gupta', 'neha@mail.com', 3000, 'savings', 21),
('John Smith', 'john@mail.com', 25000, 'current', 45),
('Priya Mehta', 'priya@mail.com', 1000, 'savings', 19),
('David Lee', 'david@mail.com', 7000, 'savings', 29)

```

---

### Q1

Update all accounts with **balance < 5000**
Set `account_type = 'basic'`

---

### Q2

Delete accounts where **age > 40**

---

### Q3 (Hard)

Increase balance by **2000**
Where:

- `account_type = 'savings'`
- `balance < 6000`

---

### Q4 (Hard)

Select all users where:

- `age BETWEEN 20 AND 30`
- `balance > 4000`

---

### Q5

Truncate the table

---

## Solution

See: **[day1.sql](./day1.sql)**

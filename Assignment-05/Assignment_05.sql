-- Assignment No. 5: Bank Management System

-- 1. Create Tables

CREATE TABLE Customers_287 (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    city VARCHAR(100),
    account_type VARCHAR(50)
);

CREATE TABLE Branches_287 (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE Accounts_287 (
    account_id INT PRIMARY KEY,
    customer_id INT,
    balance DECIMAL(15, 2),
    account_type VARCHAR(50),
    branch_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers_287(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches_287(branch_id)
);

CREATE TABLE Transactions_287 (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(15, 2),
    transaction_type VARCHAR(50), -- Deposit, Withdrawal, Transfer
    transaction_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts_287(account_id)
);

CREATE TABLE Loans_287 (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(15, 2),
    loan_type VARCHAR(50), -- Home, Car, Personal
    status VARCHAR(50), -- Approved, Pending, Rejected
    FOREIGN KEY (customer_id) REFERENCES Customers_287(customer_id)
);

-- 2. Insert Data

INSERT INTO Customers_287 VALUES
(1, 'Ruturaj Warkad', '2004-06-15', 'Nanded', 'Savings'),
(2, 'Yash Mahajan', '2005-04-22', 'Pune', 'Current'),
(3, 'Vivek Painjane', '2004-03-10', 'Nanded', 'Savings'),
(4, 'Parth Sunklod', '2006-07-25', 'Nigdi', 'Current'),
(5, 'Vedant Maldhure', '2007-11-30', 'Ravet', 'Savings');

INSERT INTO Branches_287 VALUES
(1, 'Nanded Main Branch', 'Nanded'),
(2, 'Pune Central Branch', 'Pune'),
(3, 'Ravet East Branch', 'Ravet'),
(4, 'Nigdi South Branch', 'Nigdi');

INSERT INTO Accounts_287 VALUES
(101, 1, 12000.00, 'Savings', 1),
(102, 2, 25000.00, 'Current', 2),
(103, 3, 18000.00, 'Savings', 3),
(104, 4, 7000.00, 'Current', 1),
(105, 5, 5000.00, 'Savings', 4);

INSERT INTO Transactions_287 VALUES
(1, 101, 10000.00, 'Deposit', '2025-01-10'),
(2, 102, 5000.00, 'Withdrawal', '2025-01-15'),
(3, 103, 20000.00, 'Deposit', '2025-01-12'),
(4, 104, 3000.00, 'Transfer', '2025-01-20'),
(5, 105, 1500.00, 'Deposit', '2025-01-22');

INSERT INTO Loans_287 VALUES
(1, 1, 100000.00, 'Home', 'Approved'),
(2, 2, 20000.00, 'Car', 'Approved'),
(3, 3, 50000.00, 'Personal', 'Rejected'),
(4, 4, 40000.00, 'Car', 'Pending');

-- 3. Queries

-- 1. Total balance per account type
SELECT account_type, SUM(balance) AS total_balance
FROM Accounts_287
GROUP BY account_type;

-- 2. Number of accounts in each branch
SELECT city, COUNT(customer_id) AS customer_count
FROM Customers_287
GROUP BY city;

-- 3. Number of approved loans per loan type
SELECT loan_type, COUNT(loan_id) AS approved_loans
FROM Loans_287
WHERE status = 'Approved'
GROUP BY loan_type;

-- 4. Total number of transactions by type
SELECT transaction_type, COUNT(transaction_id) AS transaction_count
FROM Transactions_287
GROUP BY transaction_type;

-- 5. Customers without a loan
SELECT customer_id, name
FROM Customers_287
WHERE customer_id NOT IN (SELECT customer_id FROM Loans_287);

-- 6. Customers with accounts in more than one branch
SELECT customer_id, name
FROM Customers_287
WHERE customer_id IN (
    SELECT customer_id
    FROM Accounts_287
    GROUP BY customer_id
    HAVING COUNT(DISTINCT branch_id) > 1
);

-- 7. Accounts with no deposits in last 3 months
SELECT account_id
FROM Accounts_287
WHERE account_id NOT IN (
    SELECT account_id
    FROM Transactions_287
    WHERE transaction_type = 'Deposit'
      AND transaction_date >= CURDATE() - INTERVAL 3 MONTH
);

-- 8. Account types with total balance below ₹25,000
SELECT account_type, SUM(balance) AS total_balance
FROM Accounts_287
GROUP BY account_type
HAVING SUM(balance) < 25000;

-- 9. Account types with total balance above ₹50,000
SELECT account_type, SUM(balance) AS total_balance
FROM Accounts_287
GROUP BY account_type
HAVING SUM(balance) > 50000;

-- 10. Transaction dates with more than 5 transactions
SELECT transaction_date, COUNT(transaction_id) AS transaction_count
FROM Transactions_287
GROUP BY transaction_date
HAVING COUNT(transaction_id) > 5;

-- 11. Top 3 transaction days by total amount
SELECT transaction_date, SUM(amount) AS total_amount
FROM Transactions_287
GROUP BY transaction_date
ORDER BY total_amount DESC
LIMIT 3;

-- 12. Customers who have a loan but no account
SELECT customer_id, name
FROM Customers_287
WHERE customer_id IN (SELECT customer_id FROM Loans_287)
  AND customer_id NOT IN (SELECT customer_id FROM Accounts_287);

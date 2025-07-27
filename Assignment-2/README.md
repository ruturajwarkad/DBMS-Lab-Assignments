# Assignment 2 - MySQL Database Operations

## 📌 Objective
To get hands-on experience with basic MySQL operations such as creating databases and tables, inserting data, modifying table structure, and retrieving meaningful data using various SQL queries.

---

## 🧠 Topics Covered
- Creating and using databases
- Creating tables with different data types
- Data insertion, selection, updation, deletion
- Using constraints: `NOT NULL`, `UNIQUE`, `PRIMARY KEY`
- Using `ALTER`, `DROP`, `TRUNCATE`
- Distinct values & filtering records

---

## 💻 Database Used
**MySQL** — All queries are written and tested in MySQL.

---

## 🗂️ Table Description

### Table: `Students`

| Column Name | Data Type     | Description                  |
|-------------|---------------|------------------------------|
| PRN         | INT           | Primary Key                  |
| FirstName   | VARCHAR(50)   | Student's first name         |
| LastName    | VARCHAR(50)   | Student's last name          |
| MiddleName  | VARCHAR(50)   | Student's middle name (optional) |
| Year        | INT           | Current year of study        |
| Email       | VARCHAR(100)  | Must be unique               |
| Age         | INT           | Age of student               |
| Department  | VARCHAR(100)  | Department name              |
| PhoneNumber | VARCHAR(15)   | Phone number (added later)   |

---

## ✅ Tasks Performed

- ✔️ Created `StudentManagement` database and `Students` table
- ✔️ Inserted sample student data
- ✔️ Performed `SELECT`, `UPDATE`, `DELETE`, and `DROP` operations
- ✔️ Used constraints like `NOT NULL`, `UNIQUE`, `PRIMARY KEY`
- ✔️ Added new column using `ALTER`
- ✔️ Used `DISTINCT`, `COUNT`, and filter queries
- ✔️ Truncated data while keeping table structure

---

## 📄 File Included
- `Assignment_2.sql`: Contains all SQL queries in sequence

---

## 🚀 How to Run
1. Open MySQL Workbench or any SQL interface.
2. Copy-paste the contents of `Assignment_2.sql`.
3. Run the queries sequentially.

---

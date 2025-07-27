# DBMS Assignment 9 – MongoDB Aggregation and Indexing (PCCOE)

## 📚 Description
This assignment focuses on performing **aggregation operations** and **indexing techniques** using MongoDB collections. Collections used: `zipcode_287`, `Teachers_287`, and `Students_287`.

## 📌 Tasks Performed
- Inserted sample documents into:
  - `zipcode_287`: city-wise population data
  - `Teachers_287`: teacher details
  - `Students_287`: student records
- Used aggregation queries to:
  - Return states with population > 10 million
  - Find department-wise average salary
  - Count employees per department
  - Filter departments with total salary ≥ 50000
- Used `$max` and `$min` to find highest and lowest salary
- Created different types of indexes:
  - Simple index (`roll_no`)
  - Unique index (`Tname`)
  - Compound index (`dname`, `salary`)
- Listed all indexes in `PCCOE` DB and specific collections

## 🛠️ Commands Used
- `insertMany()`
- `aggregate()`
- `sort().limit()`
- `createIndex()`
- `getIndexes()`
- `getCollectionNames()`

## 📁 Collections Involved
- `zipcode_287`
- `Teachers_287`
- `Students_287`

---

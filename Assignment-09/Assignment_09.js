// ----------------------------------
// ✅ Assignment 9 - MongoDB Commands
// PCCOE DBMS Assignment
// ----------------------------------

// 1️⃣ Insert Sample Data

// Zipcode Data
db.zipcode_287.insertMany([
  { id: "10001", city: "NEW YORK", state: "NY", pop: 8000000 },
  { id: "90001", city: "LOS ANGELES", state: "CA", pop: 5000000 },
  { id: "60601", city: "CHICAGO", state: "IL", pop: 2700000 },
  { id: "94101", city: "SAN FRANCISCO", state: "CA", pop: 6000000 },
  { id: "73301", city: "AUSTIN", state: "TX", pop: 3000000 },
  { id: "20001", city: "WASHINGTON", state: "DC", pop: 1000000 }
]);

// Teacher Data
db.Teachers_287.insertMany([
  { Tname: "Praveen", dno: 1, dname: "COMP", experience: 10, salary: 15000, date_of_joining: "2016-06-15" },
  { Tname: "Anjali", dno: 2, dname: "IT", experience: 5, salary: 10000, date_of_joining: "2018-03-01" },
  { Tname: "Suresh", dno: 1, dname: "COMP", experience: 8, salary: 14000, date_of_joining: "2017-09-10" },
  { Tname: "Neha", dno: 3, dname: "E&TC", experience: 6, salary: 9000, date_of_joining: "2019-01-12" },
  { Tname: "Amit", dno: 2, dname: "IT", experience: 3, salary: 9500, date_of_joining: "2020-05-20" }
]);

// Student Data
db.Students_287.insertMany([
  { Sname: "Raj", roll_no: 1, class: "SE COMP" },
  { Sname: "Simran", roll_no: 2, class: "SE IT" },
  { Sname: "XYZ", roll_no: 3, class: "SE COMP" },
  { Sname: "Aakash", roll_no: 4, class: "TE E&TC" }
]);

// 2️⃣ Aggregation Queries

// a. States with population > 10 million
db.zipcode_287.aggregate([
  { $group: { _id: "$state", totalPop: { $sum: "$pop" } } },
  { $match: { totalPop: { $gt: 10000000 } } }
]);

// b. Average salary in each department
db.Teachers_287.aggregate([
  { $group: { _id: "$dname", avgSalary: { $avg: "$salary" } } }
]);

// c. Number of teachers per department
db.Teachers_287.aggregate([
  { $group: { _id: "$dname", empCount: { $sum: 1 } } }
]);

// d. Departments with total salary ≥ 50000
db.Teachers_287.aggregate([
  { $group: { _id: "$dname", totalSalary: { $sum: "$salary" } } },
  { $match: { totalSalary: { $gte: 50000 } } }
]);

// 3️⃣ Max & Min Salary Queries

// Max Salary
db.Teachers_287.find().sort({ salary: -1 }).limit(1);

// Min Salary
db.Teachers_287.find().sort({ salary: 1 }).limit(1);

// 4️⃣ Index Operations

// a. Simple index on roll_no
db.Students_287.createIndex({ roll_no: 1 });

// b. Unique index on Tname
db.Teachers_287.createIndex({ Tname: 1 }, { unique: true });

// c. Compound index on dname and salary
db.Teachers_287.createIndex({ dname: 1, salary: -1 });

// 5️⃣ Show Indexes

// a. All collections' indexes
db.getCollectionNames().forEach(function(coll) {
  print("Indexes for collection: " + coll);
  printjson(db[coll].getIndexes());
});

// b. Show indexes in Teachers_287 and Students_287
db.Teachers_287.getIndexes();
db.Students_287.getIndexes();

// 1. Create Database
use PCCOE

// 2. Create Collections
db.createCollection("Teachers")
db.createCollection("Students")

// 3. Insert Data into Teachers
db.Teachers.insertMany([
  { Tname: "Praveen", dno: 101, dname: "Computer", experience: 8, salary: 12000, date_of_joining: "2018-06-15" },
  { Tname: "Rahul", dno: 102, dname: "IT", experience: 5, salary: 11000, date_of_joining: "2019-07-20" },
  { Tname: "Anjali", dno: 103, dname: "E&TC", experience: 7, salary: 9000, date_of_joining: "2017-03-10" }
])

// 4. Insert Data into Students
db.Students.insertMany([
  { Sname: "Amit", roll_no: 1, class: "SE" },
  { Sname: "Rahul", roll_no: 2, class: "TE" },
  { Sname: "xyz", roll_no: 3, class: "BE" }
])

// 5. All teachers
db.Teachers.find().pretty()

// 6. Teachers from Computer department
db.Teachers.find({ dname: "Computer" }).pretty()

// 7. Teachers from Computer, IT, E&TC
db.Teachers.find({ dname: { $in: ["Computer", "IT", "E&TC"] } }).pretty()

// 8. Teachers from above depts with salary ≥ 10000
db.Teachers.find({ dname: { $in: ["Computer", "IT", "E&TC"] }, salary: { $gte: 10000 } }).pretty()

// 9. Student with roll_no = 2 or Sname = "xyz"
db.Students.find({ $or: [{ roll_no: 2 }, { Sname: "xyz" }] }).pretty()

// 10. Update experience of Praveen to 10 (upsert)
db.Teachers.updateOne(
  { Tname: "Praveen" },
  { $set: { experience: 10 } },
  { upsert: true }
)

// 11. Update IT dept to COMP
db.Teachers.updateMany(
  { dname: "IT" },
  { $set: { dname: "COMP" } }
)

// 12. Display teacher name and experience
db.Teachers.find({}, { Tname: 1, experience: 1, _id: 0 })

// 13. Insert into Departments collection
db.Departments.insertOne({ dno: 104, dname: "Mechanical" })

// 14. Use save/insertOne to update Praveen's dept to IT
db.Teachers.insertOne({ 
    Tname: "Praveen", 
    dname: "IT", 
    experience: 10, 
    salary: 12000, 
    date_of_joining: "2018-06-15" 
})

// 15. Delete teachers in IT department
db.Teachers.deleteMany({ dname: "IT" })

// 16. First 3 teachers in ascending order
db.Teachers.find().sort({ Tname: 1 }).limit(3).pretty()

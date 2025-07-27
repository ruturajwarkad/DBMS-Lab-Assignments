// Step 1: Use the database
use PCCOE;

// Step 2: Insert sample data
db.Teachers_287.insertMany([
  { Tname: "Praveen", dno: 1, dname: "COMP", experience: 10, salary: 15000 },
  { Tname: "Anjali", dno: 2, dname: "IT", experience: 5, salary: 10000 },
  { Tname: "Suresh", dno: 1, dname: "COMP", experience: 8, salary: 12000 },
  { Tname: "Neha", dno: 3, dname: "E&TC", experience: 6, salary: 9000 },
  { Tname: "Amit", dno: 2, dname: "IT", experience: 3, salary: 9500 }
]);

db.Orders_287.insertMany([
  { cust_id: "abc123", status: "A", price: 25 },
  { cust_id: "abc123", status: "A", price: 75 },
  { cust_id: "xyz456", status: "A", price: 50 },
  { cust_id: "xyz456", status: "B", price: 100 },
  { cust_id: "lmn789", status: "A", price: 150 }
]);

db.zipcode_287.insertMany([
  { _id: "10280", city: "NEW YORK", state: "NY", pop: 5574 },
  { _id: "10281", city: "NEW YORK", state: "NY", pop: 1000 },
  { _id: "90001", city: "LOS ANGELES", state: "CA", pop: 5000 },
  { _id: "10453", city: "BRONX", state: "NY", pop: 3000 },
  { _id: "60601", city: "CHICAGO", state: "IL", pop: 7000 }
]);

// Query 1: Department wise total salary
var mapSalary = function () {
  emit(this.dname, this.salary);
};
var reduceSalary = function (key, values) {
  return Array.sum(values);
};
db.Teachers_287.mapReduce(mapSalary, reduceSalary, { out: "dept_salary_total_287" });
print("1. Department wise total salary:");
db.dept_salary_total_287.find().pretty();

// Query 2: Department wise employee count
var mapCount = function () {
  emit(this.dname, 1);
};
var reduceCount = function (key, values) {
  return Array.sum(values);
};
db.Teachers_287.mapReduce(mapCount, reduceCount, { out: "dept_emp_count_287" });
print("2. Department wise employee count:");
db.dept_emp_count_287.find().pretty();

// Query 3: Total price per customer
var mapOrders = function () {
  emit(this.cust_id, this.price);
};
var reduceOrders = function (key, values) {
  return Array.sum(values);
};
db.Orders_287.mapReduce(mapOrders, reduceOrders, { out: "cust_total_price_287" });
print("3. Total price per customer:");
db.cust_total_price_287.find().pretty();

// Query 4: Total salary of COMP department
var mapComp = function () {
  if (this.dname === "COMP") emit(this.dname, this.salary);
};
var reduceComp = function (key, values) {
  return Array.sum(values);
};
db.Teachers_287.mapReduce(mapComp, reduceComp, { out: "comp_dept_salary_287" });
print("4. Total salary of COMP department:");
db.comp_dept_salary_287.find().pretty();

// Query 5: City-wise population in NY state
var mapNY = function () {
  if (this.state === "NY") emit(this.city, this.pop);
};
var reduceNY = function (key, values) {
  return Array.sum(values);
};
db.zipcode_287.mapReduce(mapNY, reduceNY, { out: "ny_city_population_287" });
print("5. NY state city-wise population:");
db.ny_city_population_287.find().pretty();

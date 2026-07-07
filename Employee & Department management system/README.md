# Employee & Department Management System (SQL)

A robust relational database solution designed to simulate an organizational ecosystem. This project showcases advanced SQL database schema design, data relationships (Primary and Foreign Keys), transactional data operations, and complex conditional data analysis using real-world business scenarios.

---

## 🚀 Project Overview
The core objective of this project is to manage and analyze data across two vital organizational entities: **Employees** and **Departments**. The repository contains the complete execution scripts from database initialization to handling dynamic business challenges like promotions, departmental transfers, and financial reporting.

### Key Skills Demonstrated:
* **DDL (Data Definition Language):** Creating databases, configuring structural constraints (`AUTO_INCREMENT`, `PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`).
* **DML (Data Manipulation Language):** Bulk data insertion, conditional data updates, and record restructuring.
* **Advanced Querying & Aggregations:** Mastering complex conditional clauses (`WHERE`, `LIKE`, `BETWEEN`), text manipulation (`CONCAT`), and departmental data summarization (`GROUP BY`).

---

## 📊 Database Architecture

The system is built on a relational architecture utilizing two tables inside a unified database schema named `EmployeeManagement`.

### 1. Departments Table
Stores department-level logistics, structural hierarchy, and budgetary allocations.
* `DepartmentID` (INT, Primary Key, Auto Increment)
* `DepartmentName` (VARCHAR, Not NULL)
* `Location` (VARCHAR)
* `HeadOfDepartment` (VARCHAR)
* `AnnualBudget` (DECIMAL)

### 2. Employees Table
Tracks workforce records, salary demographics, and chronological career timelines linked to specific business units.
* `EmployeeID` (INT, Primary Key, Auto Increment)
* `FirstName` (VARCHAR)
* `LastName` (VARCHAR)
* `DepartmentID` (INT, Foreign Key referencing Departments)
* `Salary` (DECIMAL)
* `DateOfJoining` (DATE)
* `Email` (VARCHAR, Unique)

---

## 🎯 Business Scenarios Solved
The core of this project addresses multiple structured, real-world case scenarios across different operations:

### 🔹 1. Situational Ingestion (Data Insertion)
Simulated continuous recruitment onboarding cycles and expansion logistics by executing isolated queries for multi-tier departments like Marketing, Legal, and Research.

### 🔹 2. Target Analysis (`WHERE` Clause Operations)
* Extracted targeted talent demographics based on chronological benchmarks (e.g., employees who joined post-January 2024).
* Audited organizational salary thresholds (identifying employees making $> ₹60,000$).
* Performed text-pattern recognition parsing (`LIKE '%@example.com'`) for data scrubbing.

### 🔹 3. Executive Summarization (`GROUP BY` & Aggregations)
* Audited global salary footprints per operational department.
* Tracked workforce scaling velocity by analyzing employee distributions by department and onboarding year.
* Determined minimum, maximum, and average financial run-rates categorized by physical locations/cities.

### 🔹 4. System Maintenance & Logic Updates (`UPDATE` & `DELETE` Clauses)
* Implemented systemic corporate salary indexing (e.g., compounding the IT department's baseline salary by $10\%$).
* Migrated historical text domains dynamically across records using structural string manipulations.
* Handled data deprecation protocols for employee offboarding and restructuring efforts.

---

## 🛠️ How to Run
1. Ensure you have a relational database client installed (e.g., MySQL Workbench, PostgreSQL, or phpMyAdmin).
2. Clone this repository or copy the contents of `Employee_&_Dept_Table_Data.sql`.
3. Run the script file to generate the schema, populate seed data, and see the script's output solutions.

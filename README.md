#  Hospital Management System (SQL)

A beginner-friendly SQL project for managing patients, doctors, appointments, and billing.  
This project demonstrates **relational database design**, **joins**, and **business reporting queries**.

---

##  Overview
This project allows a hospital to:
- Store patient and doctor details  
- Schedule appointments  
- Record diagnoses and billing details  
- Track payments and generate reports  

---

##  Database Design
**Tables:**
1. `patients` – stores patient personal information  
2. `doctors` – stores doctor details and specializations  
3. `appointments` – links patients and doctors with diagnoses  
4. `bills` – maintains billing and payment records  

**Relationships:**
- One patient can have multiple appointments  
- One doctor can attend many patients  
- Each appointment can have one bill  

---

##  Setup Instructions
1. Download [`hospital_management_system.sql`](hospital_management_system.sql)  
2. Open MySQL / Oracle SQL Developer  
3. Execute the file to create database and tables  
4. Run the sample queries to generate reports  

---

##  Key SQL Concepts Used
- Primary and Foreign Keys  
- Joins (INNER, LEFT)  
- Aggregate Functions (`SUM`, `COUNT`)  
- CRUD Operations  
- Filtering with `WHERE`, `GROUP BY`, and `HAVING`

---


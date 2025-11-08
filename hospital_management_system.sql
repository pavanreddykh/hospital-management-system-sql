-- --------------------------------------------------
-- HOSPITAL MANAGEMENT SYSTEM (SQL PROJECT)
-- --------------------------------------------------

-- Create Database
CREATE DATABASE hospital_management;
USE hospital_management;

-- --------------------------------------------------
-- 1. TABLE: patients
-- --------------------------------------------------
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- --------------------------------------------------
-- 2. TABLE: doctors
-- --------------------------------------------------
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

-- --------------------------------------------------
-- 3. TABLE: appointments
-- --------------------------------------------------
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    diagnosis VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- --------------------------------------------------
-- 4. TABLE: bills
-- --------------------------------------------------
CREATE TABLE bills (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- --------------------------------------------------
-- INSERT SAMPLE DATA
-- --------------------------------------------------
INSERT INTO patients (patient_name, age, gender, phone, address) VALUES
('Rahul Kumar', 28, 'Male', '9876543210', 'Bangalore'),
('Priya Sharma', 34, 'Female', '9123456789', 'Hyderabad'),
('Amit Patel', 45, 'Male', '9988776655', 'Chennai'),
('Sneha Rao', 25, 'Female', '9001234567', 'Mysuru');

INSERT INTO doctors (doctor_name, specialization, phone, email) VALUES
('Dr. Ramesh', 'Cardiologist', '9998887770', 'ramesh@hospital.com'),
('Dr. Anjali', 'Dermatologist', '8887776660', 'anjali@hospital.com'),
('Dr. Kiran', 'Neurologist', '7776665550', 'kiran@hospital.com');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, diagnosis) VALUES
(1, 1, '2025-11-01', 'High Blood Pressure'),
(2, 2, '2025-11-02', 'Skin Allergy'),
(3, 3, '2025-11-03', 'Migraine'),
(4, 1, '2025-11-05', 'Chest Pain');

INSERT INTO bills (appointment_id, amount, payment_status) VALUES
(1, 1500.00, 'Paid'),
(2, 1000.00, 'Unpaid'),
(3, 1200.00, 'Paid'),
(4, 2000.00, 'Unpaid');

-- --------------------------------------------------
-- SAMPLE QUERIES
-- --------------------------------------------------

-- 1. View all patients with their doctors and appointment details
SELECT p.patient_name, d.doctor_name, d.specialization, a.appointment_date, a.diagnosis
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;

-- 2. Count total appointments by each doctor
SELECT d.doctor_name, COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name;

-- 3. Find unpaid bills
SELECT p.patient_name, b.amount, b.payment_status
FROM bills b
JOIN appointments a ON b.appointment_id = a.appointment_id
JOIN patients p ON a.patient_id = p.patient_id
WHERE b.payment_status = 'Unpaid';

-- 4. Total revenue generated
SELECT SUM(amount) AS total_revenue FROM bills WHERE payment_status = 'Paid';

-- 5. List all appointments scheduled for a given date
SELECT p.patient_name, d.doctor_name, a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date = '2025-11-02';

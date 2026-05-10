create database hospital; 

use hospital;

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_name VARCHAR(50),
    patient_age INT,
    patient_gender VARCHAR(10),
    doctor_name VARCHAR(50),
    specialization VARCHAR(50),
    appointment_date DATE,
    appointment_time TIME,
    hospital_name VARCHAR(100),
    city VARCHAR(50),
    consultation_fee INT,
    payment_status VARCHAR(20),
    disease VARCHAR(100),
    room_number INT,
    follow_up_required BOOLEAN
);


INSERT INTO Appointments VALUES
(1, 'Amit Sharma', 30, 'Male', 'Dr. Mehta', 'Cardiology', '2026-04-01', '10:00:00', 'City Hospital', 'Nagpur', 500, 'Paid', 'Heart Issue', 101, TRUE),
(2, 'Priya Verma', 25, 'Female', 'Dr. Rao', 'Dermatology', '2026-04-02', '11:30:00', 'Metro Hospital', 'Nagpur', 300, 'Pending', 'Skin Allergy', 102, FALSE),
(3, 'Rahul Jain', 40, 'Male', 'Dr. Singh', 'Orthopedic', '2026-04-03', '09:00:00', 'City Hospital', 'Nagpur', 700, 'Paid', 'Fracture', 103, TRUE),
(4, 'Neha Patil', 35, 'Female', 'Dr. Mehta', 'Cardiology', '2026-04-04', '12:00:00', 'Metro Hospital', 'Nagpur', 500, 'Paid', 'BP Issue', 104, FALSE),
(5, 'Vikas Gupta', 50, 'Male', 'Dr. Rao', 'Dermatology', '2026-04-05', '02:00:00', 'City Hospital', 'Nagpur', 300, 'Pending', 'Skin Infection', 105, TRUE),
(6, 'Sneha Kulkarni', 28, 'Female', 'Dr. Singh', 'Orthopedic', '2026-04-06', '03:00:00', 'Metro Hospital', 'Nagpur', 700, 'Paid', 'Back Pain', 106, FALSE),
(7, 'Arjun Das', 45, 'Male', 'Dr. Mehta', 'Cardiology', '2026-04-07', '10:30:00', 'City Hospital', 'Nagpur', 500, 'Pending', 'Chest Pain', 107, TRUE),
(8, 'Pooja Shah', 32, 'Female', 'Dr. Rao', 'Dermatology', '2026-04-08', '01:00:00', 'Metro Hospital', 'Nagpur', 300, 'Paid', 'Acne', 108, FALSE),
(9, 'Rohit Joshi', 38, 'Male', 'Dr. Singh', 'Orthopedic', '2026-04-09', '11:00:00', 'City Hospital', 'Nagpur', 700, 'Paid', 'Knee Pain', 109, TRUE),
(10, 'Kiran Naik', 29, 'Female', 'Dr. Mehta', 'Cardiology', '2026-04-10', '04:00:00', 'Metro Hospital', 'Nagpur', 500, 'Pending', 'Heart Checkup', 110, FALSE);

SELECT * FROM Appointments;

-- Create a view to show only patient name and doctor name
create view Name2 as
select patient_name,doctor_name from Appointments; 

SELECT * FROM Name2;


-- Create a view to show only Cardiology patients.
create view crd_patient as
select * from Appointments where specialization='Cardiology'; 

SELECT * FROM crd_patient;

-- Create a view for only Paid appointment
create view paid_apoinment as
select * from Appointments where payment_status='paid'; 

SELECT * FROM paid_apoinment;

-- Create a view for only Paid appointments and prevent inserting unpaid data 
CREATE VIEW v_PaidAppointments AS
SELECT appointment_id,patient_name,appointment_date,payment_status FROM Appointments
WHERE payment_status = 'Paid'
WITH CHECK OPTION;

SELECT * FROM v_PaidAppointments;

-- Q1.Create a view patient_doctor_view that shows:
-- patient_name
-- doctor_name
-- specialization
-- Then display all records from the view.
Create view patient_doctor_view as
SELECT patient_name,doctor_name,specialization from Appointments;

SELECT * FROM patient_doctor_view;


-- Q2.Create a view nagpur_appointments that shows only:
-- Records where city = 'Nagpur'
-- Include patient_name, hospital_name, appointment_date
-- Query the view and sort by date.

Create view nagpur_apointments as
SELECT patient_name, hospital_name, appointment_date,city from Appointments
where city = 'Nagpur' 
order by appointment_date DESC;

SELECT * FROM nagpur_apointments;

-- Q3.Create a view cardiology_high_fee:
-- Only Cardiology patients
-- consultation_fee > 400
-- Display patient_name, doctor_name, fee
Create view cardiology_high_fee as
SELECT patient_name, doctor_name, consultation_fee from Appointments
where specialization='Cardiology' and consultation_fee > 400;

SELECT * FROM cardiology_high_fee;

-- Q4.Create a view cardiology_view_check:
-- specialization = 'Cardiology'
-- WITH CHECK OPTION
-- Try inserting:
-- One valid record
-- One invalid record (Dermatology)

Create  view cardiology_view_check as
SELECT appointment_id,doctor_name,specialization from Appointments 
where specialization = 'Cardiology'
WITH CHECK OPTION;

SELECT * FROM cardiology_view_check;

insert into cardiology_view_check(appointment_id,doctor_name,specialization) values
(11,'Dr.Patil','Cardiology');-- Valid record

insert into cardiology_view_check(appointment_id,doctor_name,specialization) values
(11,'Dr.Patil','Dermitologist');-- Invalid record

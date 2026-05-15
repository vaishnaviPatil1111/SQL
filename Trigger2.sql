CREATE TABLE employee1 (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employee1 (emp_id, name, department, salary) VALUES
(1, 'Amit', 'HR', 30000.00),
(2, 'Neha', 'IT', 45000.00),
(3, 'Rahul', 'Finance', 40000.00),
(4, 'Sneha', 'IT', 50000.00),
(5, 'Rohit', 'HR', 32000.00),
(6, 'Pooja', 'Marketing', 35000.00),
(7, 'Karan', 'Finance', 42000.00),
(8, 'Anjali', 'IT', 48000.00),
(9, 'Vikas', 'Marketing', 37000.00),
(10, 'Priya', 'HR', 31000.00);


CREATE TABLE employee_backup (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    action VARCHAR(10),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

SET SQL_SAFE_UPDATES = 0;

DELIMITER //

CREATE TRIGGER delete_backup_emp
BEFORE DELETE ON employee1
FOR EACH ROW
BEGIN  
    INSERT INTO employee_backup 
    VALUES (OLD.emp_id, OLD.name, OLD.department, OLD.salary, 'DELETE', NOW());
END //

DELIMITER ;

SELECT * FROM employee1;

DELIMITER //

CREATE TRIGGER updated_backup_emp
BEFORE UPDATE ON employee1
FOR EACH ROW
BEGIN  
    INSERT INTO employee_backup 
    VALUES (OLD.emp_id, OLD.name, OLD.department, OLD.salary, 'UPDATE', NOW());
END //

DELIMITER ;







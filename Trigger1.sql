use raw;



drop table students ;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    english INT DEFAULT 0,
    hindi INT DEFAULT 0,
    bio INT DEFAULT 0,
    total_marks INT,
    avg_marks DECIMAL(5,2),
    created_at DATETIME
); 


delimiter //

create TRIGGER before_insert_data 
before insert on students 
for each row 
BEGIN  

set new.total_marks=new.english+new.hindi+new.bio;


set new.avg_marks=(new.english+new.hindi+new.bio)/3; 

set  new.created_at=now();  

end // 

delimiter ;


DELIMITER //

CREATE TRIGGER before_update_students
BEFORE UPDATE ON students
FOR EACH ROW
BEGIN

SET NEW.total_marks = NEW.english + NEW.hindi + NEW.bio;

SET NEW.avg_marks = (NEW.english + NEW.hindi + NEW.bio) / 3;

END //

DELIMITER ;




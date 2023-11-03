CREATE DATABASE IF NOT EXISTS HETAV;

USE HETAV;

CREATE TABLE IF NOT EXISTS c4(
    Roll_No INT PRIMARY KEY,
    Stdudent_Name VARCHAR(50) NOT NULL,
    Enrollment_No INT UNIQUE,
    Batch VARCHAR(50),
    Age INT
);

INSERT INTO c4
VALUES
(1, "Hetav Shah", 220179, "c4", 19),
(2, "Varun Thacker", 220176, "c4", 17),
(3, "Aditya Singh", 220189, "c4", 18);
SELECT * FROM c4;

DELIMITER //

CREATE PROCEDURE Retrieve_Students_Age()
BEGIN
    -- Step 1: Declare variables
    DECLARE student_name VARCHAR(30);
    DECLARE student_age INT;

    DECLARE done INT DEFAULT FALSE;
    -- Step 2: Declare a cursor to select students over 19 years old
    DECLARE student_cursor CURSOR FOR
        SELECT Stdudent_Name, Age
        FROM c4
        WHERE Roll_No = 1;

    -- Handle exceptions if the cursor doesn't exist
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Step 3: Open the cursor
    OPEN student_cursor;

    read_loop: LOOP
        -- Step 3 (continued): Fetch data from the cursor
        FETCH student_cursor INTO student_name, student_age;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- Step 4: Process the retrieved data as needed (you can print or use the data here)
        SELECT CONCAT(student_name, ' has age = ', student_age);
    END LOOP;

    -- Step 5: Close the cursor
    CLOSE student_cursor;

END;
//

-- To call the cursor procedure
DELIMITER ;
CALL Retrieve_Students_Age();

DELIMITER //
-- Step 6: Deallocate the cursor (optional)
DEALLOCATE PREPARE student_cursor;
//

DELIMITER //
CREATE TRIGGER update_batch
BEFORE INSERT ON c4
FOR EACH ROW
BEGIN
    -- Set the Batch to 'C1' for new student inserts
    SET NEW.Batch = 'C1';
END;
//

DELIMITER ;
INSERT INTO c4
VALUES
(4, "Riken Prajapati", 220169, "c2" ,18);
SELECT * FROM c4;

DROP DATABASE IF EXISTS HETAV;
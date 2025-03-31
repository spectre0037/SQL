--CREATE AND INSERTION INTO TABLE
-- Create the PATIENTS table
CREATE TABLE PATIENTS (
    p_no VARCHAR(13) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Doctor VARCHAR(100) NOT NULL,
    Admission_year INTEGER CHECK (Admission_year > 0),
    Age NUMERIC CHECK (Age >= 0)
);

-- Insert values into the PATIENTS table
INSERT INTO PATIENTS (p_no, Name, Doctor, Admission_year, Age) VALUES
('978-1982127794', 'George Orwell', 'Dr. Charles', 1999, 78),
('978-0141187761', 'Harper Lee', 'Dr. Mohini', 2004, 67),
('978-0061120084', 'Maria Collin', 'Dr. Charles', 2011, 50);



--TASK:1

-- Function to get patient record by p_no
CREATE OR REPLACE FUNCTION Patients_record(p_no_input VARCHAR)
RETURNS TABLE (
    p_no VARCHAR,
    Name VARCHAR,
    Doctor VARCHAR,
    Admission_year INTEGER,
    Age NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    SELECT p_no, Name, Doctor, Admission_year, Age
    FROM PATIENTS
    WHERE p_no = p_no_input;
END;
$$ LANGUAGE plpgsql;



--TASK:2

-- Anonymous block to declare and use cursor
DO $$
DECLARE
    rec RECORD;
    patient_cursor CURSOR FOR
        SELECT Name, Admission_year FROM PATIENTS;
BEGIN
    OPEN patient_cursor;
    LOOP
        FETCH NEXT FROM patient_cursor INTO rec;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'Patient: %, Admission Year: %', rec.Name, rec.Admission_year;
    END LOOP;
    CLOSE patient_cursor;
END $$;



--TASK:3

-- Procedure to print patient record based on p_no
CREATE OR REPLACE PROCEDURE GetPatientRecord(p_no_input VARCHAR)
LANGUAGE plpgsql
AS $$
DECLARE
    rec RECORD;
BEGIN
    SELECT * INTO rec
    FROM PATIENTS
    WHERE p_no = p_no_input;

    IF rec IS NULL THEN
        RAISE NOTICE 'Patient not found.';
    ELSE
        RAISE NOTICE 'p_no: %, Name: %, Doctor: %, Admission Year: %, Age: %',
                     rec.p_no, rec.Name, rec.Doctor, rec.Admission_year, rec.Age;
    END IF;
END;
$$;

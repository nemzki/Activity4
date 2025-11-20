CREATE DATABASE veterinary;

CREATE TABLE owners
(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);


CREATE TABLE animals(
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors(
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialty VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices
(
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount NUMERIC(10,2),
    paymentdate TIME,
    FOREIGN KEY(appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords(
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate TIMESTAMP, 
    doctorid INT,
    diagnosis TEXT,
    prescription TEXT,
    notes TEXT,
    FOREIGN KEY(animalid) references animals(animalid),
    FOREIGN KEY(doctorid) references doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES (1, 'Jim John', 'Ebreo', 'Rosario', 09123456789, 'ebreo@gmail.com'),
        (2, 'Shenna', 'Bellen', 'Japan', 09223456789, 'bellen@gmail.com'),
        (3, 'Gee-Anne', 'Lescano', 'Catalina', 09323456789, 'lescano@gmail.com'),
        (4, 'Rona', 'Silva', 'Sico', 09423456789, 'silva@gmail.com'),
        (5, 'John', 'Doe', 'Cavite', 09523456789, 'doe@gmail.com'),
        (6, 'Hannah', 'Cuevas', 'Cuenca', 09623456789, 'cuevas@gmail.com'),
        (7, 'Monica', 'Pornela', 'BSU', 09723456789, 'pornela@gmail.com'),
        (8, 'Ambross', 'Matibag', 'Taga-Gubat', 09823456789, 'matibag@gmail.com'),
        (9, 'Angela', 'Dalangin', 'San Jose', 09923456789, 'dalangin@gmail.com'),
        (10, 'Jhon Rhey', 'Tenorio', 'Taga sa kanila', 09133456789, 'tenors@gmail.com');


INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES (01, 'Matcha', 'Dog', 'Toy Poodle', '2005-03-29', 'Female', 'Brown', 1),
        (02, 'Mocha', 'Dog', 'Shih Tzu', '2010-07-15', 'Male', 'White', 2),
        (03, 'Luna', 'Cat', 'Persian', '2018-11-03', 'Female', 'Gray', 3),
        (04, 'Buddy', 'Dog', 'Labrador', '2012-02-21', 'Male', 'Black', 4),
        (05, 'Choco', 'Dog', 'Pomeranian', '2016-09-10', 'Male', 'Brown', 5),
        (06, 'Nala', 'Cat', 'Siamese', '2019-05-27', 'Female', 'Cream', 6),
        (07, 'Rocky', 'Dog', 'Bulldog', '2014-12-08', 'Male', 'Brindle', 7),
        (08, 'Mimi', 'Cat', 'British Shorthair', '2020-01-19', 'Female', 'Blue', 8),
        (09, 'Kobe', 'Dog', 'Golden Retriever', '2013-06-02', 'Male', 'Gold', 9),
        (10, 'Snow', 'Dog', 'Samoyed', '2017-08-14', 'Female', 'White', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES (1, 01, '2025-11-16', 'Check up'),
        (2, 02, '2025-11-17', 'Vaccination'),
        (3, 03, '2025-11-18', 'Grooming'),
        (4, 04, '2025-11-19', 'Vaccnation'),
        (5, 05, '2025-11-20', 'Deworming'),
        (6, 06, '2025-11-21', 'X-ray'),
        (7, 07, '2025-11-22', 'Dental Cleaning'),
        (8, 08, '2025-11-23', 'Check up'),
        (9, 09, '2025-11-24', 'Flea Treatment'),
        (10, 10, '2025-11-25', 'Blood Test');

INSERT INTO doctors(doctorid, dfirstname, dlastname, specialty, phone, email)
VALUES  (1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
        (2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
        (3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
        (4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
        (5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
        (6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registereddate DATE;

ALTER TABLE invoices 
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM invoices WHERE appointid = 3;
DELETE FROM appointments WHERE appointid = 3;

UPDATE doctors 
SET dlastname = 'Mendoza' 
WHERE doctorid = 3;

SELECT DISTINCT species
FROM animals;

SELECT SUM(totalamount) FROM invoices;
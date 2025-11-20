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
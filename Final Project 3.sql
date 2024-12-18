CREATE DATABASE dealership;
USE dealership;

CREATE TABLE IF NOT EXISTS Address (
    address_id INT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL
);


CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    supervisor_id INT,
    department VARCHAR(255),
    salary DECIMAL(10, 2) NOT NULL,
    commission DECIMAL(5, 2),
    emp_status VARCHAR(50),
    address_id INT,
    ssn VARCHAR(11) NOT NULL,
    date_of_birth DATE NOT NULL,
    hire_date DATE NOT NULL,
    email VARCHAR(255),
    phone_num VARCHAR(20) NOT NULL,
    qtr_sales DECIMAL(10, 2),
    location_id INT NOT NULL    
);

CREATE TABLE IF NOT EXISTS Location (
    location_id INT PRIMARY KEY,
    address_id INT NOT NULL,
    capacity INT,
    phone_num VARCHAR(20) NOT NULL,
    manager_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES Employee(employee_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS VehicleType (
    type_id INT PRIMARY KEY,
    engine_type VARCHAR(50),
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    trim VARCHAR(50) NOT NULL,
    prod_year INT NOT NULL,
    mpg DECIMAL(5, 2)
);

CREATE TABLE IF NOT EXISTS Vehicle (
    vin VARCHAR(17) PRIMARY KEY,
    vehicle_status VARCHAR(50) NOT NULL,
    title_type VARCHAR(50) NOT NULL,
    color VARCHAR(50),
    location_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    mileage DECIMAL(10, 2) NOT NULL,
    type_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
		ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    FOREIGN KEY (type_id) REFERENCES VehicleType(type_id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE
);



CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY,
    employee_id INT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    address_id INT,
    phone VARCHAR(20),
    email VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS TestDrive (
    customer_id INT,
    employee_id INT NOT NULL,
    date_time DATETIME,
    location_id INT NOT NULL,
    vin VARCHAR(17),
    PRIMARY KEY (customer_id, date_time, vin),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
		ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (vin) REFERENCES Vehicle(vin)
		ON DELETE RESTRICT
        ON UPDATE CASCADE
);

ALTER TABLE Employee
ADD FOREIGN KEY (supervisor_id) REFERENCES Employee(employee_id)
	ON DELETE SET NULL
    ON UPDATE CASCADE,
ADD FOREIGN KEY (address_id) REFERENCES Address(address_id)
	ON DELETE SET NULL
    ON UPDATE CASCADE,
ADD FOREIGN KEY (location_id) REFERENCES Location(location_id)
	ON DELETE RESTRICT
    ON UPDATE CASCADE
;
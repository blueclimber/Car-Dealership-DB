CREATE TABLE IF NOT EXISTS Address (
    address_id INT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(2),
    zip VARCHAR(10)
);


CREATE TABLE IF NOT EXISTS Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    supervisor_id INT,
    department VARCHAR(255),
    salary DECIMAL(10, 2),
    commission DECIMAL(5, 2),
    emp_status VARCHAR(50),
    address_id INT,
    ssn VARCHAR(11),
    date_of_birth DATE,
    hire_date DATE,
    email VARCHAR(255),
    phone_num VARCHAR(20),
    qtr_sales DECIMAL(10, 2),
    location_id INT    
);

CREATE TABLE IF NOT EXISTS Location (
    location_id INT PRIMARY KEY,
    address_id INT,
    capacity INT,
    phone_num VARCHAR(20),
    manager_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (manager_id) REFERENCES Employee(employee_id)
);

CREATE TABLE IF NOT EXISTS Type (
    type_id INT PRIMARY KEY,
    engine_type VARCHAR(50),
    make VARCHAR(50),
    model VARCHAR(50),
    trim VARCHAR(50),
    year INT,
    mpg DECIMAL(5, 2)
);

CREATE TABLE IF NOT EXISTS Vehicle (
    vin VARCHAR(17) PRIMARY KEY,
    status VARCHAR(50),
    title_type VARCHAR(50),
    color VARCHAR(50),
    location_id INT,
    price DECIMAL(10, 2),
    mileage DECIMAL(10, 2),
    type_id INT,
    FOREIGN KEY (location_id) REFERENCES Location(location_id),
    FOREIGN KEY (type_id) REFERENCES Type(type_id)
);



CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY,
    employee_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address_id INT,
    phone VARCHAR(20),
    email VARCHAR(255),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);


CREATE TABLE IF NOT EXISTS TestDrive (
    customer_id INT,
    employee_id INT,
    date_time DATETIME,
    location_id INT,
    vin VARCHAR(17),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id),
    FOREIGN KEY (vin) REFERENCES Vehicle(vin)
);

ALTER TABLE Employee
ADD FOREIGN KEY (supervisor_id) REFERENCES Employee(employee_id),
ADD FOREIGN KEY (address_id) REFERENCES Address(address_id),
ADD FOREIGN KEY (location_id) REFERENCES Location(location_id);
USE dealership;

-- Address data population
INSERT INTO address (address_id, street, city, state, zip)
VALUES 
	(801, "121 Foo Road", "Foo City", "PA", "84000"),
    (802, "17 My Road", "My City", "PA", "95000"),
    (803, "1782 Place Road", "Place City", "PA", "11000"),
    (804, "42 Dealership Place", "Stanton", "PA", "98765"),
    (805, "77 Dealership Road", "Place City", "PA", "11000"),
    (806, "1254 Dealership Parkway", "Foo City", "PA", "84000"),
    (807, "27 4th Street", "Foo City", "PA", "84000"),
    (808, "18 127th Ave", "Stanton", "PA", "98765"),
    (809, "485 6th St #B", "Place City", "PA", "11000");
 
 -- Location data population
INSERT INTO location (location_id, address_id, capacity, phone_num, manager_id)
VALUES 
	(1, 805, 50, "444-44-4444", null),
    (2, 806, 40, "555-55-5555", null),
    (3, 804, 30, "666-66-6666", null);
 
 
 -- Employee data population
INSERT INTO employee (employee_id, first_name, last_name, supervisor_id, department, salary, commission, emp_status, address_id, ssn, date_of_birth, hire_date, email, phone_num, qtr_sales, location_id) 
VALUES 
	(1101, "Foo", "Johnson", null, "Sales", 150000.00, 500.00, "full-time", 802, "111-11-1111", "2000-05-12", "2023-06-07", "foo@foo.com", "121-122-1212", 5.00, 1),
	(1102, "Chad", "Smith", null, "Human Resources", 120000.00, 0.00, "part-time", 801, "222-22-2222", "2001-06-11", "2023-06-07", "my@my.com", "232-232-2323", 0.00, 2),
    (1103, "Sally", "Brown", 1101, "Sales", 160000.00, 750.00, "full-time", 803, "333-33-3333", "2002-04-08", "2020-08-08", "place@place.com", "343-345-3434", 7.00, 1),
    (1104, "Tom", "Hanks", 1102, "Human Resources", 63000.00, 0.00, "part-time", 807, "123-35-5678", "1987-03-17", "2021-09-01", "this@that.com", "343-345-5555", 0.00, 2);

UPDATE location
	SET manager_id = 1102 
    WHERE location_id = 1;


UPDATE location
	SET manager_id = 1101
    WHERE location_id = 3;
   
-- Vehicle Type data population
INSERT INTO vehicletype (type_id, engine_type, make, model, trim, prod_year, mpg)
VALUES 
	(18, "V8", "Ford", "Bronco", "Chrome", 2008, 15.7),
    (19, "V6", "Honda", "Accord", "Paint", 2010, 16.7),
    (20, "V4", "Hyundai", "Kona", "Clip-On", 2018, 30.7);
    
-- Vehicle data population
INSERT INTO vehicle (vin, vehicle_status, title_type, color, location_id, price, mileage, type_id)
VALUES 
	(12345678901234567, "test-drive", "clear", "red", 1, 50000.50, 106777.88, 18),
    (22222222222222222, "sold", "salvage", "blue", 2, 40000.50, 90000.00, 19),
    (33333333333333333, "on-lot", "junk", "green", 3, 2000.47, 200000.12, 20);
    
-- Customer data population
INSERT INTO customer (customer_id, employee_id, first_name, last_name, address_id, phone, email)
VALUES 
	(100, 1101, "James", "Jameson", 801, "777-777-7777", "james@james.com"),
    (200, 1101, "George", "Georgeson", 809, "999-999-9999", "george@george.com"),
    (300, 1103, "Molly", "Mollyson", 808, "101-101-1010", "molly@molly.com"),
    (301, 1103, "Harry", "Mollyson", 808, null, null),
    (302, 1103, "Sally", "Mollyson", 808, "101-101-2000", "sally@molly.com");
    
-- Test Drive data population
INSERT INTO testdrive (customer_id, employee_id, date_time, location_id, vin)
 VALUES 
	(100, 1101, "2024-03-15 14:30:00" , 1, 12345678901234567),
    (200, 1101, "2024-02-02 12:30:00", 2, 22222222222222222),
    (300, 1103, "2024-05-05 05:30:00", 3, 33333333333333333),
    (301, 1103, "2024-05-06 09:45:00", 3, 33333333333333333),
    (302, 1103, "2024-05-06 11:45:00", 3, 33333333333333333),
    (302, 1103, "2024-05-06 12:45:00", 1, 12345678901234567);
    

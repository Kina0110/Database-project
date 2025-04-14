-- Insert data into `People`

-- SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `company_database`.`People` (`Personal_id`, `Fname`, `Lname`, `Age`, `Phone_number`, `Gender`, `Address_line_1`, `Address_line_2`, `Zipcode`, `City`, `State`) VALUES
(1, 'John', 'Doe', 30, 1234567890, 'Male', 'Address Line 1A', 'Address Line 2A', 12345, 'City A', 'State A'),
(2, 'Jane', 'Doe', 25, 2345678901, 'Female', 'Address Line 1B', 'Address Line 2B', 23456, 'City B', 'State B'),
(3, 'Jim', 'Beam', 35, 3456789012, 'Male', 'Address Line 1C', 'Address Line 2C', 34567, 'City C', 'State C'),
(4, 'Hellen', 'Cole', 28, 4567890123, 'Female', 'Address Line 1D', 'Address Line 2D', 45678, 'City D', 'State D'), 
(5, 'Sarah', 'Park', 40, 1234125287, 'Male', 'Address Line 1E', 'Address Line 2E', 12938, 'Bellevue', 'Washington'), 
(6, 'Yakina', 'Azza', 12, 1283727521, 'Female', 'Address Line 1F', 'Address Line 2F', 68349, 'Austin', 'Texas'), 
(7, 'Dev', 'Kumar', 20, 4255297401, 'Male', 'Address Line 1G', 'Address Line 2G', 12445, 'Dallas', 'Texas');

-- Insert data into `Potential_employee`
INSERT INTO `company_database`.`Potential_employee` (`Personal_id`, `Degree_name`, `Year`) VALUES
(4, 'MBA', '2010');

-- Insert data into `Department`
INSERT INTO `company_database`.`Department` (`Dept_id`, `Dept_name`) VALUES
(1, 'Marketing'),
(2, 'Sales'),
(3, 'HR');

-- Insert data into `Job_position`
INSERT INTO `company_database`.`Job_position` (`Job_id`, `Dept_id`, `Job_description`, `Posted_date`) VALUES
(11111, 1, 'Marketing Manager', '2011-01-15'),
(11112, 1, 'Marketing Intern', '2011-01-16'),
(12345, 2, 'Sales Executive', '2011-01-20'),
(54321, 3, 'HR Specialist', '2011-02-10');

-- Insert data into `Employee_1`
INSERT INTO `company_database`.`Employee_1` (`Personal_id`, `Dept_id`, `Start_time`, `End_time`, `Rank`, `Title`, `Transaction_number`, `Amount`, `Pay_date`) VALUES
(1, 1, '2010-01-01 09:00:00', '2010-01-01 17:00:00', 'Senior', 'Manager', 1001, 5000.0, '2011-01-31'),
(2, 1, '2010-01-01 09:00:00', '2010-01-01 17:00:00', 'Junior', 'Executive', 1002, 3000.0, '2011-01-31'),
(3, 3, '2010-01-01 09:00:00', '2010-01-01 17:00:00', 'Senior', 'Specialist', 1003, 4000.0, '2011-01-31');

-- Insert data into `Employee_2`
INSERT INTO `company_database`.`Employee_2` (`Personal_id`, `Supervisor_id`) VALUES
(1, NULL),
(2, 1),
(3, 1);

-- Insert data into `Interviews_1`
INSERT INTO `company_database`.`Interviews_1` (`Personal_id`, `Job_id`, `Candidates`, `Interviews`) VALUES
(4, 11111, 'Hellen Cole', 'Interview A');

-- Insert data into `Interviews_2`
INSERT INTO `company_database`.`Interviews_2` (`Job_id`, `Job_position`) VALUES
(11111, 'Marketing Manager');

-- Insert data into `Interviews_3`
INSERT INTO `company_database`.`Interviews_3` (`Candidates`, `Grades`) VALUES
('Hellen Cole', 'A');

-- Insert data into `Interviews_4`
INSERT INTO `company_database`.`Interviews_4` (`Interviews`, `Interview_times`) VALUES
('Interview A', '2011-01-20');

-- Insert data into `Marketing Sites`
INSERT INTO `company_database`.`Marketing Sites` (`Site_id`, `Site name`, `Location`) VALUES
(1, 'Site A', 'Location A'),
(2, 'Site B', 'Location B'),
(3, 'Site C', 'Location C');

-- Insert data into `Works_on_1`
INSERT INTO `company_database`.`Works_on_1` (`Personal_id`, `Side_id`, `Salespeople`, `Customers`) VALUES
(1, 1, 'Salesperson A', 'Customer A'),
(2, 2, 'Salesperson B', 'Customer B'),
(3, 3, 'Salesperson C', 'Customer C');

-- Insert data into `Works_on_2`
INSERT INTO `company_database`.`Works_on_2` (`Site_id`, `Sites`) VALUES
(1, 'Site A'),
(2, 'Site B'),
(3, 'Site C');

-- Insert data into `Works_on_3`
INSERT INTO `company_database`.`Works_on_3` (`Salespeople`, `Customers`, `Product`, `Sale_time`) VALUES
('Salesperson A', 'Customer A', 'Product A', '2011-03-01 10:00:00'),
('Salesperson B', 'Customer B', 'Product B', '2011-03-01 11:00:00'),
('Salesperson C', 'Customer C', 'Product C', '2011-03-01 12:00:00');

-- Insert data into `Product_1`
INSERT INTO `company_database`.`Product_1` (`Product_id`, `Product_type`) VALUES
(1, 'Type A'),
(2, 'Type B'),
(3, 'Type C');

-- Insert data into `Product_2`
INSERT INTO `company_database`.`Product_2` (`Product_type`, `List_price`, `Weight`, `Style`) VALUES
('Type A', 500.0, 1.5, 'Style A'),
('Type B', 250.0, 2.5, 'Style B'),
('Type C', 300.0, 3.5, 'Style C');

-- Insert data into `Parts_1`
INSERT INTO `company_database`.`Parts_1` (`Part_id`, `Part_type`, `Vendor_id`, `Price`, `Product_id`) VALUES
(1, 'Part A', 1, 50.0, 1),
(2, 'Part B', 2, 60.0, 2),
(3, 'Part C', 3, 70.0, 3),
(4, 'Cup', 1, 40.0, 1);

-- Insert data into `Parts_2`
INSERT INTO `company_database`.`Parts_2` (`Part_type`, `No. of_part_type`) VALUES
('Part A', 10),
('Part B', 20),
('Part C', 30),
('Cup', 5);

-- Insert data into `Vendor_1`Personal_id
INSERT INTO `company_database`.`Vendor_1` (`Vendor_id`, `Vendor_name`, `Vendor_address`, `Acct_number`, `PW_URL`) VALUES
(1, 'Vendor A', 'Address A', 1001, 'URL A'),
(2, 'Vendor B', 'Address B', 1002, 'URL B'),
(3, 'Vendor C', 'Address C', 1003, 'URL C'),
(4, 'Vendor D', 'Address D', 1004, 'URL D');

-- Insert data into `Vendor_2`
INSERT INTO `company_database`.`Vendor_2` (`Acct_number`, `Credit_rating`) VALUES
(1001, 5),
(1002, 4),
(1003, 3);

-- Insert data into `Contains`
INSERT INTO `company_database`.`Contains` (`Product_id`, `Side_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert data into `Applies_to`
INSERT INTO `company_database`.`Applies_to` (`Personal_id`, `Job_id`) VALUES
(1, 12345),
(2, 54321),
(3, 11111);

SET FOREIGN_KEY_CHECKS = 1;
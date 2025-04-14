-- Schema company_database
CREATE SCHEMA IF NOT EXISTS `company_database` DEFAULT CHARACTER SET utf8 ;
USE `company_database` ;

-- Table `company_database`.`Marketing Sites`
CREATE TABLE IF NOT EXISTS `company_database`.`Marketing Sites` (
  `Site_id` INT NOT NULL,
  `Site name` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(225) NULL,
  PRIMARY KEY (`Site_id`),
  UNIQUE INDEX `Site_id_UNIQUE` (`Site_id` ASC),
  UNIQUE INDEX `Site name_UNIQUE` (`Site name` ASC) )
;

-- Table `company_database`.`Product_1`
CREATE TABLE IF NOT EXISTS `company_database`.`Product_1` (
  `Product_id` INT NOT NULL,
  `Product_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Product_id`, `Product_type`),
  UNIQUE INDEX `Product_type_UNIQUE` (`Product_type` ASC) ,
  UNIQUE INDEX `Product_id_UNIQUE` (`Product_id` ASC) )
;

-- Table `company_database`.`Product_2`
CREATE TABLE IF NOT EXISTS `company_database`.`Product_2` (
  `Product_type` VARCHAR(45) NOT NULL,
  `List_price` DECIMAL(45) NULL,
  `Weight` DECIMAL(45) NULL,
  `Style` VARCHAR(45) NULL,
  PRIMARY KEY (`Product_type`),
  UNIQUE INDEX `Product_type_UNIQUE` (`Product_type` ASC) ,
  CONSTRAINT `Product_type1`
    FOREIGN KEY (`Product_type`)
    REFERENCES `company_database`.`Product_1` (`Product_type`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
;

-- Table `company_database`.`Vendor_1`
CREATE TABLE IF NOT EXISTS `company_database`.`Vendor_1` (
  `Vendor_id` INT NOT NULL,
  `Vendor_name` VARCHAR(45) NULL,
  `Vendor_address` VARCHAR(255) NULL,
  `Acct_number` INT NOT NULL,
  `PW_URL` VARCHAR(255) NULL,
  PRIMARY KEY (`Vendor_id`),
  UNIQUE INDEX `Acct_number_UNIQUE` (`Acct_number` ASC) ,
  UNIQUE INDEX `Vendor_id_UNIQUE` (`Vendor_id` ASC) )
;

-- Table `company_database`.`Parts_1`
CREATE TABLE IF NOT EXISTS `company_database`.`Parts_1` (
  `Part_id` INT NOT NULL,
  `Part_type` VARCHAR(45) NOT NULL,
  `Vendor_id` INT NOT NULL,
  `Price` DECIMAL(45) NULL,
  `Product_id` INT NOT NULL,
  PRIMARY KEY (`Part_id`, `Part_type`),
  INDEX `Product_id_idx` (`Product_id` ASC) ,
--   INDEX `Vendor_id_idx` (`Vendor_id` ASC) ,
  UNIQUE INDEX `Part_id_UNIQUE` (`Part_id` ASC) ,
  UNIQUE INDEX `Part_type_UNIQUE` (`Part_type` ASC) ,
  CONSTRAINT `Product_id2`
    FOREIGN KEY (`Product_id`)
    REFERENCES `company_database`.`Product_1` (`Product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
--   CONSTRAINT `Vendor_id1`
--     FOREIGN KEY (`Vendor_id`)
--     REFERENCES `company_database`.`Vendor_1` (`Vendor_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION)
-- ;

-- Table `company_database`.`Parts_2`
CREATE TABLE IF NOT EXISTS `company_database`.`Parts_2` (
  `Part_type` VARCHAR(45) NOT NULL,
  `No. of_part_type` INT NULL,
  PRIMARY KEY (`Part_type`),
  UNIQUE INDEX `Part_type_UNIQUE` (`Part_type` ASC) ,
  CONSTRAINT `Part_type1`
    FOREIGN KEY (`Part_type`)
    REFERENCES `company_database`.`Parts_1` (`Part_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Vendor_2`
CREATE TABLE IF NOT EXISTS `company_database`.`Vendor_2` (
  `Acct_number` INT NOT NULL,
  `Credit_rating` INT NULL,
  PRIMARY KEY (`Acct_number`),
  UNIQUE INDEX `Acct_number_UNIQUE` (`Acct_number` ASC) ,
  CONSTRAINT `Acct_number1`
    FOREIGN KEY (`Acct_number`)
    REFERENCES `company_database`.`Vendor_1` (`Acct_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Department`
CREATE TABLE IF NOT EXISTS `company_database`.`Department` (
  `Dept_id` INT NOT NULL,
  `Dept_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Dept_id`),
  UNIQUE INDEX `Dept_id_UNIQUE` (`Dept_id` ASC) ,
  UNIQUE INDEX `Dept_name_UNIQUE` (`Dept_name` ASC) )
;

-- Table `company_database`.`Job_position`
CREATE TABLE IF NOT EXISTS `company_database`.`Job_position` (
  `Job_id` INT NOT NULL,
  `Dept_id` INT NOT NULL,
  `Job_description` VARCHAR(255) NULL,
  `Posted_date` VARCHAR(45) NULL,
  PRIMARY KEY (`Job_id`, `Dept_id`),
  INDEX `Dept_id_idx` (`Dept_id` ASC) ,
  UNIQUE INDEX `Job_id_UNIQUE` (`Job_id` ASC) ,
  CONSTRAINT `Dept_id3`
    FOREIGN KEY (`Dept_id`)
    REFERENCES `company_database`.`Department` (`Dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`People`
CREATE TABLE IF NOT EXISTS `company_database`.`People` (
  `Personal_id` INT NOT NULL,
  `Fname` VARCHAR(45) NULL,
  `Lname` VARCHAR(45) NULL,
  `Age` INT NULL,
  `Phone_number` BIGINT NULL,
  `Gender` VARCHAR(6) NULL,
  `Address_line_1` VARCHAR(45) NULL,
  `Address_line_2` VARCHAR(45) NULL,
  `Zipcode` INT NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  PRIMARY KEY (`Personal_id`),
  UNIQUE INDEX `Personal_id_UNIQUE` (`Personal_id` ASC) )
;

-- Table `company_database`.`Employee_1`
CREATE TABLE IF NOT EXISTS `company_database`.`Employee_1` (
  `Personal_id` INT NOT NULL,
  `Dept_id` INT NOT NULL,
  `Start_time` DATETIME NULL,
  `End_time` DATETIME NULL,
  `Rank` VARCHAR(45) NULL,
  `Title` VARCHAR(45) NULL,
  `Transaction_number` INT NULL,
  `Amount` DECIMAL(45) NULL,
  `Pay_date` DATETIME NULL,
  PRIMARY KEY (`Personal_id`, `Dept_id`),
  INDEX `Dept_id_idx` (`Dept_id` ASC) ,
  UNIQUE INDEX `Personal_id_UNIQUE` (`Personal_id` ASC),
  CONSTRAINT `Dept_id1`
    FOREIGN KEY (`Dept_id`)
    REFERENCES `company_database`.`Department` (`Dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Personal_id8`
    FOREIGN KEY (`Personal_id`)
    REFERENCES `company_database`.`People` (`Personal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Employee_2`
CREATE TABLE IF NOT EXISTS `company_database`.`Employee_2` (
  `Personal_id` INT NOT NULL,
  `Supervisor_id` INT NULL,
  PRIMARY KEY (`Personal_id`),
  INDEX `Supervisor_id_idx` (`Supervisor_id` ASC) ,
  UNIQUE INDEX `Personal_id_UNIQUE` (`Personal_id` ASC) ,
  CONSTRAINT `Personal_id1`
    FOREIGN KEY (`Personal_id`)
    REFERENCES `company_database`.`Employee_1` (`Personal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Supervisor_id1`
    FOREIGN KEY (`Supervisor_id`)
    REFERENCES `company_database`.`Employee_1` (`Personal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Potential_employee`
CREATE TABLE IF NOT EXISTS `company_database`.`Potential_employee` (
  `Personal_id` INT NOT NULL,
  `Degree_name` VARCHAR(45) NULL,
  `Year` YEAR(4) NULL,
  PRIMARY KEY (`Personal_id`),
  UNIQUE INDEX `Personal_id_UNIQUE` (`Personal_id` ASC) ,
  CONSTRAINT `Personal_id2`
    FOREIGN KEY (`Personal_id`)
    REFERENCES `company_database`.`People` (`Personal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Contains`
CREATE TABLE IF NOT EXISTS `company_database`.`Contains` (
  `Product_id` INT NOT NULL,
  `Side_id` INT NOT NULL,
  PRIMARY KEY (`Product_id`, `Side_id`),
  INDEX `Site_id_idx` (`Side_id` ASC) ,
  UNIQUE INDEX `Product_id_UNIQUE` (`Product_id` ASC) ,
  UNIQUE INDEX `Side_id_UNIQUE` (`Side_id` ASC) ,
  CONSTRAINT `Product_id1`
    FOREIGN KEY (`Product_id`)
    REFERENCES `company_database`.`Product_1` (`Product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Site_id1`
    FOREIGN KEY (`Side_id`)
    REFERENCES `company_database`.`Marketing Sites` (`Site_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Applies_to`
CREATE TABLE IF NOT EXISTS `company_database`.`Applies_to` (
  `Personal_id` INT NOT NULL,
  `Job_id` INT NOT NULL,
  PRIMARY KEY (`Personal_id`, `Job_id`),
  INDEX `Job_id_idx` (`Job_id` ASC) ,
  UNIQUE INDEX `Personal_id_UNIQUE` (`Personal_id` ASC) ,
  UNIQUE INDEX `Job_id_UNIQUE` (`Job_id` ASC) ,
  CONSTRAINT `Personal_id3`
    FOREIGN KEY (`Personal_id`)
    REFERENCES `company_database`.`Employee_1` (`Personal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Job_id1`
    FOREIGN KEY (`Job_id`)
    REFERENCES `company_database`.`Job_position` (`Job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Customers`
CREATE TABLE IF NOT EXISTS `company_database`.`Customers` (
  `Personal_id` INT NOT NULL,
  `Pref_salespeople` VARCHAR(45) NULL,
  PRIMARY KEY (`Personal_id`),
  UNIQUE INDEX `Personal_id_UNIQUE` (`Personal_id` ASC) ,
  CONSTRAINT `Personal_id4`
    FOREIGN KEY (`Personal_id`)
    REFERENCES `company_database`.`People` (`Personal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Interviews_1`
CREATE TABLE IF NOT EXISTS `company_database`.`Interviews_1` (
  `Personal_id` INT NOT NULL,
  `Job_id` INT NOT NULL,
  `Candidates` VARCHAR(45) NOT NULL,
  `Interviews` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Personal_id`, `Job_id`),
  INDEX `Job_id_idx` (`Job_id` ASC),
  UNIQUE INDEX `Candidates_UNIQUE` (`Candidates` ASC),
  UNIQUE INDEX `Interviews_UNIQUE` (`Interviews` ASC),
  UNIQUE INDEX `Personal_id_UNIQUE` (`Personal_id` ASC),
  -- Ensuring `Job_id` is unique
  UNIQUE INDEX `Job_id_UNIQUE` (`Job_id` ASC),  
  CONSTRAINT `Personal_id5`
    FOREIGN KEY (`Personal_id`)
    REFERENCES `company_database`.`Potential_employee` (`Personal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
--   CONSTRAINT `Personal_id6`
--     FOREIGN KEY (`Personal_id`)
--     REFERENCES `company_database`.`Employee_1` (`Personal_id`)
--     ON DELETE NO ACTION
--     ON UPDATE NO ACTION,
  CONSTRAINT `Job_id2`
    FOREIGN KEY (`Job_id`)
    REFERENCES `company_database`.`Job_position` (`Job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

-- Table `company_database`.`Interviews_2`
CREATE TABLE IF NOT EXISTS `company_database`.`Interviews_2` (
  `Job_id` INT NOT NULL,
  `Job_position` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Job_id`),
  UNIQUE INDEX `Job_id_UNIQUE` (`Job_id` ASC),
  UNIQUE INDEX `Job_position_UNIQUE` (`Job_position` ASC),
  CONSTRAINT `Job_id3`
    FOREIGN KEY (`Job_id`)
    REFERENCES `company_database`.`Interviews_1` (`Job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);


-- Table `company_database`.`Interviews_3`
CREATE TABLE IF NOT EXISTS `company_database`.`Interviews_3` (
  `Candidates` VARCHAR(45) NOT NULL,
  `Grades` VARCHAR(45) NULL,
  PRIMARY KEY (`Candidates`),
  UNIQUE INDEX `Candidates_UNIQUE` (`Candidates` ASC) ,
  UNIQUE INDEX `Grades_UNIQUE` (`Grades` ASC) ,
  CONSTRAINT `Candidates1`
    FOREIGN KEY (`Candidates`)
    REFERENCES `company_database`.`Interviews_1` (`Candidates`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Interviews_4`
CREATE TABLE IF NOT EXISTS `company_database`.`Interviews_4` (
  `Interviews` VARCHAR(255) NOT NULL,
  `Interview_times` DATE NULL,
  PRIMARY KEY (`Interviews`),
  UNIQUE INDEX `Interviews_UNIQUE` (`Interviews` ASC) ,
  CONSTRAINT `Interviews1`
    FOREIGN KEY (`Interviews`)
    REFERENCES `company_database`.`Interviews_1` (`Interviews`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Works_on_1`
CREATE TABLE IF NOT EXISTS `company_database`.`Works_on_1` (
  `Personal_id` INT NOT NULL,
  `Side_id` INT NOT NULL,
  `Salespeople` VARCHAR(45) NULL,
  `Customers` VARCHAR(45) NULL,
  PRIMARY KEY (`Personal_id`, `Side_id`),
  UNIQUE INDEX `Customers_UNIQUE` (`Customers` ASC) ,
  UNIQUE INDEX `Salespeople_UNIQUE` (`Salespeople` ASC) ,
  INDEX `Site_id_idx` (`Side_id` ASC) ,
  UNIQUE INDEX `Personal_id_UNIQUE` (`Personal_id` ASC) ,
  UNIQUE INDEX `Side_id_UNIQUE` (`Side_id` ASC) ,
  CONSTRAINT `Personal_id7`
    FOREIGN KEY (`Personal_id`)
    REFERENCES `company_database`.`Employee_1` (`Personal_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Site_id2`
    FOREIGN KEY (`Side_id`)
    REFERENCES `company_database`.`Marketing Sites` (`Site_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Works_on_2`
CREATE TABLE IF NOT EXISTS `company_database`.`Works_on_2` (
  `Site_id` INT NOT NULL,
  `Sites` VARCHAR(45) NULL,
  PRIMARY KEY (`Site_id`),
  UNIQUE INDEX `Site_id_UNIQUE` (`Site_id` ASC) ,
  CONSTRAINT `Site_id3`
    FOREIGN KEY (`Site_id`)
    REFERENCES `company_database`.`Works_on_1` (`Side_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- Table `company_database`.`Works_on_3`
CREATE TABLE IF NOT EXISTS `company_database`.`Works_on_3` (
  `Salespeople` VARCHAR(45) NOT NULL,
  `Customers` VARCHAR(45) NOT NULL,
  `Product` VARCHAR(45) NULL,
  `Sale_time` DATETIME NULL,
  PRIMARY KEY (`Salespeople`, `Customers`),
  INDEX `Customer_idx` (`Customers` ASC) ,
  UNIQUE INDEX `Salespeople_UNIQUE` (`Salespeople` ASC) ,
  UNIQUE INDEX `Customers_UNIQUE` (`Customers` ASC) ,
  CONSTRAINT `Salespeople1`
    FOREIGN KEY (`Salespeople`)
    REFERENCES `company_database`.`Works_on_1` (`Salespeople`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Customers1`
    FOREIGN KEY (`Customers`)
    REFERENCES `company_database`.`Works_on_1` (`Customers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;



CREATE TABLE `department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(255) NOT NULL,
  `num_employees` INT DEFAULT 0,
  `department_code` VARCHAR(50) UNIQUE,
  PRIMARY KEY (`department_id`)
);


CREATE TABLE `employee` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `phone_number` VARCHAR(20),
  `email` VARCHAR(255) NOT NULL UNIQUE,
  `address` VARCHAR(255),
  `start_date` DATE NOT NULL,
  `employment_status` ENUM('Full-time', 'Part-time', 'Contract', 'Intern') NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `department` (`department_id`),
  INDEX `idx_employee_email` (`email`)
);


CREATE TABLE `intern_detail` (
  `employee_id` INT NOT NULL,
  `internship_program` VARCHAR(255) NOT NULL,
  `field_of_study` VARCHAR(255) NOT NULL,
  `graduation_year` YEAR NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_employee_id_intern`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`employee_id`)
);


CREATE TABLE `project` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(255) NOT NULL,
  `project_start_date` DATE NOT NULL,
  `project_end_date` DATE NOT NULL,
  `project_lead_id` INT NOT NULL,
  PRIMARY KEY (`project_id`),
  CONSTRAINT `fk_project_lead_id`
    FOREIGN KEY (`project_lead_id`)
    REFERENCES `employee` (`employee_id`),
  CONSTRAINT `chk_project_dates` CHECK (`project_end_date` >= `project_start_date`)
);


CREATE TABLE `inventory` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(255) NOT NULL,
  `item_description` TEXT,
  `quantity` INT NOT NULL DEFAULT 0,
  `condition` ENUM('New', 'Good', 'Fair', 'Poor') NOT NULL,
  `employee_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`inventory_id`),
  CONSTRAINT `fk_employee_id_inventory`
    FOREIGN KEY (`employee_id`)
    REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_project_id_inventory`
    FOREIGN KEY (`project_id`)
    REFERENCES `project` (`project_id`)
);


CREATE TABLE `task` (
  `task_id` INT NOT NULL AUTO_INCREMENT,
  `task_name` VARCHAR(255) NOT NULL,
  `task_description` TEXT,
  `task_status` ENUM('Not Started', 'In Progress', 'Completed', 'On Hold') NOT NULL,
  `task_priority` ENUM('Low', 'Medium', 'High', 'Critical') NOT NULL,
  `task_assigned_to_id` INT NOT NULL,
  `task_project_id` INT NOT NULL,
  `due_date` DATE,
  PRIMARY KEY (`task_id`),
  CONSTRAINT `fk_task_assigned_to_id`
    FOREIGN KEY (`task_assigned_to_id`)
    REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_task_project_id`
    FOREIGN KEY (`task_project_id`)
    REFERENCES `project` (`project_id`)
);


CREATE TABLE `client` (
  `client_id` INT NOT NULL AUTO_INCREMENT,
  `client_name` VARCHAR(255) NOT NULL,
  `client_email` VARCHAR(255) NOT NULL UNIQUE,
  `client_phone_number` VARCHAR(20),
  `client_website` VARCHAR(255),
  `client_industry` VARCHAR(255),
  `client_country` VARCHAR(255),
  PRIMARY KEY (`client_id`),
  INDEX `idx_client_email` (`client_email`)
);


CREATE TABLE `invoice` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `invoice_date` DATE NOT NULL,
  `invoice_amount` DECIMAL(10, 2) NOT NULL,
  `invoice_status` ENUM('Draft', 'Sent', 'Paid', 'Overdue') NOT NULL,
  `client_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  CONSTRAINT `fk_client_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `client` (`client_id`),
  CONSTRAINT `fk_project_id`
    FOREIGN KEY (`project_id`)
    REFERENCES `project` (`project_id`)
);

-- Trigger to update num_employees in department table
DELIMITER //
CREATE TRIGGER update_num_employees
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    UPDATE department
    SET num_employees = num_employees + 1
    WHERE department_id = NEW.department_id;
END;
//
DELIMITER ;
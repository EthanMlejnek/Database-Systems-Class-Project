INSERT INTO `department` (`department_name`, `num_employees`, `department_code`) VALUES
('Human Resources', 15, 'HR001'),
('Finance', 20, 'FIN001'),
('Marketing', 25, 'MKT001'),
('Sales', 30, 'SAL001'),
('Information Technology', 40, 'IT001'),
('Research and Development', 35, 'RND001'),
('Customer Service', 50, 'CS001'),
('Operations', 45, 'OPS001'),
('Legal', 10, 'LGL001'),
('Product Management', 18, 'PM001'),
('Quality Assurance', 22, 'QA001'),
('Business Development', 12, 'BD001'),
('Public Relations', 8, 'PR001'),
('Facilities Management', 20, 'FM001'),
('Supply Chain', 30, 'SC001');

-- Disable foreign key checks temporarily to avoid issues with department_id references
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `employee` (
    `first_name`, `last_name`, `date_of_birth`, `phone_number`, 
    `email`, `address`, `start_date`, `employment_status`, `department_id`
) VALUES
-- Human Resources (department_id: 1)
('John', 'Doe', '1985-03-15', '555-0101', 'john.doe@example.com', '123 Main St, Anytown, AN 12345', '2018-01-15', 'Full-time', 1),
('Jane', 'Smith', '1990-07-22', '555-0102', 'jane.smith@example.com', '456 Elm St, Somewhere, SW 67890', '2019-03-01', 'Full-time', 1),
('Emily', 'Johnson', '1988-11-30', '555-0103', 'emily.johnson@example.com', '789 Oak St, Nowhere, NW 13579', '2017-06-01', 'Part-time', 1),

-- Finance (department_id: 2)
('Michael', 'Brown', '1982-09-05', '555-0201', 'michael.brown@example.com', '321 Pine St, Elsewhere, EL 24680', '2015-04-01', 'Full-time', 2),
('Sarah', 'Davis', '1992-01-18', '555-0202', 'sarah.davis@example.com', '654 Cedar St, Anyplace, AP 97531', '2020-02-15', 'Full-time', 2),
('David', 'Wilson', '1987-06-11', '555-0203', 'david.wilson@example.com', '987 Birch St, Somewhere, SW 35791', '2016-09-01', 'Contract', 2),

-- Marketing (department_id: 3)
('Jennifer', 'Taylor', '1991-04-25', '555-0301', 'jennifer.taylor@example.com', '147 Maple St, Nowhere, NW 75319', '2018-07-01', 'Full-time', 3),
('Robert', 'Anderson', '1986-08-14', '555-0302', 'robert.anderson@example.com', '258 Walnut St, Elsewhere, EL 95135', '2017-11-15', 'Full-time', 3),
('Lisa', 'Thomas', '1993-12-03', '555-0303', 'lisa.thomas@example.com', '369 Spruce St, Anytown, AN 15935', '2021-01-10', 'Intern', 3),

-- Sales (department_id: 4)
('William', 'Jackson', '1984-02-29', '555-0401', 'william.jackson@example.com', '741 Ash St, Somewhere, SW 75395', '2016-03-01', 'Full-time', 4),
('Mary', 'White', '1989-10-17', '555-0402', 'mary.white@example.com', '852 Elm St, Nowhere, NW 95135', '2019-05-15', 'Full-time', 4),
('James', 'Harris', '1994-07-07', '555-0403', 'james.harris@example.com', '963 Oak St, Elsewhere, EL 35791', '2022-02-01', 'Part-time', 4),

-- Information Technology (department_id: 5)
('Patricia', 'Martin', '1983-05-20', '555-0501', 'patricia.martin@example.com', '159 Pine St, Anyplace, AP 75319', '2015-08-01', 'Full-time', 5),
('Richard', 'Thompson', '1990-09-09', '555-0502', 'richard.thompson@example.com', '267 Cedar St, Somewhere, SW 95135', '2018-11-15', 'Full-time', 5),
('Elizabeth', 'Garcia', '1995-03-28', '555-0503', 'elizabeth.garcia@example.com', '378 Birch St, Nowhere, NW 35791', '2021-06-01', 'Contract', 5),

-- Research and Development (department_id: 6)
('Charles', 'Martinez', '1981-11-12', '555-0601', 'charles.martinez@example.com', '483 Maple St, Elsewhere, EL 75319', '2014-09-01', 'Full-time', 6),
('Susan', 'Robinson', '1988-04-05', '555-0602', 'susan.robinson@example.com', '592 Walnut St, Anytown, AN 95135', '2017-12-15', 'Full-time', 6),
('Joseph', 'Clark', '1993-08-23', '555-0603', 'joseph.clark@example.com', '701 Spruce St, Somewhere, SW 35791', '2020-07-01', 'Intern', 6),

-- Customer Service (department_id: 7)
('Margaret', 'Rodriguez', '1986-01-30', '555-0701', 'margaret.rodriguez@example.com', '816 Ash St, Nowhere, NW 75319', '2016-05-01', 'Full-time', 7),
('Thomas', 'Lewis', '1991-06-19', '555-0702', 'thomas.lewis@example.com', '927 Elm St, Elsewhere, EL 95135', '2019-08-15', 'Part-time', 7),
('Dorothy', 'Lee', '1996-10-08', '555-0703', 'dorothy.lee@example.com', '038 Oak St, Anyplace, AP 35791', '2022-03-01', 'Full-time', 7);

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- identify the interns from our employee table
SELECT employee_id, first_name, last_name 
FROM employee 
WHERE employment_status = 'Intern';


INSERT INTO `intern_detail` (
    `employee_id`, 
    `internship_program`, 
    `field_of_study`, 
    `graduation_year`
) VALUES
(9, 'Summer Marketing Internship', 'Marketing', 2024),
(18, 'R&D Innovation Program', 'Computer Science', 2023);

INSERT INTO `project` (
    `project_name`,
    `project_start_date`,
    `project_end_date`,
    `project_lead_id`
) VALUES
-- IT Projects
('ERP System Implementation', '2023-01-15', '2024-06-30', 14),
('Cloud Migration', '2023-03-01', '2023-12-31', 15),
('Cybersecurity Enhancement', '2023-05-01', '2024-04-30', 16),

-- Marketing Projects
('Product Launch Campaign', '2023-06-01', '2023-09-30', 7),
('Digital Marketing Optimization', '2023-04-15', '2024-04-14', 8),
('Brand Refresh', '2023-07-01', '2024-01-31', 9),

-- Research and Development Projects
('New Product Development', '2023-02-01', '2024-07-31', 16),
('Process Improvement Study', '2023-08-01', '2024-02-29', 17),
('Sustainable Materials Research', '2023-09-15', '2024-09-14', 18),

-- Sales Projects
('CRM System Upgrade', '2023-05-15', '2023-11-30', 10),
('Sales Team Training Program', '2023-07-01', '2023-12-31', 11),
('Market Expansion Strategy', '2023-10-01', '2024-09-30', 12),

-- Human Resources Projects
('Employee Engagement Initiative', '2023-04-01', '2024-03-31', 1),
('Talent Acquisition System Implementation', '2023-06-15', '2023-12-15', 2),
('Diversity and Inclusion Program', '2023-08-01', '2024-07-31', 3),

-- Finance Projects
('Financial Reporting System Upgrade', '2023-03-15', '2023-09-30', 4),
('Cost Optimization Study', '2023-07-01', '2024-06-30', 5),
('Blockchain Integration for Payments', '2023-09-01', '2024-08-31', 6),

-- Customer Service Projects
('Customer Support Chatbot Development', '2023-05-01', '2023-11-30', 19),
('Customer Feedback Analysis System', '2023-08-15', '2024-02-15', 20);

INSERT INTO `inventory` (
    `item_name`, 
    `item_description`, 
    `quantity`, 
    `condition`, 
    `employee_id`, 
    `project_id`
) VALUES
-- IT Project Items
('Server Rack', 'Dell PowerEdge R740 Server Rack', 5, 'New', 14, 1),
('Cloud Storage', 'AWS S3 Storage (in TB)', 100, 'New', 15, 2),
('Firewall Appliance', 'Cisco ASA 5500-X Series', 3, 'New', 16, 3),

-- Marketing Project Items
('Digital Camera', 'Canon EOS R5 Mirrorless Camera', 2, 'New', 7, 4),
('Marketing Analytics Software', 'Adobe Analytics License', 10, 'New', 8, 5),
('Design Workstation', 'iMac Pro 27-inch', 5, 'New', 9, 6),

-- R&D Project Items
('3D Printer', 'Ultimaker S5 Pro Bundle', 2, 'New', 16, 7),
('Laboratory Equipment Set', 'Complete Lab Setup', 1, 'Good', 17, 8),
('Spectrometer', 'Thermo Scientific Nicolet iS50', 1, 'New', 18, 9),

-- Sales Project Items
('CRM Software Licenses', 'Salesforce Enterprise Edition', 50, 'New', 10, 10),
('Training Materials', 'Sales Training Handbook', 100, 'New', 11, 11),
('Market Research Reports', 'Industry Analysis Reports', 5, 'New', 12, 12),

-- HR Project Items
('Survey Software', 'Qualtrics Employee Engagement Platform', 1, 'New', 1, 13),
('Applicant Tracking System', 'Workday Recruiting', 1, 'New', 2, 14),
('Training Videos', 'Diversity and Inclusion Video Series', 1, 'New', 3, 15),

-- Finance Project Items
('Financial Software', 'SAP S/4HANA Finance', 1, 'New', 4, 16),
('Data Visualization Tool', 'Tableau Desktop Professional', 10, 'New', 5, 17),
('Blockchain Development Kit', 'Ethereum Development Suite', 5, 'New', 6, 18),

-- Customer Service Project Items
('AI Development Platform', 'Google Cloud AI Platform', 1, 'New', 19, 19),
('Data Analysis Software', 'SPSS Statistics', 5, 'New', 20, 20);

INSERT INTO `client` (
    `client_name`,
    `client_email`,
    `client_phone_number`,
    `client_website`,
    `client_industry`,
    `client_country`
) VALUES
('TechNova Solutions', 'contact@technovasolutions.com', '+1-555-0101', 'www.technovasolutions.com', 'Information Technology', 'United States'),
('GreenLeaf Enterprises', 'info@greenleaf.com', '+44-20-1234-5678', 'www.greenleafenterprises.co.uk', 'Sustainable Energy', 'United Kingdom'),
('Quantum Dynamics Corp', 'support@quantumdynamics.com', '+1-555-0102', 'www.quantumdynamics.com', 'Aerospace', 'United States'),
('Global Health Initiatives', 'contact@globalhealth.org', '+41-22-123-4567', 'www.globalhealthinitiatives.org', 'Healthcare', 'Switzerland'),
('NextGen Robotics', 'info@nextgenrobotics.com', '+81-3-1234-5678', 'www.nextgenrobotics.co.jp', 'Robotics', 'Japan'),
('EcoSmart Buildings', 'support@ecosmart.com', '+61-2-9876-5432', 'www.ecosmartbuildings.com.au', 'Construction', 'Australia'),
('FintechFlow', 'contact@fintechflow.com', '+353-1-123-4567', 'www.fintechflow.ie', 'Financial Technology', 'Ireland'),
('Gourmet Delights International', 'info@gourmetdelights.com', '+33-1-23-45-67-89', 'www.gourmetdelights.fr', 'Food & Beverage', 'France'),
('AutoDrive Innovations', 'support@autodrive.com', '+49-30-123456', 'www.autodriveinnovations.de', 'Automotive', 'Germany'),
('CloudScale Networks', 'info@cloudscale.net', '+1-555-0103', 'www.cloudscalenetworks.com', 'Cloud Computing', 'United States'),
('BioGenetics Research', 'contact@biogenetics.com', '+46-8-123-45-67', 'www.biogeneticsresearch.se', 'Biotechnology', 'Sweden'),
('SmartHome Systems', 'support@smarthome.com', '+82-2-1234-5678', 'www.smarthomesystems.kr', 'Home Automation', 'South Korea'),
('Renewable Energy Collective', 'info@renewablecollective.org', '+45-12-34-56-78', 'www.renewableenergycollective.dk', 'Renewable Energy', 'Denmark'),
('Global Logistics Solutions', 'contact@globallogistics.com', '+31-20-123-4567', 'www.globallogisticssolutions.nl', 'Logistics', 'Netherlands'),
('Quantum Computing Frontiers', 'info@quantumfrontiers.com', '+1-555-0104', 'www.quantumcomputingfrontiers.com', 'Quantum Computing', 'United States');

INSERT INTO `invoice` (
    `invoice_date`,
    `invoice_amount`,
    `invoice_status`,
    `client_id`,
    `project_id`
) VALUES
('2023-03-15', 15000.00, 'Paid', 1, 1),
('2023-04-01', 25000.00, 'Paid', 2, 2),
('2023-05-15', 18000.00, 'Paid', 3, 3),
('2023-06-15', 30000.00, 'Sent', 4, 4),
('2023-07-01', 22000.00, 'Sent', 5, 5),
('2023-07-15', 35000.00, 'Draft', 6, 6),
('2023-08-01', 40000.00, 'Draft', 7, 7),
('2023-08-15', 28000.00, 'Sent', 8, 8),
('2023-09-01', 33000.00, 'Sent', 9, 9),
('2023-09-15', 20000.00, 'Paid', 10, 10),
('2023-10-01', 17000.00, 'Paid', 11, 11),
('2023-10-15', 45000.00, 'Sent', 12, 12),
('2023-11-01', 23000.00, 'Draft', 13, 13),
('2023-11-15', 38000.00, 'Draft', 14, 14),
('2023-12-01', 29000.00, 'Sent', 15, 15),
('2023-12-15', 32000.00, 'Sent', 1, 16),
('2024-01-01', 27000.00, 'Draft', 2, 17),
('2024-01-15', 42000.00, 'Draft', 3, 18),
('2024-02-01', 19000.00, 'Sent', 4, 19),
('2024-02-15', 36000.00, 'Sent', 5, 20);

INSERT INTO `task` (
    `task_name`,
    `task_description`,
    `task_status`,
    `task_priority`,
    `task_assigned_to_id`,
    `task_project_id`,
    `due_date`
) VALUES
-- ERP System Implementation (Project ID: 1)
('Requirements Gathering', 'Collect and document system requirements from all departments', 'In Progress', 'High', 14, 1, '2023-03-15'),
('System Configuration', 'Set up and configure the ERP system according to company needs', 'Not Started', 'High', 15, 1, '2023-05-30'),
('Data Migration', 'Transfer existing data to the new ERP system', 'Not Started', 'Medium', 16, 1, '2023-08-15'),

-- Cloud Migration (Project ID: 2)
('Cloud Infrastructure Setup', 'Set up cloud environment and security protocols', 'In Progress', 'High', 15, 2, '2023-04-30'),
('Application Migration', 'Migrate existing applications to the cloud platform', 'Not Started', 'High', 14, 2, '2023-07-31'),
('Testing and Optimization', 'Perform thorough testing and optimize cloud performance', 'Not Started', 'Medium', 16, 2, '2023-10-31'),

-- Cybersecurity Enhancement (Project ID: 3)
('Security Audit', 'Conduct a comprehensive security audit of current systems', 'Completed', 'High', 16, 3, '2023-06-15'),
('Implement New Security Measures', 'Deploy new security tools and protocols', 'In Progress', 'High', 14, 3, '2023-09-30'),
('Staff Security Training', 'Conduct cybersecurity awareness training for all employees', 'Not Started', 'Medium', 15, 3, '2023-12-15'),

-- Product Launch Campaign (Project ID: 4)
('Market Research', 'Conduct market research for the new product', 'In Progress', 'High', 7, 4, '2023-07-15'),
('Campaign Strategy Development', 'Develop comprehensive marketing strategy for product launch', 'Not Started', 'High', 8, 4, '2023-08-15'),
('Content Creation', 'Create marketing materials for various channels', 'Not Started', 'Medium', 9, 4, '2023-09-15'),

-- Digital Marketing Optimization (Project ID: 5)
('SEO Audit', 'Conduct a thorough SEO audit of the company website', 'Completed', 'High', 8, 5, '2023-05-31'),
('Social Media Strategy Revamp', 'Develop and implement new social media marketing strategies', 'In Progress', 'Medium', 7, 5, '2023-07-31'),
('Analytics Setup', 'Set up comprehensive analytics for all digital marketing channels', 'Not Started', 'High', 9, 5, '2023-09-30'),

-- Brand Refresh (Project ID: 6)
('Brand Analysis', 'Analyze current brand perception and market position', 'In Progress', 'High', 9, 6, '2023-08-15'),
('New Brand Identity Development', 'Design new logo, color scheme, and brand guidelines', 'Not Started', 'High', 7, 6, '2023-10-31'),
('Brand Rollout Plan', 'Develop a strategy for rolling out the new brand identity', 'Not Started', 'Medium', 8, 6, '2023-12-15'),

-- New Product Development (Project ID: 7)
('Concept Development', 'Brainstorm and develop initial product concepts', 'Completed', 'High', 16, 7, '2023-03-31'),
('Prototype Creation', 'Build and test initial product prototypes', 'In Progress', 'High', 17, 7, '2023-06-30'),
('User Testing', 'Conduct user testing sessions with prototype', 'Not Started', 'Medium', 18, 7, '2023-09-30');

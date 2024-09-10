# Database-Systems-Class-Project
This project is a comprehensive database design created for a fictional company. This project aimed to manage and track various entities within its operations efficiently. 
The database is designed to store, retrieve, and manipulate information related to clients, departments, employees, projects, and tasks. 

The goal of this project was to implement a normalized relational database that ensures data integrity, scalability, and efficiency in handling comany data. 

# Database Schema Overview 

The database includes the following tables: 
  1. Client Table: Stores details about clients, including contact information and the services they have engaged with the company
  2. Department Table: Holds information on different departments within the company, their functions, and department heads.
  3. Intern Table: Tracks intern details, including personal information, assigned departments, and projects they are working on.
  4. Invoice Table: Contains records of invoices issued to clients, including amounts, payment statuses, and issue dates.
  5. Project Table: Tracks details of various projects, including client associations, assigned departments, and project timelines.
  6. Task Table: Tracks individual tasks associated with each project, including task descriptions, deadlines, and assignees (interns or departments).

The relationships between these tables have been carefully designed to ensure consistency and normalization, with foreign key constraints ensuring referential integrity across the database.

# Key Features
  - Normalization: The database design follows normalization principles to eliminate redundancy and ensure data integrity.
  - Relational Model: Tables are linked using primary and foreign keys, representing the relationships between entities like clients, projects, departments, and tasks.
  - Scalability: The database structure can easily accommodate new data types and tables as the company's needs grow.
  - Efficient Queries: Complex queries can be run to extract meaningful reports and insights from the data, such as invoices per client, tasks per intern, and department workloads.


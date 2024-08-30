-- Insert test data into Client table
INSERT INTO Client (Name) VALUES 
('Acme Corp'),
('Tech Innovators'),
('Global Solutions'),
('NextGen Enterprises'),
('Prime Services'),
('Alpha Systems'),
('Beta Technologies'),
('Gamma Co.'),
('Delta Solutions'),
('Epsilon Services');

-- Insert test data into Employee table
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, JobTitle, ClientID, Salary, Email, PhoneNumber, Address, City, State, ZipCode, Country, Status) VALUES 
('John', 'Doe', '1985-01-15', 'Male', '2020-06-01', 'Software Engineer', 1, 75000.00, 'john.doe@acme.com', '555-1234', '123 Elm St', 'Springfield', 'IL', '62701', 'USA', 'Active'),
('Jane', 'Smith', '1990-02-25', 'Female', '2019-03-10', 'Project Manager', 2, 85000.00, 'jane.smith@techinnovators.com', '555-5678', '456 Maple Ave', 'Metropolis', 'NY', '10001', 'USA', 'Active'),
('Alice', 'Johnson', '1987-07-18', 'Female', '2021-11-05', 'Business Analyst', 3, 68000.00, 'alice.johnson@globalsolutions.com', '555-8765', '789 Oak Blvd', 'Gotham', 'NJ', '07001', 'USA', 'Active'),
('Bob', 'Williams', '1992-03-22', 'Male', '2018-09-12', 'Data Scientist', 4, 95000.00, 'bob.williams@nextgen.com', '555-4321', '101 Pine St', 'Central City', 'CA', '90001', 'USA', 'Active'),
('Carol', 'Taylor', '1980-11-30', 'Female', '2022-01-25', 'HR Manager', 5, 72000.00, 'carol.taylor@primeservices.com', '555-9876', '102 Birch Rd', 'Star City', 'TX', '73301', 'USA', 'Active'),
('David', 'Brown', '1983-08-19', 'Male', '2021-05-15', 'Network Engineer', 6, 78000.00, 'david.brown@alphasystems.com', '555-6543', '103 Cedar Ln', 'Coast City', 'FL', '32001', 'USA', 'Active'),
('Emily', 'Davis', '1995-04-10', 'Female', '2020-02-22', 'QA Analyst', 7, 62000.00, 'emily.davis@betatech.com', '555-3210', '104 Fir Dr', 'Keystone', 'PA', '17001', 'USA', 'Active'),
('Frank', 'Miller', '1978-12-05', 'Male', '2017-07-14', 'Database Administrator', 8, 88000.00, 'frank.miller@gamma.com', '555-0987', '105 Elm Ct', 'Midway City', 'OH', '43001', 'USA', 'Active'),
('Grace', 'Wilson', '1993-09-23', 'Female', '2022-03-30', 'Marketing Specialist', 9, 66000.00, 'grace.wilson@delta.com', '555-4567', '106 Spruce St', 'Opal City', 'GA', '30001', 'USA', 'Active'),
('Henry', 'Moore', '1986-06-17', 'Male', '2019-11-20', 'DevOps Engineer', 10, 91000.00, 'henry.moore@epsilon.com', '555-7890', '107 Willow Rd', 'Hub City', 'MA', '02101', 'USA', 'Active');

-- Insert more employees
INSERT INTO Employee (FirstName, LastName, DateOfBirth, Gender, HireDate, JobTitle, ClientID, Salary, Email, PhoneNumber, Address, City, State, ZipCode, Country, Status) VALUES 
('Ivy', 'Martin', '1988-10-25', 'Female', '2016-04-18', 'Sales Executive', 1, 69000.00, 'ivy.martin@acme.com', '555-1122', '108 Cherry Ln', 'Bludhaven', 'NV', '89001', 'USA', 'Active'),
('Jack', 'Anderson', '1991-01-07', 'Male', '2020-08-11', 'Cloud Architect', 2, 98000.00, 'jack.anderson@techinnovators.com', '555-3344', '109 Aspen St', 'Fawcett City', 'CO', '80001', 'USA', 'Active'),
('Karen', 'Thomas', '1994-11-09', 'Female', '2018-06-25', 'UX Designer', 3, 71000.00, 'karen.thomas@globalsolutions.com', '555-5566', '110 Dogwood Ave', 'Gateway City', 'AZ', '85001', 'USA', 'Active'),
('Larry', 'Jackson', '1982-05-15', 'Male', '2019-02-13', 'Systems Analyst', 4, 76000.00, 'larry.jackson@nextgen.com', '555-7788', '111 Hawthorn Ct', 'Reno', 'NV', '89501', 'USA', 'Active'),
('Megan', 'White', '1989-12-22', 'Female', '2017-09-06', 'Product Manager', 5, 83000.00, 'megan.white@primeservices.com', '555-9900', '112 Redwood Dr', 'Las Vegas', 'NV', '89101', 'USA', 'Active'),
('Nathan', 'Harris', '1985-07-11', 'Male', '2021-10-29', 'Security Analyst', 6, 89000.00, 'nathan.harris@alphasystems.com', '555-2233', '113 Sequoia Blvd', 'Los Angeles', 'CA', '90001', 'USA', 'Active'),
('Olivia', 'Martinez', '1992-02-14', 'Female', '2020-12-12', 'Graphic Designer', 7, 67000.00, 'olivia.martinez@betatech.com', '555-4455', '114 Poplar St', 'San Francisco', 'CA', '94101', 'USA', 'Active'),
('Paul', 'Clark', '1981-03-18', 'Male', '2018-08-19', 'IT Manager', 8, 94000.00, 'paul.clark@gamma.com', '555-6677', '115 Juniper Ln', 'San Diego', 'CA', '92101', 'USA', 'Active'),
('Quinn', 'Walker', '1990-04-21', 'Male', '2016-05-30', 'Software Developer', 9, 78000.00, 'quinn.walker@delta.com', '555-8899', '116 Magnolia Rd', 'Sacramento', 'CA', '94203', 'USA', 'Active'),
('Rachel', 'Scott', '1984-09-30', 'Female', '2019-07-07', 'Business Development Manager', 10, 86000.00, 'rachel.scott@epsilon.com', '555-1010', '117 Palm St', 'Miami', 'FL', '33101', 'USA', 'Active');

-- Insert test data into PtoBalance table
INSERT INTO PtoBalance (EmployeeID, TotalPTO, AvailablePTO, TakenPTO, TotalExtraPTO, AvailableExtraPTO, TakenExtraPTO) VALUES 
(1, 20, 15, 5, 10, 8, 2),
(2, 25, 20, 5, 15, 12, 3),
(3, 30, 28, 2, 12, 10, 2),
(4, 18, 12, 6, 10, 7, 3),
(5, 22, 20, 2, 8, 6, 2),
(6, 15, 10, 5, 10, 5, 5),
(7, 20, 18, 2, 12, 11, 1),
(8, 25, 22, 3, 15, 13, 2),
(9, 18, 14, 4, 8, 7, 1),
(10, 30, 25, 5, 12, 10, 2),
(11, 22, 19, 3, 10, 9, 1),
(12, 28, 26, 2, 14, 13, 1),
(13, 15, 12, 3, 10, 8, 2),
(14, 20, 17, 3, 12, 9, 3),
(15, 25, 21, 4, 15, 13, 2),
(16, 18, 15, 3, 8, 6, 2),
(17, 30, 28, 2, 12, 10, 2),
(18, 22, 19, 3, 10, 9, 1),
(19, 25, 22, 3, 15, 13, 2),
(20, 18, 15, 3, 8, 7, 1);

-- Insert test data into PtoRequest table
INSERT INTO PtoRequest (EmployeeID, ApproverID, StartDate, EndDate, DaysRequested, Reason, PtoType) VALUES 
(1, 2, '2024-07-01', '2024-07-07', 5, 'Family Vacation', 'PTO'),
(3, 4, '2024-08-15', '2024-08-19', 3, 'Medical', 'PTO'),
(5, 6, '2024-09-05', '2024-09-09', 3, 'Conference', 'Extra PTO'),
(7, 8, '2024-10-10', '2024-10-15', 4, 'Personal', 'PTO'),
(9, 10, '2024-11-20', '2024-11-25', 5, 'Family Event', 'PTO'),
(2, 3, '2024-12-01', '2024-12-05', 3, 'Holiday', 'Extra PTO'),
(4, 5, '2024-12-15', '2024-12-20', 4, 'Travel', 'PTO'),
(6, 7, '2024-01-15', '2024-01-20', 5, 'Study Leave', 'PTO'),
(8, 9, '2024-02-05', '2024-02-10', 4, 'Vacation', 'PTO'),
(10, 11, '2024-03-01', '2024-03-05', 3, 'Medical', 'PTO'),
(11, 12, '2024-04-01', '2024-04-07', 5, 'Family Vacation', 'PTO'),
(13, 14, '2024-05-01', '2024-05-05', 3, 'Conference', 'Extra PTO'),
(15, 16, '2024-06-10', '2024-06-15', 4, 'Study Leave', 'PTO'),
(17, 18, '2024-07-01', '2024-07-07', 5, 'Holiday', 'PTO'),
(19, 20, '2024-08-15', '2024-08-19', 3, 'Travel', 'Extra PTO'),
(14, 15, '2024-09-01', '2024-09-05', 3, 'Personal', 'PTO'),
(16, 17, '2024-10-01', '2024-10-05', 3, 'Family Event', 'PTO'),
(18, 19, '2024-11-01', '2024-11-05', 3, 'Medical', 'PTO'),
(20, 1, '2024-12-01', '2024-12-07', 5, 'Vacation', 'PTO'),
(12, 13, '2024-07-01', '2024-07-07', 5, 'Family Vacation', 'PTO');

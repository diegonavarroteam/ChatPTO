CREATE TABLE Client (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    HireDate DATE NOT NULL,
    JobTitle VARCHAR(100),
    ClientID INT,
    Salary DECIMAL(10, 2),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(10),
    Country VARCHAR(100),
    Status ENUM('Active', 'Inactive') DEFAULT 'Active',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (ClientID) REFERENCES Client(ClientID)
);

CREATE TABLE PtoBalance (
    PtoBalanceID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    TotalPTO INT,
    AvailablePTO INT,
    TakenPTO INT,
    TotalExtraPTO INT,
	AvailableExtraPTO INT,
    TakenExtraPTO INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE PtoRequest (
    PtoRequestID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ApproverID INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    DaysRequested INT NOT NULL,
    Reason VARCHAR(255),
    PtoType ENUM('PTO', 'Extra PTO') DEFAULT 'PTO',
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ApproverID) REFERENCES Employee(EmployeeID)
);
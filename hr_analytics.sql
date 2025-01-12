-- Create Table for Education Levels
CREATE TABLE education_level (
    EducationLevelID INT PRIMARY KEY,
    EducationLevel VARCHAR(50)
);
-- Load Data into Education Level Table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/education_level.csv' 
INTO TABLE education_level
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM education_level;

-- Create Table for Employees
CREATE TABLE employees (
    EmployeeID VARCHAR(50) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender VARCHAR(50),
    Age INT,
    BusinessTravel VARCHAR(50),
    Department VARCHAR(50),
    DistanceFromHome INT,
    State VARCHAR(50),
    Ethnicity VARCHAR(50),
    Education INT,
    EducationField VARCHAR(50),
    JobRole VARCHAR(50),
    MaritalStatus VARCHAR(50),
    Salary INT,
    StockOptionLevel INT,
    OverTime VARCHAR(3),
    HireDate DATE,
    Attrition VARCHAR(3),
    YearsAtCompany INT,
    YearsInMostRecentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    CONSTRAINT fk_education FOREIGN KEY (Education) REFERENCES education_level (EducationLevelID)
);
-- Load Data into Employees Table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/employees.csv' 
INTO TABLE employees
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM employees LIMIT 15;

-- Create Table for Satisfaction Levels
CREATE TABLE satisfied_level (
    SatisfactionID INT PRIMARY KEY,
    SatisfactionLevel VARCHAR(50)
);
-- Load Data into Satisfaction Levels Table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/satisfied_level.csv' 
INTO TABLE satisfied_level
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM satisfied_level;

-- Create Table for Rating Levels
CREATE TABLE rating_level (
    RatingID INT PRIMARY KEY,
    RatingLevel VARCHAR(50)
);
-- Load Data into Rating Levels Table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rating_level.csv' 
INTO TABLE rating_level
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM rating_level;

-- Create Table for Performance Ratings
CREATE TABLE performance_rating (
    PerformanceID VARCHAR(50) PRIMARY KEY,
    EmployeeID VARCHAR(50),
    ReviewDate DATE,
    EnvironmentSatisfaction INT,
    JobSatisfaction INT,
    RelationshipSatisfaction INT,
    TrainingOpportunitiesWithinYear INT,
    TrainingOpportunitiesTaken INT,
    WorkLifeBalance INT,
    SelfRating INT,
    ManagerRating INT,
    CONSTRAINT fk_employee_performance FOREIGN KEY (EmployeeID) REFERENCES employees (EmployeeID),
    CONSTRAINT fk_environment_satisfaction FOREIGN KEY (EnvironmentSatisfaction) REFERENCES satisfied_level (SatisfactionID),
    CONSTRAINT fk_job_satisfaction FOREIGN KEY (JobSatisfaction) REFERENCES satisfied_level (SatisfactionID),
    CONSTRAINT fk_relationship_satisfaction FOREIGN KEY (RelationshipSatisfaction) REFERENCES satisfied_level (SatisfactionID),
    CONSTRAINT fk_work_life_balance FOREIGN KEY (WorkLifeBalance) REFERENCES rating_level (RatingID),
    CONSTRAINT fk_self_rating FOREIGN KEY (SelfRating) REFERENCES rating_level (RatingID),
    CONSTRAINT fk_manager_rating FOREIGN KEY (ManagerRating) REFERENCES rating_level (RatingID)
);
-- Load Data into Performance Ratings Table
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/performance_rating_fix.csv' 
INTO TABLE performance_rating
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * FROM performance_rating LIMIT 15;

-- reate Table for EmployeeFull
CREATE TABLE EmployeeFull AS
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Gender,
    e.Age,
    e.BusinessTravel,
    e.Department,
    e.DistanceFromHome,
    e.State,
    e.Ethnicity,
    e.Education,
    el.EducationLevel AS EducationDescription, 
    e.EducationField,
    e.JobRole,
    e.MaritalStatus,
    e.Salary,
    e.StockOptionLevel,
    e.OverTime,
    e.HireDate,
    e.Attrition,
    e.YearsAtCompany,
    e.YearsInMostRecentRole,
    e.YearsSinceLastPromotion,
    e.YearsWithCurrManager,
    pr.PerformanceID,
    pr.ReviewDate,
    pr.EnvironmentSatisfaction,
    sl1.SatisfactionLevel AS EnvironmentSatisfactionDescription, 
    pr.JobSatisfaction,
    sl2.SatisfactionLevel AS JobSatisfactionDescription, 
    pr.RelationshipSatisfaction,
    sl3.SatisfactionLevel AS RelationshipSatisfactionDescription,
    pr.TrainingOpportunitiesWithinYear,
    pr.TrainingOpportunitiesTaken,
    pr.WorkLifeBalance,
    rl1.RatingLevel AS WorkLifeBalanceDescription, 
    pr.SelfRating,
    rl2.RatingLevel AS SelfRatingDescription, 
    pr.ManagerRating,
    rl3.RatingLevel AS ManagerRatingDescription 
FROM 
    employees e
JOIN 
    education_level el
ON 
    e.Education = el.EducationLevelID
JOIN 
    performance_rating pr
ON 
    e.EmployeeID = pr.EmployeeID
JOIN 
    satisfied_level sl1
ON 
    pr.EnvironmentSatisfaction = sl1.SatisfactionID
JOIN 
    satisfied_level sl2
ON 
    pr.JobSatisfaction = sl2.SatisfactionID
JOIN 
    satisfied_level sl3
ON 
    pr.RelationshipSatisfaction = sl3.SatisfactionID
JOIN 
    rating_level rl1
ON 
    pr.WorkLifeBalance = rl1.RatingID
JOIN 
    rating_level rl2
ON 
    pr.SelfRating = rl2.RatingID
JOIN 
    rating_level rl3
ON 
    pr.ManagerRating = rl3.RatingID;

SELECT * FROM Employeefull LIMIT 15;
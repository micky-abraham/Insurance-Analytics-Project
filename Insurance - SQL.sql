CREATE DATABASE INSURANCE;

USE INSURANCE;

CREATE TABLE `Policy Details`
(
`Policy ID` VARCHAR(30),
`Policy Type` VARCHAR(50),
`Coverage Amount` INT,
`Premium Amount` DOUBLE,
`Policy Start Date` DATE,
`Policy End Date` DATE,
`Payment Frequency` VARCHAR(20),
`Status` VARCHAR(20),
`Customer ID` VARCHAR(30)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Policy Details.csv'
INTO TABLE `Policy Details`
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

Select * FROM `Policy Details`;

CREATE TABLE `Customer Information`
(
`Customer ID` VARCHAR(30),
`Name` VARCHAR(50),
Gender VARCHAR(10),
Age TINYINT,
Occupation VARCHAR(100),
`Marital Status` VARCHAR(30),
`Address (City, State, Zip Code)` VARCHAR(200)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customer Information.csv'
INTO TABLE `Customer Information`
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(`Customer ID`, `Name`, Gender, Age, Occupation, `Marital Status`, @Address)
SET `Address (City, State, Zip Code)` = @Address;

SELECT * FROM `Customer Information`;

CREATE TABLE Claims
(
`Claim ID` VARCHAR(30),
`Date of Claim` DATE,
`Claim Amount` INT,
`Claim Status` VARCHAR(20),
`Reason for Claim` VARCHAR(100),
`Settlement Date` DATE NULL,
`Policy ID` VARCHAR(30)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Claims.csv'
INTO TABLE Claims
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(`Claim ID`, `Date of Claim`, `Claim Amount`, `Claim Status`, `Reason for Claim`, @SettlementDate, `Policy ID`)
SET `Settlement Date` = NULLIF(@SettlementDate, '');

SELECT * FROM Claims;

CREATE TABLE `Payment History`
(
`Payment ID` VARCHAR(30),
`Date of Payment` DATE,
`Amount Paid` DOUBLE,
`Payment Method` VARCHAR(20),
`Payment Status` VARCHAR(20),
`Policy ID` VARCHAR(30)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Payment History.csv'
INTO TABLE `Payment History`
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM `Payment History`;

CREATE TABLE `Additional Fields`
(
`Agent ID` VARCHAR(30),
`Renewal Status` VARCHAR(20),
`Policy Discounts` INT,
`Risk Score` INT,
`Policy ID` VARCHAR(30)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Additional Fields.csv'
INTO TABLE `Additional Fields`
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM `Additional Fields`;

SHOW TABLES;

#---------------------- KPIs

# 1 ----- TOTAL POLICY
SELECT COUNT(`Policy ID`) AS Total_Policy
FROM `Policy Details`;

# 2 ----- TOTAL CUSTOMERS
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM `Customer Information`;

# 3 ----- AGE BUCKET WISE POLICY COUNT
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
		WHEN Age BETWEEN 56 AND 65 THEN '56-65'
        ELSE '65+'
    END AS Age_Bucket,
    COUNT(*) AS Customer_Count
FROM `Customer Information`
GROUP BY 1
ORDER BY 1;

# 4 ----- GENDER WISE POLICY COUNT
SELECT
    Gender, COUNT(*) AS Customer_Count
FROM `Customer Information`
GROUP BY 1
ORDER BY 2 DESC;

# 5 ----- POLICY TYPE WISE POLICY COUNT
SELECT
    `Policy Type`, COUNT(*) AS Policy_Count
FROM `Policy Details`
GROUP BY 1
ORDER BY 2 DESC;

# 6 ----- POLICY EXPIRING THIS YEAR
SELECT
CASE
    WHEN YEAR(`Policy End Date`) = YEAR(CURDATE())
    THEN 'Yes'
    ELSE 'No'
END AS Expire_this_Year,
COUNT(*) AS Policy_Count
FROM `Policy Details`
GROUP BY 1
ORDER BY 1 DESC;

# 7 ----- PREMIUM GROWTH RATE
SELECT
Policy_Year,
CONCAT(ROUND(
((Total_Premium - Previous_Year_Premium) /
Previous_Year_Premium) * 100,2),'%'
) AS Premium_Growth_Rate
FROM
(
    SELECT
    YEAR(`Policy Start Date`) AS Policy_Year,
    SUM(`Premium Amount`) AS Total_Premium,
    LAG(SUM(`Premium Amount`))
    OVER (ORDER BY YEAR(`Policy Start Date`))
    AS Previous_Year_Premium
    FROM `Policy Details`
    GROUP BY 1
) t;

# 8 ----- CLAIM STATUS WISE POLICY COUNT
SELECT
`Claim Status`,
COUNT(*) AS Policy_Count
FROM Claims
GROUP BY 1;

# 9 ----- PAYMENT STATUS WISE POLICY COUNT
SELECT
`Payment Status`,
COUNT(*) AS Policy_Count
FROM `Payment History`
GROUP BY 1;

# 10 ----- TOTAL CLAIM AMOUNT
SELECT
CONCAT(ROUND(SUM(`Claim Amount`)/1000000,2),'M') AS Total_Claim_Amount
FROM Claims;

# 11 ----- CLAIM RATIO
SELECT YEAR(`Policy Start Date`) AS Policy_Year,
CONCAT(ROUND(SUM(C.`Claim Amount`)/SUM(P.`Premium Amount`),2),'%') AS Claim_Ratio
FROM Claims C JOIN `Policy Details` P
ON C.`Policy ID` = P.`Policy ID`
GROUP BY 1
ORDER BY 1;


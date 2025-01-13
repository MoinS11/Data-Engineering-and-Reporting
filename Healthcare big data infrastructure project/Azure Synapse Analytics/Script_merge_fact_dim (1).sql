-- CREATE DATABASE query_healthcare ;
-- USE query_healthcare;

IF OBJECT_ID('vw_fact_transactions_with_dimensions', 'V') IS NOT NULL
    DROP VIEW vw_fact_transactions_with_dimensions;
GO

CREATE VIEW vw_fact_transactions_with_dimensions AS
SELECT
    TOP 10000
    fact_transactions.*,
    dim_patient.firstname AS patient_fname, 
    dim_patient.lastname AS patient_lname,
    dim_patient.gender,
    dim_department.Name AS Dept_Name,  
    dim_provider.Firstname AS Provider_fname,
    dim_provider.LastName AS Provider_lname
FROM
    OPENROWSET(
        BULK 'https://moinadlsdev.dfs.core.windows.net/gold/fact_transactions/**',
        FORMAT = 'PARQUET'
    ) AS fact_transactions
JOIN
    OPENROWSET(
        BULK 'https://moinadlsdev.dfs.core.windows.net/gold/dim_patient/**',
        FORMAT = 'PARQUET'
    ) AS dim_patient
ON fact_transactions.FK_PatientID = dim_patient.patient_key
JOIN
    OPENROWSET(
        BULK 'https://moinadlsdev.dfs.core.windows.net/gold/dim_department/**',
        FORMAT = 'PARQUET'
    ) AS dim_department
ON fact_transactions.FK_DeptID = dim_department.Dept_Id
JOIN
    OPENROWSET(
        BULK 'https://moinadlsdev.dfs.core.windows.net/gold/dim_provider/**',
        FORMAT = 'PARQUET'
    ) AS dim_provider
ON fact_transactions.FK_ProviderID = dim_provider.ProviderID;


select * from vw_fact_transactions_with_dimensions

-- Total Claims by Amount Type
SELECT AmountType, COUNT(*) AS ClaimCount
FROM vw_fact_transactions_with_dimensions
GROUP BY AmountType;

-- Claims by dept
SELECT Dept_Name, COUNT(*) AS ClaimCount
FROM vw_fact_transactions_with_dimensions
GROUP BY Dept_Name
ORDER BY ClaimCount DESC;

-- claims by gender
SELECT gender, COUNT(*) AS ClaimCount
FROM vw_fact_transactions_with_dimensions
GROUP BY gender;

-- Claims by provider
SELECT Provider_fname + ' '+ Provider_lname, COUNT(*) AS ClaimCount
FROM vw_fact_transactions_with_dimensions
GROUP BY Provider_fname, Provider_lname
ORDER BY ClaimCount DESC;

-- claims by date range
SELECT COUNT(*) AS ClaimCount
FROM vw_fact_transactions_with_dimensions
WHERE refreshed_at BETWEEN '2025-01-01' AND '2025-01-31';

-- claims by amount type
SELECT AmountType, AVG(PaidAmount) AS AvgClaimAmount
FROM vw_fact_transactions_with_dimensions
GROUP BY AmountType;

-- Claims by Department and Amount Type
SELECT Dept_Name, AmountType, COUNT(*) AS ClaimCount
FROM vw_fact_transactions_with_dimensions
GROUP BY Dept_Name, AmountType;
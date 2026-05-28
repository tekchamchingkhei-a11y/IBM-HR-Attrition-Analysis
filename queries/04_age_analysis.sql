-- ============================================
-- IBM HR ATTRITION ANALYSIS
-- File: 04_age_analysis.sql
-- Author: Tekcham Chingkheinganba Meitei
-- Tool: SQLite
-- ============================================

-- Q10: Attrition by Age Group
SELECT 
    AgeGroup,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
WHERE AgeGroup IS NOT NULL
GROUP BY AgeGroup
ORDER BY attrition_rate DESC;

-- Q11: Attrition by Tenure Group
SELECT 
    TenureGroup,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
WHERE TenureGroup IS NOT NULL
GROUP BY TenureGroup
ORDER BY attrition_rate DESC;

-- Q12: Attrition by Marital Status
SELECT 
    MaritalStatus,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY MaritalStatus
ORDER BY attrition_rate DESC;

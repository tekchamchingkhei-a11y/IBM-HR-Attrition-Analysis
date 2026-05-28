-- ============================================
-- IBM HR ATTRITION ANALYSIS
-- File: 05_overtime_analysis.sql
-- Author: Tekcham Chingkheinganba Meitei
-- Tool: SQLite
-- ============================================

-- Q13: Overtime Impact on Attrition
SELECT 
    OverTime,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY OverTime
ORDER BY attrition_rate DESC;

-- Q14: Attrition by Work Life Balance
SELECT 
    WorkLifeBalance_Label,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY WorkLifeBalance_Label
ORDER BY attrition_rate DESC;

-- Q15: Overtime + Work Life Balance Combined
SELECT 
    OverTime,
    WorkLifeBalance_Label,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY OverTime, WorkLifeBalance_Label
ORDER BY attrition_rate DESC;

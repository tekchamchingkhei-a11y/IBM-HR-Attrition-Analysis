-- ============================================
-- IBM HR ATTRITION ANALYSIS
-- File: 03_jobrole_analysis.sql
-- Author: Tekcham Chingkheinganba Meitei
-- Tool: SQLite
-- ============================================

-- Q7: Attrition by Job Role
SELECT 
    JobRole,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY JobRole
ORDER BY attrition_rate DESC;

-- Q8: Avg Income by Job Role
SELECT 
    JobRole,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY JobRole
ORDER BY avg_income DESC;

-- Q9: Job Role vs Job Satisfaction
SELECT 
    JobRole,
    ROUND(AVG(JobSatisfaction), 1) AS avg_satisfaction,
    ROUND(AVG(WorkLifeBalance), 1) AS avg_worklife,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY JobRole
ORDER BY avg_satisfaction ASC;

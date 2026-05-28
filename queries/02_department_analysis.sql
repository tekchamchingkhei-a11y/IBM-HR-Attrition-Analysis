-- ============================================
-- IBM HR ATTRITION ANALYSIS
-- File: 02_department_analysis.sql
-- Author: Tekcham Chingkheinganba Meitei
-- Tool: SQLite
-- ============================================

-- Q4: Attrition by Department
SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY Department
ORDER BY attrition_rate DESC;

-- Q5: Avg Income by Department
SELECT 
    Department,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(YearsAtCompany), 1) AS avg_tenure,
    ROUND(AVG(JobSatisfaction), 1) AS avg_satisfaction
FROM HR_Attrition_Cleaned
GROUP BY Department
ORDER BY avg_income DESC;

-- Q6: Department Master Summary
SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(Age), 1) AS avg_age,
    ROUND(AVG(YearsAtCompany), 1) AS avg_tenure,
    ROUND(AVG(JobSatisfaction), 1) AS avg_satisfaction,
    ROUND(AVG(WorkLifeBalance), 1) AS avg_worklife
FROM HR_Attrition_Cleaned
GROUP BY Department
ORDER BY attrition_rate DESC;

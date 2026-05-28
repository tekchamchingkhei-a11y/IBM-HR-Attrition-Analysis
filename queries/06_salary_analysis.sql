-- ============================================
-- IBM HR ATTRITION ANALYSIS
-- File: 06_salary_analysis.sql
-- Author: Tekcham Chingkheinganba Meitei
-- Tool: SQLite
-- ============================================

-- Q16: Income Gap — Left vs Stayed
SELECT 
    Attrition,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(Age), 1) AS avg_age,
    ROUND(AVG(YearsAtCompany), 1) AS avg_tenure,
    COUNT(*) AS total_employees
FROM HR_Attrition_Cleaned
GROUP BY Attrition;

-- Q17: Attrition by Income Group
SELECT 
    IncomeGroup,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
WHERE IncomeGroup IS NOT NULL
GROUP BY IncomeGroup
ORDER BY attrition_rate DESC;

-- Q18: Attrition by Job Satisfaction
SELECT 
    JobSatisfaction_Label,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY JobSatisfaction_Label
ORDER BY attrition_rate DESC;

-- Q19: Attrition by Environment Satisfaction
SELECT 
    EnvironmentSatisfaction_Label,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned
GROUP BY EnvironmentSatisfaction_Label
ORDER BY attrition_rate DESC;

-- Q20: Master Summary — Full Analysis
SELECT 
    Department,
    JobRole,
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(JobSatisfaction), 1) AS avg_satisfaction
FROM HR_Attrition_Cleaned
GROUP BY Department, JobRole
ORDER BY attrition_rate DESC;

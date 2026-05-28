
-- Q1: Overall Attrition KPI
SELECT 
    COUNT(*) AS total_employees,
    SUM(Attrition_Flag) AS total_left,
    COUNT(*) - SUM(Attrition_Flag) AS total_stayed,
    ROUND(SUM(Attrition_Flag) * 100.0 / COUNT(*), 1) AS attrition_rate
FROM HR_Attrition_Cleaned;

-- Q2: Avg Profile of All Employees
SELECT 
    ROUND(AVG(MonthlyIncome), 0) AS avg_income,
    ROUND(AVG(Age), 1) AS avg_age,
    ROUND(AVG(YearsAtCompany), 1) AS avg_tenure,
    ROUND(AVG(Attrition_Flag) * 100, 1) AS attrition_rate
FROM HR_Attrition_Cleaned;

-- Q3: Overtime Workers %
SELECT 
    OverTime,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / 
        (SELECT COUNT(*) FROM HR_Attrition_Cleaned), 1) AS percentage
FROM HR_Attrition_Cleaned
GROUP BY OverTime;

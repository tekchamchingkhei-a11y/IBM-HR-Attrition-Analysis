# ============================================
# IBM HR ATTRITION ANALYSIS
# File: HR_Attrition_Cleaning.py
# Author: Tekcham Chingkheinganba Meitei
# Tool: Python (Pandas)
# ============================================

import pandas as pd
import numpy as np

# ── Step 1: Load Data ──
df = pd.read_csv("WA_Fn-UseC_-HR-Employee-Attrition.csv")
print("=== ORIGINAL DATA ===")
print("Shape:", df.shape)
print("Missing values:", df.isnull().sum().sum())
print("Duplicates:", df.duplicated().sum())

# ── Step 2: Remove Useless Columns ──
df.drop(columns=['EmployeeCount', 'Over18', 'StandardHours'], inplace=True)
print("\nDropped 3 useless columns")

# ── Step 3: Create Attrition Flag ──
df['Attrition_Flag'] = df['Attrition'].map({'Yes': 1, 'No': 0})

# ── Step 4: Create Label Columns ──
df['Education_Label'] = df['Education'].map({
    1: 'Below College',
    2: 'College',
    3: 'Bachelor',
    4: 'Master',
    5: 'Doctor'
})

df['JobSatisfaction_Label'] = df['JobSatisfaction'].map({
    1: 'Low',
    2: 'Medium',
    3: 'High',
    4: 'Very High'
})

df['EnvironmentSatisfaction_Label'] = df['EnvironmentSatisfaction'].map({
    1: 'Low',
    2: 'Medium',
    3: 'High',
    4: 'Very High'
})

df['WorkLifeBalance_Label'] = df['WorkLifeBalance'].map({
    1: 'Bad',
    2: 'Good',
    3: 'Better',
    4: 'Best'
})

df['JobInvolvement_Label'] = df['JobInvolvement'].map({
    1: 'Low',
    2: 'Medium',
    3: 'High',
    4: 'Very High'
})

df['PerformanceRating_Label'] = df['PerformanceRating'].map({
    1: 'Low',
    2: 'Good',
    3: 'Excellent',
    4: 'Outstanding'
})

# ── Step 5: Create Group Columns ──
df['AgeGroup'] = pd.cut(df['Age'],
    bins=[17, 25, 35, 45, 55, 65],
    labels=['18-25', '26-35', '36-45', '46-55', '56-65'])

df['IncomeGroup'] = pd.cut(df['MonthlyIncome'],
    bins=[0, 3000, 6000, 10000, 20000],
    labels=['Low', 'Medium', 'High', 'Very High'])

df['TenureGroup'] = pd.cut(df['YearsAtCompany'],
    bins=[0, 2, 5, 10, 20, 40],
    labels=['0-2 yrs', '3-5 yrs', '6-10 yrs', '11-20 yrs', '20+ yrs'])

# ── Step 6: Save Cleaned File ──
df.to_csv("HR_Attrition_Cleaned.csv", index=False)

# ── Step 7: Verify ──
print("\n=== CLEANED DATA ===")
print("Final shape:", df.shape)
print("\n=== VERIFICATION ===")
print("Total Employees:", len(df))
print("Left:", df['Attrition_Flag'].sum())
print("Stayed:", (df['Attrition_Flag'] == 0).sum())
print("Attrition Rate:", round(df['Attrition_Flag'].mean()*100, 1), "%")
print("Avg Monthly Income:", round(df['MonthlyIncome'].mean(), 0))
print("Avg Age:", round(df['Age'].mean(), 1))
print("Avg Years at Company:", round(df['YearsAtCompany'].mean(), 1))
print("Overtime %:", round((df['OverTime']=='Yes').mean()*100, 1), "%")
print("\nFile saved: HR_Attrition_Cleaned.csv ✅")

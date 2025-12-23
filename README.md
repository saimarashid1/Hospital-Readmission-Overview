
Hospital Readmission Overview Dashboard
Power BI Dashboard | Healthcare Analytics Project

Dashboard Overview
Main Overview Page

Drill-through Details
Drill-through Page with Detailed Breakdowns

Project Overview
This interactive Power BI dashboard analyzes hospital readmission patterns using a dataset of 25,000 patient records. It provides actionable insights to support executive decision-making on care quality, operational efficiency, and risk management.

Key Objective: Identify high-risk patient groups and factors contributing to readmissions to enable targeted interventions.

Key Findings & Insights
Overall readmission rate: 47% (significantly higher than typical industry benchmarks of 15–20%)
Diabetes patients show the highest readmission rate at 53.63%
Patients with no HbA1c (glucose) test performed have elevated readmission risk
Medication changes during stay increase readmission likelihood (49.35% vs 45.02%)
Readmissions are concentrated in Internal Medicine and Emergency/Trauma specialties
Longer hospital stays and higher age correlate with varying readmission patterns
Dashboard Features
Main Overview Page
Top-level KPIs: Average stay (4 days), Total patients (25K), Readmissions (12K), Readmission rate (47%)
Visuals:
Number of Procedures vs Readmission Rate
Readmission Rate by HbA1c Test Status
Stay Duration vs Readmission Rate (line chart)
Patient distribution by Medical Specialty
Readmission Rate by Primary Diagnosis
Drill-through Detail Page
Clustered analysis: Readmission rates by Medical Specialty + HbA1c Test Status
Age Group vs Readmission Rate
Impact of Medication Change (Yes/No)
Interactive Elements:

Slicers for Age Group, HbA1c Test, and Medical Specialty
Drill-through capability for deeper exploration
Tools & Technologies Used
Microsoft Power BI – Visualization & dashboard development
SQL – Data extraction and preprocessing (age grouping, calculated measures)
DAX – Custom measures (readmission rate calculations, conditional formatting)
Data Source
This project uses a synthetic/anonymized hospital dataset focused on diabetes and readmission outcomes (commonly used in healthcare analytics studies).

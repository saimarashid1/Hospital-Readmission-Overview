# Hospital Readmission Analysis Dashboard

## Overview
This project presents an interactive Power BI dashboard analyzing hospital readmission patterns using a dataset of approximately 25,000 patient records. The analysis focuses on identifying patient groups and clinical factors associated with higher readmission risk to support healthcare quality improvement and operational decision-making.

## Objective
To explore readmission trends across patient demographics, clinical indicators, and hospital service categories, and to highlight factors that may contribute to higher readmission rates.

## Dataset
Synthetic and anonymized hospital dataset commonly used in healthcare analytics studies, with a focus on diabetes-related admissions and readmission outcomes.

## Tools & Technologies
- Microsoft Power BI – Dashboard design and visualization
- SQL – Data extraction, filtering, and preprocessing
- DAX – Calculated measures and readmission rate metrics

## Key Analysis & Insights
- Overall readmission rate observed in the dataset: 47%
- Higher readmission rates among diabetes patients
- Elevated readmission risk for patients without HbA1c (glucose) tests
- Medication changes during hospital stay associated with higher readmission likelihood
- Readmissions concentrated in Internal Medicine and Emergency/Trauma specialties
- Variation in readmission patterns across age groups and length of hospital stay

## Dashboard Structure

### Main Overview Page
- High-level KPIs: total patients, total readmissions, average length of stay, and readmission rate
- Readmission rate by HbA1c test status
- Relationship between length of stay and readmission rate
- Patient distribution and readmissions by medical specialty

### Drill-through Analysis Page
- Detailed breakdown of readmission rates by:
  - Medical specialty
  - HbA1c test status
  - Age group
  - Medication change indicator
- Drill-through functionality for deeper exploratory analysis

## Notes
This project focuses on exploratory and descriptive analytics rather than predictive modeling. It demonstrates the use of SQL, DAX, and Power BI to analyze healthcare data, calculate key metrics, and communicate insights through interactive dashboards.
.

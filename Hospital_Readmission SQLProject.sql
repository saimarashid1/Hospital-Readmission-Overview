/*
Hospital Readmission Analysis
This SQL script explores hospital readmission patterns across patient age groups,
length of hospital stay, medical specialties, and clinical indicators such as
HbA1c testing and medication changes. The queries support insights used in a
Power BI dashboard for healthcare analytics.
*/

-- Readmission Rate by Age Group

WITH readmission_stats AS (
		    SELECT 
		        p.pat_age,
		        COUNT(*) AS total_patients,
		        SUM(CASE WHEN e.readmitted = 'yes' THEN 1 ELSE 0 END) AS readmitted_patients
		    FROM patients p
		    INNER JOIN encounters e 
		        ON p.pat_id = e.pat_id
		    WHERE e.readmitted IS NOT NULL
		    GROUP BY p.pat_age
		)
		SELECT 
		    pat_age,
		    total_patients,
		    readmitted_patients,
		    FORMAT(
		        readmitted_patients * 1.0 / total_patients,
		        'P2'
		    ) AS readmission_rate_pct
		FROM readmission_stats
		ORDER BY pat_age;


---- Average Time in Hospital by Medical Specialty

		Select medical_specialty,
		CAST(AVG(CAST(time_in_hospital AS INT)) AS INT) AS avg_time_in_hospital_days
		from Encounters
		group by medical_specialty 
		order by avg_time_in_hospital_days desc

---Top Primary Diagnoses Leading to Readmissions
			
		select d.diag_1 as primary_diagnosis,count(*) as total_patients,
		sum ( case when e.readmitted  = 'yes' THEN 1 ELSE 0 END) as readmitted_diagpatients,
		Format (1.0 *sum ( case when e.readmitted  = 'yes' THEN 1 ELSE 0 END)/count(*) ,'p2')
				as Readmission_Rate_Percent
		from Encounters E 
		join Diagnosis d on 
		e.encounter_id = d.encounter_id
		group by d.diag_1
		order by readmitted_diagpatients desc

---- Diabetes Medication Change vs Readmission
	
		SELECT 
	    d.diabetes_med,
	    d.change AS medication_changed,
	    COUNT(*) AS total_patients,
	    SUM(CASE WHEN e.readmitted = 'yes' THEN 1 ELSE 0 END) AS readmitted_patients,
	    FORMAT(
	        SUM(CASE WHEN e.readmitted = 'yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*),
	        'P2'
	    ) AS readmission_rate_pct
		FROM diagnosis d
		JOIN encounters e 
	    ON d.encounter_id = e.encounter_id
		GROUP BY d.diabetes_med, d.change
		ORDER BY readmitted_patients DESC;

---Diabetic Results by Age Group

	SELECT 
    p.pat_age,
    SUM(CASE WHEN d.A1cTest = 'normal' THEN 1 ELSE 0 END) AS normal_diab,
    SUM(CASE WHEN d.A1cTest = 'high' THEN 1 ELSE 0 END) AS high_diab,
    SUM(CASE WHEN d.A1cTest = 'no' THEN 1 ELSE 0 END) AS Test_not_Performed
	FROM patients p
	JOIN Encounters e ON e.Pat_id = p.Pat_id
	JOIN Diagnosis d ON d.encounter_id = e.encounter_id
	GROUP BY p.pat_age
	ORDER BY 
    high_diab DESC,
    normal_diab DESC,
    Test_not_Performed DESC,
    p.pat_age;
 

--A1C and Glucose Test Results by Age Group

		SELECT 
	    p.Pat_age AS Age_Group,
	    d.A1Ctest,
	    d.glucose_test,
	    COUNT(*) AS Test_Count
		FROM patients p
		JOIN Encounters e ON p.Pat_id = e.Pat_id
		JOIN Diagnosis d ON e.encounter_id = d.encounter_id
		GROUP BY p.Pat_age, d.A1Ctest, d.glucose_test
		ORDER BY Age_Group, Test_Count DESC;

---Procedure and Medication Counts by Readmission Status

		SELECT 
		    readmitted,
		    CAST(AVG(CAST(n_lab_procedures AS INT)) AS INT) AS avg_lab,
		    CAST(AVG(CAST(n_medications AS INT)) AS INT) AS avg_med
			from Encounters
			group by readmitted

--Patient Encounter Breakdown by Medical Specialty

			select 
			medical_specialty, CAST(sum(CAST(n_inpatient AS INT)) AS INT) AS total_inpatients,
			CAST(sum(CAST(n_outpatient AS INT)) AS INT) AS total_outpatients,
			CAST(sum(CAST(n_emergency AS INT)) AS INT) AS total_emergency_patients
			from Encounters
			group by medical_specialty
			order by total_emergency_patients desc

		--Age-Wise Patient Readmission & Encounter Summary

			Select p.pat_age,count(*) as Total_patients,
			sum ( case when e.readmitted  = 'yes' THEN 1 ELSE 0 END) as Readmitted_diagpatients,
			Format (1.0 *sum ( case when e.readmitted  = 'yes' THEN 1 ELSE 0 END)/count(*) ,'p2')
			as Readmission_Rate_Percent,
			CAST(sum(CAST(n_inpatient AS INT)) AS INT) AS total_inpatients,
			CAST(sum(CAST(n_outpatient AS INT)) AS INT) AS total_outpatients,
			CAST(sum(CAST(n_emergency AS INT)) AS INT) AS total_emergency_patients
			from patients p
			JOIN Encounters e ON p.Pat_id = e.Pat_id
			JOIN Diagnosis d ON e.encounter_id = d.encounter_id
			group by p.pat_age 
			order by p.Pat_age , Readmission_Rate_Percent desc

----Readmission Trends by Time in Hospital
	
				Select Cast(time_in_hospital as int) as Total_num_days,
				count(*) as Total_patients,
				sum ( case when readmitted  = 'yes' THEN 1 ELSE 0 END) as Readmitted_patients,
				Format (1.0 *sum ( case when readmitted  = 'yes' THEN 1 ELSE 0 END)/count(*) ,'p2')
				as Readmission_Rate_Percent
				from Encounters
				group by Cast(time_in_hospital as int)
				order by  Cast(time_in_hospital as int)desc;

----High-level KPIs for the dashboard home page, like total readmissions and average metrics.

				Select count(*) as total_patients,
				Cast(AVG (Cast(time_in_hospital as int))as int) as AVG_Hospital_days,
				Cast(AVG (Cast(n_medications as int))as int) as AVG_medications,
				sum ( case when readmitted  = 'yes' THEN 1 ELSE 0 END) as Readmitted_patients,
				Format (1.0 *sum ( case when readmitted  = 'yes' THEN 1 ELSE 0 END)/count(*) ,'p2')
				as Readmission_Rate_Percent
				from Encounters;
		

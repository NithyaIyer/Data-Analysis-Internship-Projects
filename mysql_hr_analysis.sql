/* PROJECT TITLE: HR ANALYSIS */
/* Analyzing Attrition Rate considering various factors */ 

-- Schema used
USE hr_analysis;

-- Dataset used
SELECT * FROM hr_analysis.`hr-employee-attrition`;

-- Calculating the total No. of employee

SELECT COUNT(*) AS no_of_employees
FROM hr_analysis.`hr-employee-attrition`
WHERE EmployeeNumber IS NOT NULL;

/*     Total Employees = 1470 */

-- Total no. of Attrition
SELECT COUNT(*) AS yes_count 
FROM  hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes';

/* Attrition Rate = 237 */

-- Total no. of Non_Attrition 

SELECT COUNT(*) AS no_count 
FROM  hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'No';

/*    Total Non_Attrition Rate = 1233   */

SELECT 
    CASE
      WHEN DistanceFromHome BETWEEN 1 AND 10 THEN 'Near'
      WHEN DistanceFromHome BETWEEN 11 AND 20 THEN 'Far'
      WHEN DistanceFromHome BETWEEN 21 AND 30 THEN 'Very Far'
      END AS Distance_From_Home,
COUNT(Attrition) AS Attrition_Rate      
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC ;

/*  

Distance_From_Home    Attrition_Rate
Near	              144
Far	                  48
Very Far	          45 
*/

-- Attrition by Marital Status

SELECT MaritalStatus AS Marital_Status, Gender, COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1, 2;

/*   

Marital_Status   Gender  Attrition_Rate 
Single	         Female	  47
Single	         Male	  73
Married	         Male	  53
Married	         Female	  31
Divorced	     Male	  24
Divorced	     Female	  9

*/

-- Attrition by Gender

SELECT Gender, COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1;

/*   

Gender     Attrition_Rate
Female     87
Male       150

*/

-- Attrition by Education Field

SELECT EducationField, COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/*  
EducationField              Attrition_Rate
Life Sciences	            89
Medical						63
Marketing					35
Technical Degree			32
Other						11
Human Resources				7
*/

-- Attrition by Work Life Balance

SELECT 
	CASE 
		WHEN WorkLifeBalance = 1 THEN '1.Bad'
        WHEN WorkLifeBalance = 2 THEN '2.Average'
        WHEN WorkLifeBalance = 3 THEN '3.Good'
        WHEN WorkLifeBalance = 4 THEN '4.Excellent'
        END AS Work_Life_Balance,
COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 1;

/* 
Work_Life_Balance     Attrition_Rate
1.Bad					25
2.Average				58
3.Good					127
4.Excellent				27
*/

-- Attrition by Age

SELECT 
	CASE 
		WHEN ï»¿Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN ï»¿Age BETWEEN 31 AND 45 THEN '31-45'
        WHEN ï»¿Age BETWEEN 46 AND 60 THEN '46-60'
        END AS AGE,
 COUNT(Attrition) AS Attrition_Rate
 FROM hr_analysis.`hr-employee-attrition`
 WHERE Attrition = 'Yes'
 GROUP BY 1
 ORDER BY 1;
 
 /*
  AGE       Attrition_Rate
  18-30		100
  31-45		103
  46-60		34
  */
 
 -- Average Total Working Years
 
 SELECT AVG(TotalWorkingYears) AS Average_Total_Working_Years
 FROM hr_analysis.`hr-employee-attrition`;
 
 /* 
 Average_Total_Working_Years
 11.2796
 */
 
 -- Total Attrition by Job Role
 
 SELECT JobRole AS Job_Role, COUNT(Attrition) AS Attrition_Rate
 FROM hr_analysis.`hr-employee-attrition`
 WHERE Attrition = 'Yes'
 GROUP BY 1
 ORDER BY 2 DESC;
 
 /* 
Job_Role                      Attrition_Rate
Laboratory Technician			62
Sales Executive					57
Research Scientist				47
Sales Representative			33
Human Resources					12
Manufacturing Director			10
Healthcare Representative		9
Manager							5
Research Director				2
*/
 
 -- Attrition by Department
 
 SELECT Department, COUNT(Attrition) AS Attrition_Rate
 FROM hr_analysis.`hr-employee-attrition`
 WHERE Attrition = 'Yes'
 GROUP BY 1
 ORDER BY 2 DESC;
 
 /*
 Department                        Attrition_Rate
 Research & Development				133
Sales								92
Human Resources						12
*/

-- Attrition by Years in Current Role

SELECT Department, YearsInCurrentRole AS Years_in_current_role, COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1, 2
ORDER BY 1;

/*
Department                   Years_in_current_role    Attrition_Rate
Human Resources					0						4
Human Resources					1						1
Human Resources					2						5
Human Resources					6						1
Human Resources					7						1
Research & Development			0						45	
Research & Development			1						7
Research & Development			2						39
Research & Development			3						6
Research & Development			4						9
Research & Development			6						1
Research & Development			7						17
Research & Development			8						2
Research & Development			9						3
Research & Development			10						1
Research & Development			13						1
Research & Development			15						2
Sales							0						24
Sales							1						3
Sales							2						24
Sales							3						10
Sales							4						6
Sales							5						1
Sales							7						13
Sales							8						5
Sales							9						3
Sales							10						1
Sales							12						1
Sales							14						1

*/

-- Attrition by Business Travel and Gender

SELECT BusinessTravel, Gender, COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1, 2
ORDER BY 2 DESC;

/*
BusinessTravel             Gender            Attrition_Rate
Travel_Rarely				Male				102
Travel_Frequently			Male				39
Non-Travel					Male				9
Travel_Rarely				Female				54
Travel_Frequently			Female				30
Non-Travel					Female				3
*/

-- Attrition by Age and Gender

SELECT 
	CASE 
		WHEN ï»¿Age BETWEEN 18 AND 30 THEN '18-30'
        WHEN ï»¿Age BETWEEN 31 AND 45 THEN '31-45'
        WHEN ï»¿Age BETWEEN 46 AND 60 THEN '46-60'
        END AS AGE,
 Gender, COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1, 2
ORDER BY 1;

/*
AGE         Gender      Attrition_Rate
18-30		Female		41
18-30		Male		59
31-45		Female		36
31-45		Male		67
46-60		Female		10
46-60		Male		24
*/

-- Attrition by Job Level

SELECT 
	CASE  
		WHEN JobLevel = 1 THEN 'Entry Level'
        WHEN JobLevel = 2 THEN 'Junior Associate'
        WHEN JobLevel = 3 THEN 'Mid Level Specialist'
        WHEN JobLevel = 4 THEN 'Senior'
        WHEN JobLevel = 5 THEN 'Executive'
        END AS Job_Level,
COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/*
Job_Level                Attrition_Rate
Entry Level					143
Junior Associate			52
Mid Level Specialist		32
Executive					5
Senior						5
*/

-- Attrition by Performance Rating

SELECT 
	CASE
		WHEN PerformanceRating = 3 THEN 'Low'
        WHEN PerformanceRating = 4 THEN 'High'
        END AS Performance_Rating,
COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/* 
Performance_Rating   Attrition_Rate
Low						200
High					37
*/

-- Attrition by Overtime

SELECT OverTime, COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/*
OverTime   Attrition_Rate
Yes			127
No			110
*/

-- Average of Monthly Income

SELECT AVG(MonthlyIncome) AS Monthly_Income
FROM hr_analysis.`hr-employee-attrition`;

/*
Monthly_Income = 6502.9313
*/

-- Average of Hourly Rate

SELECT AVG(HourlyRate) AS Hourly_Rate
FROM hr_analysis.`hr-employee-attrition`;

/* 
Average of Hourly_Rate = 65.8912
*/

-- Attrition by Environment Satisfaction

SELECT 
	CASE
		WHEN EnvironmentSatisfaction = 1 THEN 'Very Dissatisfied'
        WHEN EnvironmentSatisfaction = 2 THEN 'Dissatisfied'
        WHEN EnvironmentSatisfaction = 3 THEN 'Satisfied'
        WHEN EnvironmentSatisfaction = 4 THEN 'Very Satisfied'
        END AS Environment_Satisfaction,
	COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/*
Environment_Satisfaction    Attrition_Rate
Very Dissatisfied			72
Satisfied					62
Very Satisfied				60
Dissatisfied				43
*/

-- Attrition by Job Involvement

SELECT 
	CASE 
		WHEN JobInvolvement = 1 THEN 'Very Low'
        WHEN JobInvolvement = 2 THEN 'Low'
        WHEN JobInvolvement = 3 THEN 'Moderate'
        WHEN JobInvolvement = 4 THEN 'High'
        END AS Job_Involvement,
	COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/*
Job_Involvement    Attrition_Rate
Moderate			125
Low					71
Very Low			28
High				13
*/

-- Attrition by Relationship Satisfaction

SELECT 
	CASE
		WHEN RelationshipSatisfaction = 1 THEN 'Very Dissatisfied'
        WHEN RelationshipSatisfaction = 2 THEN 'Dissatisfied'
        WHEN RelationshipSatisfaction = 3 THEN 'Satisfied'
        WHEN RelationshipSatisfaction = 4 THEN 'Very Satisfied'
        END AS Relationship_Satisfaction,
	COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/*
Relationship_Satisfaction    Attrition_Rate
Satisfied						71
Very Satisfied					64
Very Dissatisfied				57
Dissatisfied					45
*/

-- Attrition by Work Life Balance

SELECT
	CASE 
		WHEN WorkLifeBalance = 1 THEN 'Bad'
        WHEN WorkLifeBalance = 2 THEN 'Average'
        WHEN WorkLifeBalance = 3 THEN 'Good'
        WHEN WorkLifeBalance = 4 THEN 'Excellent'
        END AS Work_Life_Balance,
	COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/*
Work_Life_Balance    Attrition_Rate
Good					127
Average					58
Excellent				27
Bad						25
*/

-- Attrition by Job Satisfaction

SELECT 
	CASE
		WHEN JobSatisfaction = 1 THEN 'Very Dissatisfied'
        WHEN JobSatisfaction = 2 THEN 'Dissatisfied'
        WHEN JobSatisfaction = 3 THEN 'Satisfied'
        WHEN JobSatisfaction = 4 THEN 'Very Satisfied'
        END AS Job_Satisfaction,
	COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis.`hr-employee-attrition`
WHERE Attrition = 'Yes'
GROUP BY 1
ORDER BY 2 DESC;

/*
Job_Satisfaction    	Attrition_Rate
Satisfied				73
Very Dissatisfied		66
Very Satisfied			52
Dissatisfied			46
*/



        

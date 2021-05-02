# Pewlett-Hackard-Analysis
Employee Database with SQL

# Project Overview


## Project Purpose
The Human Resources (HR) department at Pewlett Hackard is preparing for the retirement of a large segment of their workforce. They would like to know how many current employees and their associated departments are approaching retirement, and of those employees, who are eligible for a retirement package. The outcome of the analysis to be able to assess the impacts and opportunities for the company to leverage the existing skills, as well as  developing new talent as part of a new Mentorship Program to future-proof the company.

The objectives of this project were to:

    1) Determine number of retirement-eligible employees by titles 
    2) Identify which retiring employees are qualified for a new mentorship program

The new Mentorship Program will help Pewlett Hackard to retain experienced and successful employees that want to step back into a part-time role instead of retiring completely. Their new role in the company would be as mentor for newly hired employees. 

## Project Scope
This analysis evaluated large datasets from various CSV files containing information about departments, department managers, employees, employees associated to different departments, employee titles, and salaries. The Entity Relationship Diagrams (ERD) was created to map out the primary and foreing keys and assign data types to create six initial tables from the CSV files.

The analysis involved creating additional new database tables and constructing queries to retrieve the required information from the imported CSV files about:

    * The number of employees by their most recent job titles who are approaching retirement
    * The number of titles filled by employees who are retiring
    * The number of titles filled by employees who are retiring
    * Employee counts
    * Employee first and last names
    * Employee titles
    * Birth dates 
    * From and to dates for employee titles

To refine the query, multiple tables were also joined on the primary keys and on their columns. The data from the different joined tables was then filtered by different conditions, and the table was also grouped and sorted by criteria. This entailed the following:

     * Filtering the number of employees by their most recent job title who are nearing retirement to determine which departments are impacted
     * Using the DISTINCT ON statement to retrieve the first occurence of employee number for each set of rows to remove duplicate data and nulls
     * Counting the number of titles filled by employees who are retiring
     * Sorting the data so that it's organized and readable
     * Filtering the data from the employee birth date columns to extract employees who were born between 1952 and 1955 to determine retirement                    eligibility.
     * Filtering the data all current employee to get all the employees whose birth dates are between January 1, 1965 and December 31, 1965 to                    determine eligibility for the Mentorship Program.
     
The query results were saved to several new tables created from the SELECT statements on specific columns of the existing tables and joined with the employees, department employees, department manager and titles tables. The new tables were exported and saved as CSV files.

PostgreSQL and pgAdmin's query editor were used to write SQL statements and execute the code to generate the schema and queries to perform the analysis for this project. The SQL files were also captured in Visual Studio Code editor and saved as .sql files as a backup to PostgreSQL database for recoverability purposes.

# Results
There were four new tables created as part of this analysis. The tables below display a snapshot from these tables and their data. As these are are large datasets, the full tables are not shown here. However, they can be found in the Data folder.


    1. Retirement Titles - This table identied all employees who were born between 1952 and 1955 and eligible for retirement. Below is a sample table.

![image](https://user-images.githubusercontent.com/80140082/116802294-8bc32280-aac6-11eb-82b5-952f3a1b9ead.png)


    3. Unique Titles - This table showed the most recent title for employees qualified for retirement

![image](https://user-images.githubusercontent.com/80140082/116802349-e78dab80-aac6-11eb-9078-e2f26d4f1940.png)


    5. Retiring Titles - This table showed the titles for the employees of retirement age
    
![image](https://user-images.githubusercontent.com/80140082/116802328-cdec6400-aac6-11eb-875d-3df3f3fa67b0.png)


    7. Mentorship Eligibility - This table showed the number of employees eligible for the Mentorship Program

![image](https://user-images.githubusercontent.com/80140082/116802356-f4aa9a80-aac6-11eb-8fca-87cc158fc727.png)


# Summary

1) There are currently 300,024 employees at Pewlett Hackard.

2) There are 90,398 employees with unique titles that were born between 1952-01-01 and 1955-12-31 that are eligible for retirement packages. This amounts to 30% of total current employees population that are nearing retirement. 

3) Based on the Retiring Titles table, Senior Engineers titles account for 33% and Senior Staff titles account for 31% of the retirement-eligible employee population. Combined these titles represent 64% of the total 90,398 retirement-qualified employees. This could present a significant risk to the company to have a large number of attrition for these two titles. The recommendation is to create a pipeline for these titles in the Mentorship Program to future-proof the company against loss of this knowledge base and skillsets.

![image](https://user-images.githubusercontent.com/80140082/116820738-61578080-ab2b-11eb-94d5-84f59f40a358.png)


4) 

5) Based on the mentorship-eligibility analysis, there are 280 (1%) retiring Senior Engineers and 275 (1%) retiring Senior Staff eligible for the Mentorship Program. This further increases the risk of attrition for these key roles/itles. In addition to retaining these critical skills and developing them in the new employees as part of the Mentorship Program, Pewlett Hackard should create a hiring pipeline for these high priority roles as the retirement-mentorship-eligible employees will eventually retire.



       

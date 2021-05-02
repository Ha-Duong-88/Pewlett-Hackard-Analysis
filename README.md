# Pewlett-Hackard-Analysis
Employee Database with SQL

# Project Overview


## Project Purpose
The Human Resources (HR) department at Pewlett Hackard is preparing for the retirement of a large segment of their workforce. They would like to know how many current employees and their associated departments are approaching retirement to assess the impacts and opportunities for the company to leverage the existing skills while developing new talent for a new Mentorship Program being established.

The objectives of this project were to:
    1) Determine number of retirement-eligible employees by titles 
    2) Identify which retiring employees are qualified for a new mentorship program

The new Mentorship Program will help Pewlett Hackard to retain experienced and successful employees that want to step back into a part-time role instead of retiring completely. Their new role in the company would be as mentor for newly hired employees. 

## Project Scope
This analysis evaluated large datasets from various CSV files containing information about departments, department managers, employees, employees associated to different departments, employee titles, and salaries. The Entity Relationship Diagrams(ERD)was initially created to map out the primary and foreing keys and assign data types.

The analysis involved creating new database tables and constructing queries to retrieve the required information from the imported CSV files about:

    * The number of employees by their most recent job titles who are approaching retirement
    * The number of titles filled by employees who are retiring
    * The number of titles filled by employees who are retiring
    * Employee counts
    * Employee first and last names
    * Employee titles
    * Birth dates 
    * From and to dates for employee titles

To refine the query, multiple tables were also joined on the primary keys and on their columns. The data from the different joined tables was then filtered by different conditions, grouped and sorted in the database. This entailed:

     * Filtering the data from the employee birth date columns to extract employees who were born between 1952 and 1955
     * Filtering the number of employees by their most recent job title who are nearing retirement
     * Using the DISTINCT ON statement to retrieve the first occurence of employee number for each set of rows
     * Counting the number of titles filled by employees who are retiring
     * Sorting the data so that it's organized and readable
     
The query results were saved to several new tables created from the SELECT statements on specific columns of the existing tables and joined with the employees, department employees, department manager and titles tables. The new tables were exported and saved as CSV files.

PostgreSQL and pgAdmin's query editor were used to write SQL statements and execute the code to generate the schema and queries to perform the analysis for this project. The SQL files were also captured in Visual Studio Code editor and saved as .sql files as a backup to PostgreSQL database for recoverability purposes.

# Results
There were four new tables created as part of this analysis.


    1. Retirement Titles - This table identied all employees who were born between 1952 and 1955 and eligible for retirement. Below is a sample table.


![image](https://user-images.githubusercontent.com/80140082/116802294-8bc32280-aac6-11eb-82b5-952f3a1b9ead.png)

    3. Unique Titles - This table showed the most recent title for employees qualified for retirement


![image](https://user-images.githubusercontent.com/80140082/116802349-e78dab80-aac6-11eb-9078-e2f26d4f1940.png)



    5. Retiring Titles - This table showed the titles for the employees of retirement age
    

![image](https://user-images.githubusercontent.com/80140082/116802328-cdec6400-aac6-11eb-875d-3df3f3fa67b0.png)

    7. Mentorship Eligibility - This table showed the number of employees eligible for the Mentorship Program


![image](https://user-images.githubusercontent.com/80140082/116802356-f4aa9a80-aac6-11eb-8fca-87cc158fc727.png)


# Summary

## TO-DO:
ADD this tomorrow
## How many employees retiring and their titles
## How many employees eligible for Mentorship Program


Generate 2 additional tables or queries that may provide more insights tomorrow
    # % retiring employees (retiring/total)
    # count/% of senior titles
    # % of the retiring titles are eligible for mentorship program

       

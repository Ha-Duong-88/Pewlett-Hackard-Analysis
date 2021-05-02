# Pewlett-Hackard-Analysis
Employee Database with SQL

# Project Overview


## Project Purpose
The objective of this project was to determine the number of retirement-eligible employees based on their birth dates, job titles, employment dates. and number of retiring employees that are eligible to participate in a mentorship program to train employees getting ready for retirement. The new mentoring program will help to retain experienced and successful employees that want to step back into a part-time role instead of retiring completely. Their new role in the company would be as a mentor to newly hired employees.

## Project Deliverables
There were two deliverables for this analysis project:

    1. To determine the number of retiring employees per title
    2. To identify employees who are eligible to participate in a mentorship program

## Project Scope
This analysis evaluated data from various CSV files containing information about departments, department managers, employees, employees associated to different departments, employee titles, and salaries. An Entity Relationship Diagram (ERD) was initially created to create the conceptual, logical and physical database schema. The analysis involved creating database tables and various queries to retrieve various information from the imported CSV files about:
    
    * The number of employees by their most recent job titles who are approaching retiring
    * The number of titles filled by employees who are retiring
    * The number of titles filled by employees who are retiring
    * Employee counts
    * Employee first and last names
    * Employee titles
    * Birth dates 
    * From and to dates for employee titles

To refine the query, muultiple tables were joined using inner and left joins on the primary keys and on various columns in order to retrieve the information needed. The query output was then stored in new tables created from which further queries were performed.  

The data from the various joined tables was further filtered by different conditions, such as:
        * Filtering the data from the employee birth date columns to extract employees who were born between 1952 and 1955
        * Filtering the number of employees by their most recent job title who are nearing retirement
        * Using the DISTINCT ON statement to retrieve the first occurence of employee number for each set of rows
        * The number of titles filled by employees who are retiring
     
The query results were outputed to new tables created from the select statements on specific columns from the existing tables, joins with the employees, department employees, titles

and table joins were exported to CSV files.

PostgreSQL and pgAdmin were used to write SQL statements and functions for the schema and queries generated during the analysis. In addition, the SQL files were also created in Visual Studio Code editor to store the .sql files.

## Results

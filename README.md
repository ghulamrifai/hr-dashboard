# HR Analytics Dashboard

This project aims to analyze employee data and performance metrics for HR management. The processed data is used to create an interactive dashboard using **Power BI**.

## Objective

Before building the dashboard, data is analyzed and processed using SQL queries to create a unified table. This table combines data from multiple datasets, including employee information, education levels, satisfaction levels, and performance ratings, to provide the following insights:

- **Employee Demographics:** Gender, age, department, and job roles.
- **Satisfaction Levels:** Environment, job, and relationship satisfaction.
- **Performance Metrics:** Work-life balance, self-rating, and manager rating.
- **Attrition Analysis:** Employee attrition rates and trends.

## Approach

The data integration process uses SQL queries to combine and process the datasets:

1. **Data Loading:**
   - CSV files are loaded into MySQL tables (`education_level`, `employees`, `satisfied_level`, `rating_level`, and `performance_rating`).

2. **Data Integration:**
   - The `EmployeeFull` table is created by joining multiple tables, adding descriptions for satisfaction and rating levels.

3. **Key Calculations:**
   - **Attrition Trends:** Tracks employee attrition over time.
   - **Performance Ratings:** Combines self-rating, manager rating, and satisfaction scores.

4. **Data Ordering:**
   - Ensures chronological order for time-based analysis.

## Results

The final integrated table (`EmployeeFull`) is used as the primary data source for the **Power BI** dashboard. The dashboard visualizes key HR metrics, including attrition rates, satisfaction levels, and performance trends.

## Dashboard Access

The dashboard can be accessed via the following link: **[click here.](https://app.powerbi.com/view?r=eyJrIjoiYTQzZDhhMzgtODIyNy00NzdhLWFmYjEtNTk2MWE5OTNlNTNhIiwidCI6IjgyMTE5NTA1LTdmNTYtNGUxZC04NTlhLWJiZWFjODNhNzhhMCIsImMiOjEwfQ%3D%3D&pageName=fda8be94a7aa3fcf2ae6)**

## Query Structure

Here is an overview of the SQL query process:

- **Employee Data Integration:** Joins multiple datasets into a unified table.
- **Satisfaction Level Descriptions:** Adds detailed descriptions for environment, job, and relationship satisfaction.
- **Rating Level Descriptions:** Includes descriptions for work-life balance, self-rating, and manager rating.
- **Attrition Analysis:** Tracks trends in employee attrition based on hire and review dates.

# FINSTAD Case 1 — Project Guidelines

## Class & Group Details

| Field   | Detail                |
|---------|-----------------------|
| Course  | FINSTAD               |
| Section | C01                   |
| Group   | 3                     |

## Group Members

| #   | Last Name  | First Name & Middle Name       |
|-----|------------|--------------------------------|
| 1   | CRUZ       | Ricardo Miguel Iñigo           |
| 2   | GALEDO     | Enrique Lorenzo Hermoso        |
| 3   | SEBALLOS   | Josiah Dweyn Panganiban        |
| 4   | SEECHUNG   | Camille Castro                 |
| 5   | SISON      | Aaron Joshua Estacio           |

Case Background
Build an integrated database combining one U.S. asset, one Philippine asset, one cryptocurrency, SPY and required FRED macroeconomic variables. Apply SQL concepts using dplyr to acquire, clean, integrate and analyze data before making an investment recommendation.

Learning Objectives
Acquire financial data; apply SQL using dplyr; integrate datasets; justify joins; handle missing values; compute descriptive statistics; create visualizations; communicate investment insights.

Required Datasets
One U.S. Asset (student choice), One Philippine Asset (student choice), One Cryptocurrency (student choice), SPY (required), 10-Year Treasury Yield (required), Federal Funds Rate (required), CPI (required), VIX (required).

Sample Period
Download all available observations from January 1, 2020 through December 31, 2025. Construct one unified analytical dataset using appropriate SQL joins and justify the chosen join strategy.

Data Acquisition Requirements
For every dataset report source, date range, original observations, missing values and duplicates.

Database Integration Requirements
Report observations before joins, after joins and in the final analytical dataset. Explain reductions in observations and discuss missing values caused by trading calendars and reporting frequencies. Demonstrate left_join(), inner_join(), full_join() and anti_join(); justify the join(s) used in the final database.

SQL Investigation
Investigate at least 10 meaningful financial questions using select(), filter(), mutate(), arrange(), group_by() and summarise(). Each query must include Objective, Code, Output and Interpretation.

Descriptive Statistics
Compute mean, median, variance, standard deviation, minimum, maximum, range, skewness and kurtosis.

Visualization
Produce at least eight professional figures with interpretations.

Exploratory Financial Analysis
Compare returns, volatility, inflationary periods, high-VIX periods and interest-rate environments.

Investment Recommendation
ecommend allocation of USD 1,000,000 among the selected U.S. asset, Philippine asset, cryptocurrency and cash.

Deliverables
15–20 page report, Executive Dashboard, R script, R Markdown (if applicable), 10-minute presentation.

Presentation
Maximum 10 minutes. All members participate.

Academic Integrity
Original work only. Properly cite all sources.

Grading Rubric
Criterion

Points

Data Acquisition & Cleaning

15

Database Integration & SQL

25

Descriptive Statistics

15

Visualization

10

Exploratory Analysis

15

Investment Recommendation

10

Written Report

5

Presentation

5

Appendix A - Suggested Assets
US: AMD, PLTR, XOM, FCX, COST, BA, CAT, NEM, GLD, XLE, QQQ
PH: ICT, JFC, ACEN, SCC, ALI, SMPH, TEL, MER, CNVRG, AP, MONDE, BLOOM, DMC
Crypto: BTC, ETH, SOL

Appendix B - Suggested SQL Questions
Answer any 10 meaningful financial questions using SQL.

Appendix C - Submission Checklist
Report, Dashboard, R Script, Rmd, Presentation, References

 

Report Outline
Building an Integrated Financial Database Using SQL in R

This template provides the required structure for your final case study report. Follow the sequence below unless otherwise instructed by your instructor.

Cover Page
Include the case title, course, group number, names of all members, instructor, and submission date.

Executive Summary (1 Page)
Summarize the objectives, datasets used, major SQL findings, key statistical results, and investment recommendation.

Table of Contents
Generate an automatic Table of Contents using Word heading styles.

1. Introduction
Discuss the background of the study, objectives of the analysis, and the importance of integrating multiple financial datasets.

2. Data Sources
Describe the selected U.S. asset, Philippine asset, cryptocurrency, SPY benchmark, and the four required FRED macroeconomic variables.

3. Data Acquisition
Present a table showing the data source, sample period, original observations downloaded, missing values, and duplicate observations for each dataset.

Dataset

Source

Original Observations

Missing Values

Duplicates

 

 

 

 

 

4. Data Cleaning
Describe the cleaning procedures performed, treatment of missing values, duplicate observations, and return calculations.

5. Database Integration
Explain the SQL join strategy used. Include a table showing the number of observations before each major join, after each major join, and in the final analytical dataset. Justify the selected join strategy and explain any reduction in observations.

Dataset

Original Observations

After Joins

Final Analytical Dataset

 

 

 

 

6. SQL-Based Financial Investigation
Present at least TEN (10) financial SQL investigations. For EACH investigation include:
• Objective
• SQL/dplyr Code
• Output
• Financial Interpretation

SQL Investigation 1
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 2
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 3
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 4
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 5
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 6
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 7
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 8
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 9
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

SQL Investigation 10
Objective: ____________________________________________

Code: ____________________________________________

Output: ____________________________________________

Financial Interpretation: ____________________________________________

7. Descriptive Statistical Analysis
Present descriptive statistics (mean, median, variance, standard deviation, minimum, maximum, range, skewness, kurtosis) and discuss their financial implications.

8. Data Visualization
Present at least EIGHT (8) professional-quality figures. Each figure should include a title, figure number, and financial interpretation.

9. Exploratory Financial Analysis
Answer the required financial questions using evidence from the SQL investigations, descriptive statistics, and visualizations.

10. Investment Recommendation
Recommend an allocation of USD 1,000,000 among the selected U.S. asset, Philippine asset, cryptocurrency, and cash. Justify your recommendation using evidence from the analysis.

11. Executive Dashboard (1 Page)
Prepare a one-page executive dashboard containing: selected assets, key descriptive statistics, 3–5 important charts, major SQL findings, and the final investment recommendation.

12. Conclusion
Summarize the major findings, limitations, and recommendations for future work.

References
Cite all references using the required citation style.

Appendix A – Complete R Code
Include the complete R script used in the analysis.

Appendix B – Additional Tables and Figures
Include supplementary outputs that are too large for the main report.

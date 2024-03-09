# Exploratory Data Analysis on Cognitive Empathy and Academic Motivation among Medical Students

**Description:**
This repository contains an exploratory data analysis (EDA) on the Medical Student Mental Health dataset [Kaggle dataset](https://www.kaggle.com/datasets/thedevastator/medical-student-mental-health), conducted to investigate the relationship between cognitive empathy and academic motivation among males, considering job status as a potential factor. The dataset explores empathy, mental health, and burnout among medical students in Switzerland.

**Key Highlights:**
- **Dataset Overview:** The dataset comprises around 886 responses across 20 parameters, including demographic factors and internal measures such as job satisfaction, psychological distress, education grades, self-reported health status, empathy rating scales, and job status.

- **Data Cleaning and Preparation:** Data cleaning involved filtering for male gender data, selecting relevant variables (AMSP, QCAE_COG, and job), and checking for null values and outliers. Normality tests were conducted using histogram, Q-Q plots, Shapiro-Wilk test, skewness, and kurtosis.

- **Data Analysis:** The analysis focused on exploring the correlation between Academic Motivation Score (AMSP) and Cognitive Empathy Score (QCAE_COG). Pearson's correlation was used to validate assumptions, indicating a moderate positive correlation between the two variables.

- **Statistical Hypothesis Testing:** A statistical hypothesis test was conducted to examine the association between AMSP and QCAE_COG with job status as a controlling variable. Partial correlation analysis revealed a similar correlation value, suggesting negligible effect of job status.

- **Conclusion:** Despite initial indications of non-normality, further analysis confirmed a normal distribution. Results indicated a moderate linear relationship between AMSP and QCAE_COG, unaffected by job status. The plotted confidence intervals and statistical tests supported the findings, highlighting a positive correlation between academic motivation and cognitive empathy among male medical students.

**Dataset Citation:**
- Carrard, V. (2022, July 01). Dataset for the paper ‘The relationship between medical students’ empathy, mental health, and burnout: A cross-sectional study’ published in Medical Teacher. [Dataset Link](https://doi.org/10.5281/zenodo.5702895)

# World Layoffs Analysis

## Overview
This project analyses global layoff data to understand trends across **time, geography, industries, and companies**.  
The objective is to identify patterns behind large-scale layoffs and evaluate whether factors such as **industry type, company size, and funding levels** influenced workforce reductions.

This project was completed as a **portfolio case study** using SQL and Power BI.

---

## Business Questions
The analysis focuses on answering the following questions:

1. What was the overall scale of global layoffs?
2. How did layoffs change over time?
3. Which countries experienced the highest layoffs?
4. Which industries were most impacted?
5. Were layoffs concentrated among a small number of companies?
6. Did higher company funding reduce the severity of layoffs?

---

## 🛠 Tools Used
- **MySQL** – data cleaning and transformation
- **Power BI** – data visualization and dashboard design
- **GitHub** – documentation and project hosting

---

## Data Preparation (SQL)
The raw dataset required cleaning before analysis. Using MySQL, I:

- Removed duplicate records
- Standardized company, country, and industry names
- Converted date fields into a usable format
- Handled missing and null values
- Created a clean staging table (`layoffs_staging2`) for analysis

📄 **SQL Script:**  
![View data cleaning SQL](assets/docs/Data_cleaning.sql)

---

## 📊 Dashboard
The Power BI dashboard summarizes key trends and insights from the dataset.

📄 **Power BI File:**  
![View dashboard](assets/images/World layoffs Dashboard.png)

---

## 🔍 Key Insights

### 1. Layoffs peaked during recent years
Layoffs increased sharply after 2021, peaking in 2022 and remaining elevated in 2023.  
This suggests that layoffs were not a short-term reaction, but part of a prolonged period of workforce restructuring.

---

### 2. Layoffs were geographically concentrated
The United States accounted for the largest share of total layoffs by a significant margin.  
This indicates that global layoffs were **not evenly distributed**, and were heavily influenced by labor market conditions in a small number of countries.

---

### 3. Certain industries were disproportionately affected
Technology, consumer, and retail-related industries experienced the highest number of layoffs.  
This suggests industry-specific challenges such as overexpansion, demand correction, and cost optimization played a larger role than global economic factors alone.

---

### 4. A small number of companies drove most layoffs
While many companies conducted layoffs, a relatively small group of firms accounted for a large share of total layoffs.  
This explains why the average layoffs per company appears high and highlights the **skewed nature of the data**.

---

### 5. High funding did not prevent layoffs
The scatter plot analysis shows no strong relationship between funds raised and total layoffs.  
Several well-funded companies still conducted large layoffs, indicating that access to capital alone did not protect companies from workforce reductions.

---

## 📈 Conclusion
This analysis demonstrates that global layoffs were:

- Concentrated in specific years
- Heavily influenced by geography and industry
- Driven by a small number of large companies
- Not prevented by high funding levels

The project highlights how SQL and Power BI can be used together to transform raw data into actionable insights.

---

## Future Improvements
- Analyze layoffs at a monthly level
- Compare layoffs before and after major economic events
- Incorporate employee headcount data to calculate layoff percentages

---

## 👤 About Me
Aspiring Data Analyst with experience in:
- SQL (MySQL)
- Power BI
- Python (beginner)


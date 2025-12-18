-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;

-- Identify the maximum value for "Total layoff and percentage layoff"
SELECT MAX(total_laid_off), MAX(percentage_laid_off) 
FROM layoffs_staging2;


SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Calculate the sum of layoffs by company
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Identify the Min and Max date
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- Calculate sum of total layoffs by industry
SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT *
FROM layoffs_staging2;

-- Identify sum of layoffs by country
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT *
FROM layoffs_staging2;

-- Identify sum of layoffs per year
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC; 

-- Identify layoffs by stage
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC; 

-- Identify layoffs per month
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

-- Creating a CTE to show the rolling total
WITH Rolling_Total AS 
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off, 
 SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total; 

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(
SELECT *, DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;


SELECT
	funds_raised_millions,
    total_laid_off
FROM layoffs_staging2
WHERE funds_raised_millions IS NOT NULL 
ORDER BY funds_raised_millions DESC;

SELECT country, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY country 
ORDER BY total_layoffs DESC
LIMIT 10;

SELECT industry, SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY industry 
ORDER BY total_layoffs DESC
LIMIT 10;


SELECT 
    YEAR(date) AS year,
    SUM(total_laid_off) AS total_laid_off,
    LAG(SUM(total_laid_off)) OVER (ORDER BY YEAR(date)) AS previous_year,
    (SUM(total_laid_off) - LAG(SUM(total_laid_off)) OVER (ORDER BY YEAR(date))) /
        LAG(SUM(total_laid_off)) OVER (ORDER BY YEAR(date)) * 100 AS YoY_percent
FROM layoffs_staging2
GROUP BY year
ORDER BY year;


SELECT 
	COUNT(DISTINCT company) AS companies_affected
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL;

SELECT 
	COUNT(DISTINCT country) AS countries_affected
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL;

SELECT 
	COUNT(DISTINCT industry) AS industries_impacted
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL;

SELECT
	ROUND(SUM(total_laid_off) / COUNT(DISTINCT company), 2) AS avg_layoffs_per_company
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL;
    
SELECT company,
total_laid_off
FROM layoffs_staging2
WHERE total_laid_off IS NOT NULL;


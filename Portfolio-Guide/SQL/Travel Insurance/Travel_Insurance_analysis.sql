/*
Project: Travel Insurance Data Analysis
Dataset: Travel Insurance Claims
Objective: Cleaning Up, Exploring customer demographics, product popularity, and travel patterns
*/

-- Having a first overview of what the table looks like

select *
from travel_insurance

-- Let's start by selecting only the fields we're interested in.

select agency, [Agency Type],[Distribution Channel],[Product Name],Claim,Duration,Destination,gender,Age
from dbo.travel_insurance

-- Getting a list of all the countries

select distinct destination
from travel_insurance
order by destination asc

-- Some countries have quotes at the beginning. Let's add a new column to fix the quotes while preserving the integrity of the table.

ALTER TABLE travel_insurance
ADD destination_new VARCHAR(255);

-- Let's now populate that new column with the countries and remove the quotes.

UPDATE travel_insurance
SET destination_new = REPLACE(destination, '"', '');

-- Let's get a list of all the genders and their count

SELECT gender, COUNT(*) as count
FROM travel_insurance
GROUP BY gender
ORDER BY count DESC;

-- Gender Analysis
-- Total rows: 63,326
-- Null entries: 42,952 (67.8%)
-- Remaining entries show inconsistent values
-- Conclusion: Gender data is too unreliable for meaningful analysis


-- Let's do the same with age

SELECT Age, COUNT(*) as count
FROM travel_insurance
GROUP BY age
ORDER BY count DESC;

-- Age Data Cleaning Challenges:
-- - Entries with commas (e.g., ',36', 'M,42')
-- - Mixed data types (strings with letters)
-- - Inconsistent formatting
-- Solution: Create age_new column to preserve original data

ALTER TABLE travel_insurance
ADD age_new INT;

-- Update the new column with cleaned age values
UPDATE travel_insurance
SET age_new = CASE 
    -- Remove prefixes like ',', 'M,', 'F,'
    WHEN age LIKE '%,%' THEN CAST(REPLACE(REPLACE(REPLACE(age, 'M,', ''), 'F,', ''), ',', '') AS INT)
    -- Direct conversion for clean numeric entries
    WHEN ISNUMERIC(age) = 1 THEN CAST(age AS INT)
    -- Handle any other special cases
    ELSE NULL
END;

-- Optional: Verify the results
SELECT age, age_new, COUNT(*) as count
FROM travel_insurance
GROUP BY age, age_new
ORDER BY count DESC;

-- Let's add an age_group column

ALTER TABLE travel_insurance
ADD age_group VARCHAR(20);

-- And populate it from age_new

UPDATE travel_insurance
SET age_group = CASE
    WHEN age_new < 18 THEN 'Under 18'
    WHEN age_new BETWEEN 18 AND 24 THEN '18-24'
    WHEN age_new BETWEEN 25 AND 34 THEN '25-34'
    WHEN age_new BETWEEN 35 AND 44 THEN '35-44'
    WHEN age_new BETWEEN 45 AND 54 THEN '45-54'
    WHEN age_new BETWEEN 55 AND 64 THEN '55-64'
    WHEN age_new >= 65 THEN '65+'
    ELSE 'Unknown'
END;


select agency, [Agency Type], [Distribution Channel],[Product Name],Claim,Duration,Destination_new,Age_new, age_group
from dbo.travel_insurance

-- Now let's answer some questions : 

-- Top 10 Destinations for 65+ Travelers
-- Identifies most popular destinations for senior travelers

WITH Destinations65Plus AS (
    SELECT 
        destination_new, 
        COUNT(*) as total_count,
        ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) as percentage
    FROM travel_insurance
    WHERE age_group = '65+'
    GROUP BY destination_new
)
SELECT TOP 10
    destination_new, 
    total_count,
    percentage
FROM Destinations65Plus
ORDER BY total_count DESC;

--Summary: Senior travelers (65+) predominantly choose Asian destinations:
-- India is the most popular, accounting for 28.28% of senior travel
-- Singapore follows at 19.09%
-- Malaysia and Thailand are also top choices
-- Western destinations like the United States appear less frequently
-- Top 4 destinations (India, Singapore, Malaysia, Thailand) represent over 70% of senior travel


-- Product Popularity Among 35-44 Age Group
-- Analyzes which insurance products are most common for this demographic

WITH ProductPopularity AS (
    SELECT 
        [Product Name], 
        COUNT(*) as total_count,
        ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) as percentage
    FROM travel_insurance
    WHERE age_group = '35-44'
    GROUP BY [Product Name]
)
SELECT TOP 5
    [Product Name], 
    total_count,
    percentage
FROM ProductPopularity
ORDER BY total_count DESC;

-- Summary: Insurance Product Preferences for Mid-Career Professionals:
-- Cancellation Plan dominates, covering 42.24% of products
-- 2-Way Comprehensive Plan is second, at 31.27%
-- Top two plans account for over 73% of product choices
-- Suggests this age group values flexibility and comprehensive coverage

-- Average duration of travel by age group

SELECT 
    age_group, 
    AVG(CAST(Duration AS FLOAT)) as avg_duration
FROM travel_insurance
GROUP BY age_group
ORDER BY avg_duration DESC;

-- Summary: Travel Duration Across Age Groups:
-- Youngest group (Under 18) has longest average travel duration
-- Middle-aged groups show moderate travel lengths
-- Seniors (65+) have shorter average travel times
-- Potential insights: 
--  * Younger travelers might have more extended trips
--  * Older travelers prefer shorter, more manageable travel periods

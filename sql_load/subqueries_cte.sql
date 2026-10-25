WITH company_job_count AS(
    SELECT 
    company_id,
    COUNT(*) AS job_count
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT 
cd.name AS company_name,
cjc.job_count
FROM company_dim AS cd
LEFT JOIN company_job_count AS cjc ON cd.company_id =cjc.company_id
ORDER BY cjc.job_count DESC
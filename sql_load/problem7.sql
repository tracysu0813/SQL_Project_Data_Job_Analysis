
WITH remote_job_skills AS(
    SELECT 
        skill_id, 
        COUNT(*) AS skill_count 
    FROM skills_job_dim AS skd
    INNER JOIN job_postings_fact AS jpf ON skd.job_id = jpf.job_id
    WHERE jpf.job_work_from_home =True AND
          jpf.job_title_short ='Data Analyst'
    GROUP BY skill_id
)
SELECT 
    sd.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills AS rjk
INNER JOIN skills_dim AS sd ON sd.skill_id = rjk.skill_id
ORDER BY skill_count DESC
LIMIT 5
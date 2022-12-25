/*
    c. Get the total number of patients to be discharged today group by departments in a hospital
*/
SELECT
    department_id,
    COUNT(*) AS total_patients
FROM
    bed_request
WHERE
    expected_discharge_date = CURDATE()
GROUP BY
    department_id;
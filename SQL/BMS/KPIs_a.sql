/*
    a. Get all the bed requests whose request_status is PENDING and the request_date is within 
*/
SELECT
    *
FROM
    bed_request
WHERE
    request_status = 'PENDING' 
        AND
    request_date BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 24 HOUR)
ORDER BY
    priority;
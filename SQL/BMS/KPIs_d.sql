/*
    d. Get average delay(Hrs) in bed allocation group by priority
*/
SELECT
    AVG(
        TIMESTAMPDIFF(
            HOUR,
            request_date,
            allocated_date
        )
    ) AS 'delay(in hours)'
FROM
	bed_request
WHERE
    request_status = 'approved';
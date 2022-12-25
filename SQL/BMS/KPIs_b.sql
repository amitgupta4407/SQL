/*
    b. Get all the room in which there are minimum 3 beds available (allocation_status is EMPTY)
*/
SELECT
    r.*
FROM
    room r
JOIN bed b ON b.room_id = r.room_id
WHERE
    b.allocation_status = 'EMPTY'
GROUP BY
    r.room_id
HAVING
    COUNT(b.bed_id) >= 3;
SELECT (   
    CASE
        WHEN contact is not NULL THEN contact
        ELSE 0
    END) AS contact
FROM user
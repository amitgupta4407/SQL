-- kitna user ka details(first_name, last_name, email) repeat ho raha hai 
SELECT
* 
FROM contacts
WHERE id not in (
    SELECT MIN(id) from contacts
    GROUP BY first_name, last_name, email
)


DELETE
FROM contacts
WHERE id not in (
    SELECT MIN(id) from contacts
    GROUP BY first_name, last_name, email
)



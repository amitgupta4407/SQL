/*
Case Study

    You are building an application like tinder, consider the following scenarios:

    There will be multiple users
    Users can right swipe each other to send dating request
    Users can send any number of requests to other users
    Convert the above business scenario to database tables

    Write a query to print the name and details of all the users to whom a particular user has sent request.
    Write a query to find the name of the user who has sent 2nd most number of requests, also print the count.

    Homework - Find the name of the user who has received min number of requests
    Find all the matches for a particular user
    Homework - Find all the unique couples
*/
/*
entity: user
table :
    u: user(
        u_id
        name
        email
        password
    )

    r: right_swip(
        r_id
        u_id
        requested_u_id
    )

*/

-- Write a query to print the name and details of all the users to whom a particular user has sent request.


-- Write a query to find the name of the user who has sent 2nd most number of requests, also print the count.
SELECT u.name, COUNT(requested_u_id) FROM right_swip r JOIN users u  ON r.u_id = u.u_id GROUP BY u_id limit 2,1

-- Find all the matches for a particular user

-- SELECT r1.u_id,r1.requested_u_id FROM right_swip r1 JOIN right_swip r2 ON r1.u_id = r2.requested_u_id
-- WHERE r1.requested_u_id = r2.u_id

-- u_id = romeo_id
-- requested_u_id = juliet_id

SELECT u1.name,u2.name
FROM right_swip r1
JOIN right_swip r2 ON r1.romeo_id = r2.juliet_id
JOIN users u1 ON r1.romeo_id = u1.user_id
JOIN user u2 ON r1.juliet_id = u2.user_id
WHERE r1.juliet_id = r2.romeo_id AND (r1.romeo_id = 1 OR r1.juliet_id = 1)
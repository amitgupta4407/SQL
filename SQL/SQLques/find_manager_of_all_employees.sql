-- table employee
-- id int,
-- fname varchar,
-- lname varchar,
-- manager_id int


select e1.fname, e2.fname FROM employees e1 
join employees e2 on e1.manager_id = e2.idl;

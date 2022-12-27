-- add multiple columns
ALTER TABLE table_name
ADD email varchar(255) NOT NULL UNIQUE,
ADD password varchar(255) NOT NULL

-- delete multiple columns
ALTER TABLE table_name
DROP COLUMN email,
DROP COLUMN password

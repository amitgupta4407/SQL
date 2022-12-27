# SQL vs NoSQL

Some key differences between SQL and NoSQL databases include:

    Data model: SQL databases use a structured data model, while NoSQL databases use an unstructured data model.
    Data organization: SQL databases store data in tables with rows and columns, while NoSQL databases store data in a variety of formats, including documents, key-value pairs, and graphs.
    Data manipulation: SQL databases use SQL queries to manipulate data, while NoSQL databases use different query languages, depending on the type of database.
    Scalability: NoSQL databases are generally more scalable than SQL databases, as they can handle larger amounts of data and more concurrent users.
    Data types: SQL databases support a limited set of data types, while NoSQL databases support a wider range of data types.
    Performance: SQL databases tend to perform better when dealing with structured data, while NoSQL databases tend to perform better when dealing with large amounts of unstructured data.

    # SQL 
        used in RDBMS
        inform of table
        eg = mySQL, postgree, 
        normalization


    # NoSQL
        unstructured data
        social media
        handle large data
        no normalization

# example
    many to many : students, course
    one to many : customer, addr; student, branch
    one to one : name, adhar, mobile (adhar for a person is unique)

# Table required for many to many and ont to many relationship table:
    3 to reduce data reduncency for many to many relationship
    2 for one to many relationship

# Draw schema for swiggy (user, restraunt, food)
    u: users(

    )

    r: restraunts(

    )

    f: foods(
        f_id
        name
    )

    m: menu(
        m_id
        r_id
        f_id
        price
    )

    o: orders(
        o_id
        u_id
        f_id
        r_id
    )

    od: order_details(
        order_id
        food_id
    )

    RELATION:
    f2r = m2m (so need one more table menu m) 
    u2r = (no direct relation ship but have indirect realtionship(one user can order from many restraunt))
        so m2m (need one more table orders o)
        order (connected to user & restraunt)
    o2m =(biryani can be part of many ored and order contain many food)
        m2m  (need one more order_details)

# Types of join 
    cross join : cartision product
    inner join : only common parts
    left join : all left element & common portion of right
    right join : all right element & common portion of left
    outer join : except inner join 
    self join  : join with itself ()

# ETL extract transform load
    example : EXTRACTiing data from OLTP DB then TRANSFORM (denormalizing) then LOAD to data warehouse(OLAP)

# Normalized vs DEnormalized Data
    Normalized:
        write operation is easy but read(select) is slow 
        #table increase
        no redundency

# OLAP Vs OLTP 
    OLTP : Online transection processing
        website
    OLAP : online analytical processing
        data ware house
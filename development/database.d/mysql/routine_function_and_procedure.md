# Summary

    A stored routine is either a procedure or a function.

    A procedure is invoked using a CALL statement and can only pass back values using output variables.

    A function can be called from inside a statement just like any other function and can return a scalar value.

[source](http://stackoverflow.com/a/2680887)

* A FUNCTION is always returns a value using the return statement. PROCEDURE may return one or more values through parameters or may not return at all.
* Functions are normally used for computations where as procedures are normally used for executing business logic.
* A Function returns 1 value only. Procedure can return multiple values (max 1024).
* Stored procedure returns always integer value by default zero. Whereas function returns type could be scalar or table or table values.
* Stored procedure is precompiled execution plan where as functions are not.
* A function can call directly by SQL statement like select func_name from dual while procedure cannot.
* Stored procedure has the security and reduces the network traffic and also we can call stored procedure in any no. of applications at a time.
* A Function can be used in the SQL Queries while a procedure cannot be used in SQL queries .that cause a major difference b/w function and procedures.

[source](http://stackoverflow.com/a/24954726)

# Function

    It must return value. *IN*, *OUT* and *INOUT* cannot be used in function.
    But return datatype must be declare when create a function. 
    Function can be called from a SQL statement. 
    Function return one values.

[source](http://stackoverflow.com/a/9699731)

# Procedure

    Return Values is not mandatory but may be uses the *OUT* parameter to procedure returns. 
    Can use the *IN* | *OUT* | *INOUT* parameters. 
    Procedure cannot be called from the SQL Statement. 
    Procedure return multiple values by using *OUT* or *INOUT* parameters.

[source](http://stackoverflow.com/a/9699731)

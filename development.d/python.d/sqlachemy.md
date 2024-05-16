# SQLAlchemy

## Kickstart Knowledge for 2.0

ref: https://www.youtube.com/watch?v=Uym2DHnUEno

### The Engine

* The Engine is a factory that makes new connections when used
  * The Engine includes a connection pool
* You can create a connection by using `engine.connect()` which retunrs a instance of `sqlalchemy.engine.Connection`
  * Use `create_engine(..., echo=True)` creates a basic logger

### The Connection

* The Connection is a proxy for a DBAPI connection
  * Use `.connection.driver_connection` if you want to know more
* The Connection has a `.execute()` method that is used to run the queries
* If you want to run pure sql queries, use `sqlalchemy.text()` to pass this as statement into `.execute()`
* `.execute()` returns a `sqlalchemy.engine.Result` object
  * Can also be a `sqlalchemy.engine.cursor.CursorResult` object which has less methods
* Has a `.close()` method which gives the connection back to the connection pool
  * This does not clode the connection automatically
  * You should not use `.close()` but python context managers today
    * `with engine.connect() as connection:`
* Use `.commit()` to commit a change (known as "commit and go")
  * SQLAlchemy never autocommits (by default configuration) and always starts a transaction
  * If you want to start an explicit transaction block that commits when complete, do `with engine.begin() as connection:`

### The Result

* Method `.first()` returns first row or None and close the result set
  * Row is a `sqlalchemy.engine.Row` object
  * Row object is mostly comparable to a named tuple
    * You can do `row.name` if the table you've selected contains a column `name`
* Method `.all()` returns all rows in a list
* Use `for row in result` to iterate over a list of rows
* Use `.scalars()` or `.scalars().all()` if you want the result back as simple values

### Table Metadata

Example for direct construction of a table.

```python

from sqlalchemy import Column, MetaData, Table
from sqlalchemy import DateTime, Integer, String

# Collection that could store a lot of table parameters
metadata = Metadata()

my_test_table = Table(
    "my_test_table",
    metadata,
    Column("id", Integer, primary_key=True),
    Column("name", String, nullable=False),
    Column("created_at", DateTime)
)
```

In moste applications, Table is constructed indirectly (know as Declerative ORM).

```python
from datetime import datetime
from sqlalchemy import func, ForeignKey
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column

# The class acts almost like a python dataclasses
class MyTestTable(DeclarativeBase)
    __tablename__ = "my_test_table"

    # Mapped is there to convert between python type system and database typesystem
    # mapped_column is optional and there to configure behavior
    id: Mapped[int] = mapped_column(primary_key=True, init=False)
    name: Mapped[str] = mapped_column(nullable=False)
    other_table_id: Mapped[int] = mapped_column(ForeignKey("other_table.id"))
    # If possible, do not use default_factory=datetime.utcnow since this is executed
    #   in python. It is better to use a dbms function for that
    # But keep in mind, this is than a server time function
    created_at: Mapped[datetime] = mapped_column(init=False, server_default=func.now())
```

You can use `DeclarativeBase.metadata.create_all()` to create all defined tables.

### The Insert function

By passing a Table object to the insert function, the function is able to create a SQL Insert statement out of it.

```python
from sqlalchemy import insert

statement = insert(User)
statement.values(name="Max Power")
# Hint: The values are passed to the database as parameters
print(statement)
# If you want to see the statement with the data
print(statement.compile(compile_kwargs={"literal_binds": True}))
```

Example how to insert pure data using sqlalchemy core functionality.

```pyhton
# Insert a long list of data
with engine.begin() as connection:
connection.execute(
    insert(User),
    [
        {"name": "Max Power"},
        {"name": "Mimi Power"}
    ]
)
```

### The Select function

A simple select example.

```python
from sqlalchemy import select

# Select column 'name' from database table 'user'
# If you want to have all columns selected, just pass in 'User'
statement = select(User.name)
```

A join example.

```python
# If you have ForeignKey's defined, it is pure magic
# In this example, it is defined that 'user.id = address.user_id'
# Hint: SQLAlchemy wants to automated things
select(User.name, Address.email).join_from(User, Address)
```

A complex example. Select user names that have more than one email address.

```python
# You can mark as select as subquery
# You can create a alias by using 'label()'
email_address_count = (
    select(
        Address.user_id,
        func.count(Address.email_address).label('email_count'),
    ).group_by(Address.user_id).having(func.count(Address.email_address) > 1).subquery()
)

statement = select(User.name, email_address_count.c.email_count).join_from(User, email_address_count)

with engine.connect() as connection:
    for row in connection.execute(statement):
        print(f"username: {row.name} | number of email addresses: {row.email_count}")

# Explicit ON clause
# ref: https://docs.sqlalchemy.org/en/20/tutorial/data_select.html#setting-the-on-clause
print(
    select(address.c.email_address)
    .select_from(User)
    .join(
        Address,
        user.id = address.user_id
    )
)
```

Additional informations.

```python
# Creates a 'lower(user.name) LIKE %'
print(User.name.icontains("foo"))

# In expressions
print(User.name.in_(['foo', 'bar']))

# Where expressions
# Hint: Where can be called multiple times. Criteria is joined by AND
select(User.name).where(User.name.in_(['foo', 'bar']))

# Select with or
# ref: https://docs.sqlalchemy.org/en/20/tutorial/data_select.html#the-where-clause
select(User.name).where(or_(User.name == 'foo', User.name == 'bar')
```

### Use the ORM force

Objects adds behaviors to non and instantiated classes.

The Session is to the ORM what the Connection object os to core. "The thing that interacts with the transaction."
The Session comes from the factory named `sessionmaker()`.
The Session connects to the database engines on demand. Use `session.connection()` to establish a connection but you should/must not.
To end a session, you have to call `.commit()`, `.rollback()` or `.close()`.

```python
from sqlalchemy.orm import sessionmaker

session_factory = sessionmaker(bind=engine)

with session_factory() as session:
    result = session.execute(text("SELECT 'Hello World'"))
    print(result.first())
```

By using sessions, you have to add a changed table row instance to the session using `.add()`. This modified row is in a pending state until a flush is executed.
A flush is triggered when `.execute()`, `.flush()` or `.commit()` is called.
To add multiple objects at once to a session, you can use `.add_all([])`.
New objects can be seen by inspecting the attribute `.new`.
Changed but not new objects can be seen by inspecting the attribute `.dirty`.

## Links

* [SQLAlchemy: slingacademy.com](https://www.slingacademy.com/cat/sqlalchemy/) - 20240514
* [SQLAlchemy ORM Querying Guide: sqlalchemy.org](https://docs.sqlalchemy.org/en/20/orm/queryguide/index.html) - 20240513
* [SQLAlchemy Unified Tutorial: sqlalchemy.org](https://docs.sqlalchemy.org/en/20/tutorial/index.html) - 20240513
* [Tutorial: SQLAlchemy 2.0 by Mike Bayer: youtube.com](https://www.youtube.com/watch?v=Uym2DHnUEno) - 20240513

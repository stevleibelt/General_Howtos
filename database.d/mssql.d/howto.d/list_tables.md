# How to list all available tables (with your connection)

## Pur SQL

```mssql
SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES;
```

## With SQLAlchemy

```python
# create session using pyodbc and mssql
from sqlalchemy import create_engine, Engine
from sqlalchemy.orm import Session, sessionmaker

connection_parameter_string: str = driver=ODBC+Driver+18+for+SQL+Server"
db_host_or_ip: str = ...
db_name: str = ...
password: str = ...
user_name: str = ...

engine: Engine = create_engine(
    url=f"mssql+pyodbc://{user_name}:{password}@{db_host_or_ip}/{db_name}?{connection_parameter_string}"
)
my_sessionmaker: sessionmaker = sessionmaker(bind=engine)
my_session: Session = my_sessionmaker()

# fetch information
result = my_session.execute(
    text("SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES")
)

# output information
print(":: table_schema, table_name")
for row in result:
    print(f"row: {row}")
```

### SQLAlchemy add index for multiple columns in one table

```python
from sqlachemy import Index
from sqlalchemy.orm import DeclarativeBase

Class MyTable(DeclarativeBase)
  __table_args__ = (
    Index(
      "my_index",
      "column_name_one",
      "column_name_two",
    ),
  )

  column_name_one: ...
```


# SQLAlchemy add contraint for multiple columns in one table

```python
from sqlachemy import UniqueContraint
from sqlalchemy.orm import DeclarativeBase

Class MyTable(DeclarativeBase)
  __table_args__ = (
    UniqueContraint(
      "column_name_one",
      "column_name_two",
      name="my_uniq_contraint",
    ),
  )

  column_name_one: ...
```


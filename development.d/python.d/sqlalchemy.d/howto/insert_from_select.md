# SQLAlchemy insert into with select statement

```python
from datetime import datetime, timedelta
from models import StatusStrEnum

current_datetime: datetime = datetime.now()
limit: int = 10
since: datetime = current_datetime - timedelta(weeks=2)

# Create the select statement
select_statement = select(
    MyTable.id.label("my_table_id"),
    literal(current_datetime).label("created_at"),
    literal(StatusStrEnum.new).label("status_enum"),    # assuming you have this column
).where(
    or_(
        and_(
            MyTable.updated_at.is_(None), MyTable.created_at >= since
        ),
        and_(
            MyTable.updated_at.is_not(None),
            MyTable.updated_at >= since,
        ),
    )
)

if limit is not None:
    select_statement.limit(limit)

insert_statement = insert(MyTableQueue).from_select(
    ["my_table_id", "created_at", "status_enum"],
    select_statement,
)

result = session.execute(insert_statement)

return result.rowcount
```

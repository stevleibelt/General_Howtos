# Alembic

## Benefits

* Automated database migrations with repository support
* Database represents code

## Setup

### Simple setup with one database or migration

```bash
pip install alembic
alembic init db_migrations
```

* Adapt db_migrations/env.py
  * Add your database model to the import list
  * Add `config.set_main_option'sqlalchemy.url', environ.get('MY_DATABASE_URL'))` below `config = context.config`
  * Adapt `target_metadata = YourDatabaseModel.metadata`

## Workflows

```bash
# create a new database migration revision
alembic revision --autogenerate -m "Extend table xyz with foo"

# apply all needed migrations
alembic upgrade head

# roll back latest migration
alembic downgrade -1

# roll back to a specific id
alembic downgrate <string: hash_of_the_revision>

# delete a specific migration
rm -fr db_migrations/versions/<string: hash_of_the_revision>

# handle merge conflicts
alembic merge heads
```

### Complex setup capable of handling multiple databases or migrations independent for each module

* Assuming you have `module_one` and `module_two`
* Assuming both modules are using the same Base database model class

```bash
# ref: https://alembic.sqlalchemy.org/en/latest/branches.html#multiple-bases
# ref: https://alembic.sqlalchemy.org/en/latest/cookbook.html#run-multiple-alembic-environments-from-one-ini-file
pip install alembic


# Repeate the following steps for each module by adapting the name
mkdir module_one
cd module_one
almebic init database/migrations
# Open up alembic.ini and adapt
#   script_location = database/migrations
#   prepend_sys_path = ../

```

* Open database/migrations/env.py and add the following python code

```python
# below: from alembic import context
from module_one.models import *
# below: target_metadata = None
target_metadata = Base.metadata
version_table_name = "module_one_alembic_versions"

# With this function, you change the behavior of this alembic setup
# to only take care about tables starting with `module_one_`
def include_object(object, name, type_ reflected, compare_to):
    if type_ == "table" and name.startswith("module_one_"):
        return True
    return False

# Add to both `context.configure` calls
    include_object=include_object,
    version_table=version_table_name,
```

* You can now `cd` into each project and call `alembic check` etc.

## Links

* [Handling Database Migrations with Alembic: testdriven.io](https://testdriven.io/blog/alembic-database-migrations/) - 20240412


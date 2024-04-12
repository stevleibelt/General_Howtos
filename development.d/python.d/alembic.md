# Alembic

## Benefits

* Automated database migrations with repository support
* Database represents code

## Setup

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
alembic upgread head

# roll back latest migration
alembic downgrade -1

# roll back to a specific id
alembic downgrate <string: hash_of_the_revision>

# delete a specific migration
rm -fr db_migrations/versions/<string: hash_of_the_revision>

# handle merge conflicts
alembic merge heads
```

## Links

* [Handling Database Migrations with Alembic: testdriven.io](https://testdriven.io/blog/alembic-database-migrations/) - 20240412

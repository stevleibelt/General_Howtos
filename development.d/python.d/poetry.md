# Poetry

## Kickstart

```bash
# Install
pip install poetry

# Create project
poetry new my_project

# Create environment
#   You can define the used python version
pip env /usr/bin/python3.11
# Use the environment
poetry shell

# Add depedency
poetry add <string: dependency>
#   Specify a version
poetry add <string: dependency>@x.x.x
#   Specify a most recent version (Limits to the next major version)
poetry add <string: dependency>^x.x.x
#   Specify a most recent version (Limits to the next minor version)
poetry add <string: dependency>~x.x.x

# Add development dependency
poetry add -D <string: dependency>

# Remove dependency
poetry remove <string: dependency>

# Install all dependencies
poetry install

# Build a wheel file
poetry build

# Show dependencies
poetry show
#   Show dependencies in a tree
poetry show --tree

# Update project version
#   Increase major version
poetry version major
#   Increase minor version
poetry version minor
#   Increase bugfix/patch version
poetry version patch
```

## Differences between poetry and pip

* Pip and poetry are package managers
* Poetry has built in project management
* Poetry has a lock file with exact hashed versions
* Poetry provides packaging (building and publishing your code to a package)

## Links

* [Poetry homepage](https://python-poetry.org/) - 20240409

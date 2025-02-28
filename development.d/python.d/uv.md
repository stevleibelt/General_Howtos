# UV

## Kickstart

```bash
# create a project with a new directory name
uv init <string: project_name>
# if you are in your project directory already
uv init

# if not automatically activated, activate the virtual environment
#   as usual
source .venv\scripts\activate

# add a package
uv add requests

# pin the current environment with all dependencies
uv lock
# create a requierements.txt file
uv export --format requirements-txt

# synchronize the environment with the lock- or requirements-file
uv sync

# upgrade all packages from the lock-file
uv lock --upgrade

# upgrade a special package
uv lock --upgrade-package <string: package_name>
```

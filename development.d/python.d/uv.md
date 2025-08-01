# UV

## Kickstart

```bash
# create a project with a new directory name
uv init <string: project_name>
# if you are in your project directory already
#   add `--lib` if your project is a library instead of an application
uv init

# create a dedicated venv
uv venv --python 3.11

# if not automatically activated, activate the virtual environment
#   as usual
source .venv\scripts\activate

# run your python code
# works also without activated virtual environment
uv run main.py

# add a package
uv add requests

# remove a package
uv remove requests

# pin the current environment with all dependencies
uv lock
# check if lockfile is up to date
uv lock --check
# create a requierements.txt file
uv export --format requirements-txt

# synchronize the environment with the lock- or requirements-file
uv sync

# upgrade all packages from the lock-file
uv sync --upgrade
## or
uv lock --upgrade

# upgrade a special package
uv lock --upgrade-package <string: package_name>

# migrate to uv
#   uvx an alternative to `uv tool run`
uvx migrate-to-uv

# install python vesion
uv python install 3.11
# list installed
uv python list
# pin pwd to a version
uv python pin

# switch between versions
uv python use 3.11

# install tools global
uv tool install black
uv tool install buff

# clean cache
uv clean cache

# ignore cached version
uv tool install --reinstall <string: package_name>

# reinstall python
uv python install --reinstall

# show dependecy tree
uv pip tree

# show outdated dependecies
uv pip list --outdated
## or as tree
uv pip tree --outdated
```

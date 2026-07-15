# Command

Execute command or display informations.

```bash
# Returns all locations for an executable named this way
command -v <command>

# Verbose information
command -V <command>

# Execute (builtin?) command
#   or bypass an (bash) alias and execute the real command
command -p <command>

# ref: https://linuxize.com/post/bash-check-if-command-exists/
# Check if command exists
if command -v git >/dev/null 2>&1;
then
  echo "Command exists: git"
else
  echo "Command does not exist: git"
fi

# Capture command path while checking
if GIT_PATH=$(command -v git);
then
  echo "Command exists in path: ${GIT_PATH}"
else
  echo "Command does not exist but is required: git"
  exit 1
fi

# Check multiple commands
MISSING_COMMAND_LIST=()
REQUIRED_COMMAND_LIST=(bash git pacman)

for CMD in "${REQUIRED_COMMAND_LIST[@]}";
do
  if ! command -v "${CMD}" >/dev/null 2>&1;
  then
    missing_commands+=("$cmd")
  fi
done

if ((${#MISSING_COMMAND_LIST[@]} > 0));
then
  echo "At least one required command is missing."
  echo "Dumping missing commands:"

  for CMD in "${MISSING_COMMAND_LIST}";
  then
    echo "   ${CMD}"
  fi
  exit 1
fi
```

## Links

* [Command](https://bash.cyberciti.biz/guide/Command) - 2020-02-19

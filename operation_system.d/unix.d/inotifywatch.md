# INotifyWatch

Needs to be installed generally through `inotify-tools`.

Can be used if [watch](watch.md) is taking to long since this approach is easier for the operating system.

## Usage

```bash
# Setup watchmode for a directory
# Just notify for the first change
inotifywait --recursive /foo/bar
# Notify for each change and forever
inotifywait --monitor --recursive /foo/bar
```

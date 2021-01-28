# Examples

```
#install requirements in podman or docker
#see: https://www.shellhacks.com/pip-install-requirements-exclude-specific-packages/
pip install -r $(grep -v '^ *#\|^pkg1\|^pkg2' requirements.txt | grep .)

#show dependencies in tree structure
#see: https://www.shellhacks.com/pip-show-python-package-dependencies/
pip install pipdeptree
```

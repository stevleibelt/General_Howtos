# Pip

## Kickstart

```bash
#install requirements in podman or docker
#see: https://www.shellhacks.com/pip-install-requirements-exclude-specific-packages/
pip install -r $(grep -v '^ *#\|^pkg1\|^pkg2' requirements.txt | grep .)

#show dependencies in tree structure
#see: https://www.shellhacks.com/pip-show-python-package-dependencies/
pip install pipdeptree
```

## Package version check

```bash
#list outdated packages
pip list -o

#list updateable packages
pip list -u

#upgrade outdated packages
pip list --outdated | gawk -F ' ' 'NR>2{print$1}' | xargs pip install --upgrade
#or install: https://pypi.org/project/pip-upgrade-tool/
pip-upgrade-tool

#want to know more?
pip list --help
```

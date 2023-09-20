# Python

## Kickstart

```bash
#install pip if not available
#run a python module as a script: `python -m <module>`
python -m ensurepip --default-pip
#or install pipenv
pip install --user pipenv

#ensure pip, setuptools and wheel are up to date
python -m pip install --upgrade pip setuptools wheel
#_or
pip install --upgrade pip setuptools wheel

#create a virtual environment
#cd to the project root
##.env is just a name, you can name it like you want it
python -m venv .venv
echo ".venv" >> .gitignre
#use virtual environment
source .env/bin/activate
#upgrade venv
##ref: https://docs.python.org/3/tutorial/venv.html#managing-packages-with-pip
python -m venv --upgrade .venv

#create .env file
echo "FOO=BAR" >> .env
#assuming you have a main.py file
#in your main.py, add the following lines
#   from os import environ
#   ENV_FOO=environ.get('FOO')
#   print(f'FOO: {ENV_FOO}')
echo >>run.sh <<DELIM
#!/bin/bash
####

# ref: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -a
source .env
set +a

source .venv/bin/activate

python main.py
DELIM
#execute run.sh

#or use pipx
#@see:
#   https://packaging.python.org/guides/installing-stand-alone-command-line-tools/
#   https://packaging.python.org/en/latest/guides/installing-using-pip-and-virtual-environments/
#   https://www.youtube.com/watch?v=ohlRbcasPAc
```

## Pip

`pipenv` is pip but on a per project based environment (most times what you want).

```bash
#install package
#latest version
pip install "project"
#specific version
pip install "project==1.1"
#in a specifig range
pip install "project>=1.1,<2"
#compatible version
#@see: https://www.python.org/dev/peps/pep-0440#compatible-release
pip install "project~=1.1.3"
#from a requirement file
pip install -r requirements.txt

#upgrade
pip install --upgrade "project" [--user]
```

## Virtualenv

```bash
#install it
python -m pip install --user virtualenv
```

## Windows

Try to use the python launcher for windows `py`.
The `py.ini` is searched in the currents user `application data` (`%appdata%)` path.
Modules are located in `c:\Python`.

## Link

* [official python documentation](https://docs.python.org/) - 20200923
  * [setup and usage](https://docs.python.org/3/using/index.html) - 20200923
  * [the python tutorial](https://docs.python.org/3/tutorial/index.html) - 20200923
    * [simple variables](https://docs.python.org/3/tutorial/introduction.html) - 20200924
  * [official python howto's](https://docs.python.org/3/howto/index.html) - 20200923
  * [porting python 2 code to python 3](https://docs.python.org/3/howto/pyporting.html) - 20200923
        * [automatic conversion to Py2/3 with future](http://python-future.org/automatic_conversion.html) - 20200924
  * [unit testing framework](https://docs.python.org/3/library/unittest.html) - 20200923
  * [manage dependencies](https://packaging.python.org/tutorials/managing-dependencies/#managing-dependencies) - 20200924
  * [project summeries](https://packaging.python.org/key_projects/) - 20200924
  * virtual environement
    * [nox](https://nox.thea.codes/) - 20200924
    * [pew](https://github.com/berdario/pew) - 20200924
    * [pipenv](https://pipenv.pypa.io/) - 20200924
    * [tox](https://tox.readthedocs.io/) - 20200924
    * [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/) - 20200924
  * [what is new - change log](https://docs.python.org/3/whatsnew/index.html#whatsnew-index) - 20200924
* [official python package index - pypi.org](https://pypi.org/) - 20200924
  * [pip reference guide](https://pip.pypa.io/en/latest/reference/) - 20200924
  * useful packages
    * [coverage](https://pypi.org/project/coverage/) - 20200924
    * [future](http://python-future.org/automatic_conversion.html) - 20200924
* [Python release cycle/versions with support date: devguide.python.org](https://devguide.python.org/versions/) - 20230905
* [Get started using Python on Windows for beginners](https://docs.microsoft.com/en-us/windows/python/beginners) - 20190719
  * [Get started using Python on Windows for scripting and automation](https://docs.microsoft.com/en-us/windows/python/scripting) - 20190719
  * [Get started using Python for web development on Windows](https://docs.microsoft.com/en-us/windows/python/web-frameworks) - 20190719
* [installing packages with pip](https://packaging.python.org/tutorials/installing-packages/) - 20200923
* [packagin python modules with wheels](https://opensource.com/article/23/1/packaging-python-modules-wheels) - 20230127
* [programming tutorial](https://www.programiz.com/python-programming/tutorial) - 20190111
* [python build in methods](https://www.programiz.com/python-programming/methods/built-in) - 20190111
* [python list methods](https://www.programiz.com/python-programming/methods/list) - 20190111
* [>>A dozen ways to learn Python<<](https://opensource.com/article/19/8/dozen-ways-learn-python) - 20190827


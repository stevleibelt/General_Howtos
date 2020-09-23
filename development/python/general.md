# general

## good to know

```
#install pip if not available
python -m ensurepip --default-pip

#ensure pip, setuptools and wheel are up to date
python -m pip install --upgrade pip setuptools wheel

#create a virtual environment
python -v venv <path>
#use virtual environment
virtualenv <path>

#or use pipx
#@see: https://packaging.python.org/guides/installing-stand-alone-command-line-tools/
```

## pip

```
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

## virtualenv

```
#install it
python -m pip install --user virtualenv
```

## windows

Try to use the python launcher for windows `py`.
The `py.ini` is searched in the currents user `application data` (`%appdata%)` path.
Modules are located in `c:\Python`.

# link

* [official python documentation](https://docs.python.org/) - 20200923
    * [setup and usage](https://docs.python.org/3/using/index.html) - 20200923
    * [the python tutorial](https://docs.python.org/3/tutorial/index.html) - 20200923
    * [official python howto's](https://docs.python.org/3/howto/index.html) - 20200923
    * [porting python 2 code to python 3](https://docs.python.org/3/howto/pyporting.html) - 20200923
    * [unit testing framework](https://docs.python.org/3/library/unittest.html) - 20200923
* [installing packages with pip](https://packaging.python.org/tutorials/installing-packages/) - 20200923
* [programming tutorial](https://www.programiz.com/python-programming/tutorial) - 20190111
* [python build in methods](https://www.programiz.com/python-programming/methods/built-in) - 20190111
* [python list methods](https://www.programiz.com/python-programming/methods/list) - 20190111
* [>>A dozen ways to learn Python<<](https://opensource.com/article/19/8/dozen-ways-learn-python) - 20190827

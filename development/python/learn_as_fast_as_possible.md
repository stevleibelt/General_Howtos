# Learn python as fast as possible

```python
#bo: data types
# Int
# Float
# String (>>"hello"<< and >>'hello'<< are equal)
# Bool  #True or False
#eo: data types

#bo: output and input
print('Foo', end=' | ')
print('Hello', 'World') #prints >>Foo | Hello World<<

name = input('> Please input your name: ')
print('You\'ve inserted >>', name, '<<')
#eo: output and input

#bo: variable
hello = 'world' #only allowed to have underscore in a variable name foo_bar is common, fooBar not so
print(hello, 'world')
print(type(hello))
print(hello.upper())
print(hello.count())
print(hello.count('o'))

hello = 3 * hello
print(hello)    #outputs >>hellohellohello<<
print('a' > 'Z')
#eo: variable

#bo: math
x = 9
y = 3.4
result = x + y  #+,-,*,/,%,**,//
result = int(x/y)

print(result)
#eo: math

#bo: if
name = 'artodeto'

if name == 'artodeto':
    printf('bazzline.net')
elif name == 'r2d2':
    printf('almost!')
else:
    print('no bazzline')
#eo: if

#bo: list and tuple
#list - lists are muteable
my_list = [1, True, 'foo']
my_list.append(3)
my_list.extend(['bar', False, 42])
print(my_list.pop())
print(my_list[2])
#copy a list
#my_copy_list=my_list -> my_copy_list would hold only a reference -> same list!
my_copy_list=my_list[:]

#tuple - tuples are immutable
tuple = (0,0,2,3)
#eo: list and tuple

#bo: sets
#sets are way faster than lists
my_set = set()
my_set.add(5)
my_set.add(3)
my_set.remove(5)

print (4 in my_set)
print (5 in my_set)
#eo: sets

#bo: dictonary
my_dict = {'key': 4}
my_dict['foo'] = 5

print('key' in my_dict)
print(my_dict.keys())
print(list(my_dict.keys())

del my_list['key']

for key, value in my_list:
    print(key, value)

for key in my_list:
    print(key, my_list[key])
#eo: dictonary

#bo: for
for iterator in range(10):
    print(iterator)

my_list = [2,3,4,52,23,2]

for iterator in range(len(my_list)):
    print(my_list(iterator))

for iterator, element in enumerate(my_list):
    print(iterator, element)
#eo: for

#bo: while
iterator = 0

while iterator < 10:
    print(iterator)
    ++iterator

while True:
    print(iterator)
    ++iterator
    if iterator > 10
        break

#eo: while

#bo: sliced
#sliced is working on a string and tuples too
x = [1,2,3,4,5,6,7,8]
sliced = x[0:4:2]
print(sliced)

sliced = x[4:2:-1]  #start at position 4, go backwards until you've reached position 2
print(sliced)

sliced = x[::-1]    #reversed list
print(sliced)
#eo: sliced

#bo: functions
#functions are objects
def function_name(x, y, z=None):
    if z:
        return x * y * z, x / y / z
    return x * y, x / y

print(function_name(3, 4))
result_multiplyed, result_devided = function_name(3, 4)

#example for unpack operator / *args and **kwargs
def func(x):
    def func2():
        print(x)

    return func2

print(func(3))
print(func(3)())

def another_func(x, y):
    print(x, y)

x = [1,23,4342,23213]
print(*x)   #* unpacks a list

pairs = [(1,2), (3,4)]
for current_pair in pairs:
    another_func(*pair) #example for *args, because we are unpacking a list/tuple

another_func(**{'y': 2, 'x': 4})    #**kwargs, because we are unpacking a dictonary

def a_crazy_function(*args, **kwargs):
    print(args, kwargs)

a_crazy_function(1,2,34,23,one=1, two=2)
#eo: functions

#bo: scope and global
x = 'artodeto'
y = 'bazzline'

def fun(name):
    global y    #it is there but please don't do it
    x = name

print(x)
func('changed')
print(x)
#eo: scope and global

#bo: exceptions
raise Exception('This is bad')

try:
    x = 7 / 0
except Exception as exception:  #this catches any exception
    print(e)
finally:
    print('Doing some cleanup')
#eo: exceptions

#bo: lambda
x = lambda x, y: x + y

print(x(2, 3))
#eo: lambda

#bo: map and filter
x = [1,2,3,53,2,234,234,2342,343,24]

my_map = map(lambda i: i + 2, x)
print(list(my_map))

my_filtered_list = filter(lambda i: i % 2 ==0, x)   #we can also put in a function
print(list(my_filtered_list))
#eo: map and filter

#bo: f strings
name = 'artodeto'
x = f'hello {6 + 8} {name}'

print(x)
#eo: f strings

#bo: solid class
from abc import ABC, abstractmethod

class EngineInterface(ABC):
    @abstractmethod
    def start(self):
        pass

class FuleEngine(EngineInterface):
    def start(self):
        print("starting engine, using fule")
    
class ElectricEngine(EngineInterface):
    def start(self):
        print("starting engine, using current")

class Car:
    def __init__(self, engine: EngineInterface)
        self.engine = engine
        self._current_speed = 0
        self._is_started = False

    def start(self):
        self.motor.start()
        self._is_started = True

    def speed_up(self, amount: int)
        self._raise_value_error_if_not_started
        self._current_speed += amount

    def break(self, amount: int)
        self._raise_value_error_if_not_started
        self._current_speed -= amount

    def _raise_value_error_if_not_started(self)
        if not self._is_started
            raise ValueError("Car was not started yet.")

class ColoredCar(Car):
    def __init__(self, engine: EngineInterface, color: str)
        super().__init__(engine)
        self.color = color

    def to_string(self)
        return '{} {} {}'.format(self._current_speed, self._is_started, self.color)
    
#eo: solid class
```

## Pip and environments

```bash
#@see: https://blog.gitguardian.com/how-to-handle-secrets-in-python/
cd my_python_project
python -m venv .venv  #-m venv means execute the **m**odule venv
source .venv/bin/activate

echo 'MY_ENVIRONMENT_VARIABLE=5' > .env
```

```python
from dotenv import load_dotenv

import os

load_dotenv()

my_environment_variable = os.getenv('MY_ENVIRONMENT_VARIABLE')
```

## Links

* [Youtube: Python AS Fast as Possible - Learn Python in ~75 Minutes](https://www.youtube.com/watch?v=VchuKL44s6E) - 20230220
* [Youtube: the complete guide to python virtual enviroments](https://www.youtube.com/watch?v=KxvKCSwlUv8) - 20230220


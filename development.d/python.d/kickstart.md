# pure basics

```python
#a comment
"""A
    multiline
    comment."""
'''Another
    multiline
    comment.'''

#output hello world
print("Hello World!")

#type casting
my_string = "123"
my_integer = int(my_string)

#connecting string in the output
print("Hello"," World")    #space between >>Hello<< and >>World<< is added automatically

#assign variable
my_integer  = 4

my_string               = "Hello World"
my_multi_line_string    = """There is no
    foo without a bar"""

#change variable
my_integer += 7  #my_integer + 7
my_integer /= 2  #my_integer / 2

my_empty_list   = []
my_mixed_list   = [1, "Foo", 3.2]   #access second argument, my_mixed_list[2]
                                    #access second last argument, my_mixed_list[-2]

my_tuple    = ["Foo", "Bar"]    #tuples are immutable once they are defined

my_set  = {1,2,3}   #each item is unit

my_dictionary   = {1: 'foo', 2: 'bar', 'foo': 'bar', 'foobar' [1,2,3]}  #access foobar, my_dictionary['foobar']

#unset a variable
delet my_variable

#mathematics
#supported are: +,-,*,/,//,%,**
#// = floor division (will return an integer)
#** = left is raised to the power of right, x^y
```

# more

```python
print(range(2, 6, 2)) #returns an immutable sequence of numbers of 2, 4, 6

my_list = [4, 6, 9]

my_iterator = iter(my_list)

print(next(my_iterator))    #outputs 4
print(next(my_iterator))    #outputs 6

# control flow

## if elif else
my_integer = -1

if my_integer > 0:
    print('positive number')
elif my_integer == 0:
    print('zero')
else:
    print('negative number')

## while loop

max         = 100
my_integer  = 10

while my_integer <= max:
    my_integer + 10

print('Final value is: ',my_integer)

## for loop

my_list = [1,2,3,4,7]
sum     = 0

for value in my_list:
    sum += value

print('Sum is: ',sum)

## break

for foo in "tralala":
    if foo == "a":
        break

## continue

for foo in "tralala":
    if foo == "a":
        continue
    print(foo)

## pass
for foo in "tralala":
    pass    #use it if you want the loop be valid but skip implementing the logic
```

# function and module

```python
# a function

def my_function(argument_one, argument_two):
    print('do something')

    return 'tralala'

my_function(1,'23)

# lambda function

square = lambda x: x ** 2

print(square(3))

# a module
#   each module is in its own file
# put this in your example.py file
def foo(a ,b):
    return a + b

# and now, to use it in another file, load the module
import example

example.foo(7, 42)
```

# file input and output

```python
#second and optional argument
#   r   open file read only
#   w   open file write only
#   x   open file exclusive
#   a   append content at the end of the file
#   t   open in text mode
#   b   open in binary mode
#   +   open for updating (read and write)
file = open("path/to/the/file.md", 'r', encoding = 'utf-8')  # open a file
#read
file.read(3)    #read three data sets
#write into a file
file.write("A line\n")
#closing file handler
file.close()
```

# directory and more

```python
import os

os.getcwd()
os.chdir('path')
os.listdir()
os.mkdir('foo')
os.rename('my_file', 'your_file')
os.remove('your_file')
```

# exception

```python
try:
    #something
except:
    #do the exception   
```

# object

```python
class MyClass:
    "this is the documentation"
    a = 10  #public property

    def __init__(self, foo = 'bar):
        self.foo = foo

    def function(self):
        print('asdasd')

    def getFoo(self):
        return self.foo

class MyExtendedClass(MyClass):

object = MyClass()
```

# Python Code Diagnosis

## Why you should diagnos code

* Create clean code
  * Easy to understand
  * Find problems in the design
* Increase flexibility of your code
  * Easy to extend
  * Implement Open/Closed Principle
* Increase testability of your code
  * Easy to test
  * Have strong and simple testcases ease up changing the code

## Signals for unclean code

* Lots of modules with lots of LOC
* Initializers are multiple lines long
* Example [result.py](https://github.com/sqlalchemy/sqlalchemy/blob/main/lib/sqlalchemy/engine/result.py)
  * Solution could be to separate the code
* Complex, nested logic statements
* Lots of used python magic
  * Creates shorter code
  * But make things harder to understand
* Naming of Variables, Constants, Classes, Methods etc.
  * Add type annotation
  * Supply comment what this things are if it is not that easy to understand
  * Solution could be to change the name to the exact content, to add type annotation or to add a simple but good comment
* **Note** Code readability should not always be the reason to refactore code since readability is a personal thing

## Code flexibility

* Contains lots of import statements
  * Increased dependency
* Deep class hierarchy
* Using lots of mixins
* To many arguments to be passed in a function definition
* Does not respect the law of demeter
* Lots of repeated code segments

## Testability

* Disregard of inversion of control
* No usage of dependency injection
* No usage of abstraction

## Links

* [Code Diagnosis Workshop by ArjanCodes](https://www.arjancodes.com/diagnosis)

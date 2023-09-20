# Clean Code

Clean code is used to describe computer code that is easy to read, understand and maintain.

Is is a set of conventions, standards and practices that wants to ease up read and follow written code.

In essence, clean code is free from complexity, redundancy and other code smells or anti-patterns that make it hard to debug or modify code.

Clean code will help your futher self to maintain your code from the past. This can lead to a reduction of errors and a increase of productivity.

Easy to maintain code base ends up in easy tests.

## Absolut Basics

* Good documentation
* Consistent Formatting
* Well-Organized code base
* Testcases (automatic or manual)

## Tips and Convetions

### Effetivness, efficiency and simplcity

* Effetivness means, that the current scope of code solves exactly one problem
* Efficiency means, that the current scope of code solves the problem with a reasonable amount of ressources
* Simplcity means, that the current scope of code solves the problem that is (subjectively)
  * Each line is easy to understand
  * Functions and variables have names that represent their responsibility
  * Complex parts are covered with the right amount of comment and or unittests
  * It is easy to locate certian features in the codebase
  * It is easy to add or delete features without changing a lot in other areas of the codebase
  * The codebase follows a modular approach with different features separated in components
  * There is reusable code and this can be spotted easy
  * The same architecture, design, syntax, formatting and implementation principles are everywhere in the codebase
  * Bad areas are marked as that and have a roadmap to fix them

### Consistent Case Convetions

```bash
# camelCase
myFoo = 'Bar'

# PascalCase
MyFoo = 'Bar'

# snake_Case
my_foo = 'Bar'

```

### Naming

Neither it is about class-, directory-, function-, module- or variablename, you have to find a sweet spot between short and verbose naming.

A rule of thumb here is, if your name is to long, the containing code is doing to much/the purpose is to big. If needed, inform yourself about the `single responsibility principle`.

The name should describe the main purpose of that thing.

```js
// bad since the user does not know for what this function is good for
function c(a, b) {
  let d = (a + b + 10)
  console.log(d)
  return d
}

// bade since name is to verbose, user does not know the main purpose
function calculateTotalAmountWithAddedTaxRateAndLogTheResultToTheConsole(basePrice, taxRate) {
  const BASE_TAX_AMOUNT = 10
  const totalAmountWithAddedTaxRate = basePrice + taxRate + BASE_TAX_AMOUNT
  console.log(totalAmountWithAddedTaxRate)
}

// better since name tells the purpose
function calculateTotalWithBaseTax(basePrice, taxRate) {
  const BASE_TAX_AMOUNT = 10
  const total = basePrice + taxRate + BASE_TAX_AMOUNT
  console.log(total)
}
```

### Conciseness vs Clarity

Almost equal to naming is the balance between conciseness and clarity. While it is important to keep the code concise, it is equal important to ensure that the code is clear and easy to understand.

The example below is using regex. Writing clear regex is a discipline of kings. Try to either cover the regex with unit tests or a comment containting the expected in's and out's.

```js
// concise function
const countVowels = s => (s.match(/[aeiou]/gi) || []).length;

// more verbose and clearer function
function countVowels(s) {
  const vowelRegex = /[aeiou]/gi;
  const matches = s.match(vowelRegex) || [];
  return matches.length;
}
```

### Clear Code Execution

As long as it is possible, try to have an easy to trace code execution a user can see by having a look to the source code.

Event driven design is complicated to see.

### Create Domains for your Data

Only expose and consume data you need when your data is crossing a module or feature.

This helps clearifing the usage of your code and ease up maintenance.

### Reflect a Feature in your Folder Structure

* Organize your code around features
* Each feature has its own folder
* This draws a clear line for feature internal and external data flow

### Documentation

Documentation is an essential part of writing code. You have to find a perfect spot between maintenance efford and help for a user.

## Tools to use

* Linters
* Code formatters
* 

## Links

* [How to write clean code: freecodecamp.org](https://www.freecodecamp.org/news/how-to-write-clean-code/) - 20230516
* [How to use linters and code formatters in your projects](https://www.freecodecamp.org/news/using-prettier-and-jslint/) - 20230516
* [Introduction to Algorithms Handbook - with JavaScript Examples](https://www.freecodecamp.org/news/introduction-to-algorithms-with-javascript-examples/#algorithmic-complexity) - 20230516


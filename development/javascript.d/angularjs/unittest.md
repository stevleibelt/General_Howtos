# unit tests

## components

* angularjs
* karma
* jasmine
* angular-mocks
* nodejs

### quick guide

* npm install karma --save-dev
* npm install karma-jasmine --save-dev
* npm install karma-chrome-launcher --save-dev
* npm install karma-firefox-launcher --save-dev
* npm install -g karma-cli

## jasmine

### main methods

* describe("name", function) - defines a testsuite
* it("description", function) - defines a test case (arrange (setup), act (execute), assert (validate))
* beforeEach(function) - setup before executing test in that test suite
* afterEach(function) - tear down after executing test in that test suite
* expect(expr).toBe(value) - assert equal
* expect(expr).toBeDefined() - assert is defined
* expect(expr).toBeNull() - assert is null
* expect(expr).... - more available

### example

```javascript
describe('my application test suite', function () {
    beforeEach(module('application'));

    it('should work', function() {
        expect(true).toBeTruthy();
    });
});
```

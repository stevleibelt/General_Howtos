# Migrate from PHP 7.4 to PHP 8.1

## Steps

* Clone your codebase
* Create a migration branch
* Prepare your environment by using [DDEV](https://opensource.com/article/22/12/ddev), [Lando](https://lando.dev/) or [Docksal](https://docksal.io/)
  * `ddev start`
  * `ddev ssh`
* Install mandatory packages
  * `composer require --dev phpcsstandards/phpcsutils:"^1.0@dev"`
  * `composer require --dev phpcompatibility/php-compatibility:dev-develop`
* Check that all is running `phpcs -i`
* Check your code base `phpcs -p . --standard=PHPCompatibility --runtime-set testVersion 8.1 --ignore=*/vendor/*`
* Use [PHP Code Beautifieer and Fixer](https://github.com/squizlabs/PHP_CodeSniffer/wiki/Fixing-Errors-Automatically#using-the-php-code-beautifier-and-fixer) or [Rector](https://github.com/rectorphp/rector)

## Links

* [How to migrate your code from PHP 7.4 to 8.1](https://opensource.com/article/22/12/migrate-php-code) - 20221221


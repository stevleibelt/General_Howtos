# Monolog

## Log to cli

```php
$logger = new \Monolog\Logger('bazzline');
$logger->pushHandler(
    new \Monolog\Handler\StreamHandler(
        'php://stdout',
        \Monolog\Logger::DEBUG
    )
);
```


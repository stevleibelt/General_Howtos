# general

POSIX defines the list of "reliable signals" (standard signals).
17 of 19 can be used inside PHP (excluded are "SIGSTOP" and "SIGKILL").

# list of isgnals

* SIGHUP
* SIGINT
* SIGUSR1
* SIGUSR2
* SIGQUIT
* SIGILL
* SIGABRT
* SIGFPE
* SIGSEGV
* SIGPIPE
* SIGALARM
* SIGTERM
* SIGCHLD
* SIGCONT
* SIGTSTP
* SIGTTIN
* SIGTTOU

# example usage

```php
class Example
{
    private $processExecution = true;

    public function execute()
    {
        declare(ticks = 10);
        pcntl_signal(SIGUP, [$this, 'signalHandler']);
        //... add all you need

        foreach ($this->items as $item) {
            if ($this->processExecution) {
                //... do something
                pcntl_signal_dispatch();
            } else {
                break;
            }
        }
    }

    protected function signalHandler($signal)
    {
        echo 'cought signal: "' . $signal . '"' . PHP_EOL;
    }
}
```

# links

* http://de3.php.net/manual/en/function.pcntl-signal.php

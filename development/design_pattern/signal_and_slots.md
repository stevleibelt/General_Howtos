# terms

## signal

* contains event information

## slot

* listen on a signal

## emit

* sents a signal to all connected slots

# example code

```php
/*
The following example is pretty basic.
A lot of improvments should be made before creating a library out of it like:
    * signal is emiting data and the slot can consume this kind of data
    * a slot is added with a lower or higher priority
    * a slot can stop the signaling
    * SignalHandler which wires signals and slots
To keep the example code small, I decided to write it that easy
*/

class Signal
{
    /** @var string */
    private $name;

    /** @var array */
    private $slots;

    public function __construct($name)
    {
        $this->name     = $name;
        $this->slots    = array();
    }


    /**
     * @param callable|Slot $callable
     * @return $this
     */
    public function connectWithSlot($callable)
    {
        $this->slots[] = $callable;

        return $this;
    }

    public function emit()
    {
        $signals = $this->signals;

        foreach ($signals as $signal) {
            call_user_func($signal);
        }
    }
}

class Slot
{
    public function __invoke()
    {
        //...put in your logic
    }
}

$buttonClick        = new Signal('button clicked');
$changeButtonColor  = new Slot();

$buttonClick->connectWithSlot($changeButtonColor);
$buttonClick->emit();
```

# php components

* [AuraSignal](https://github.com/auraphp/Aura.Signal)
* [kirbysashi SignalSlots](https://github.com/kirbysayshi/SignalSlot)
* [zetacomponents SignalSlot](https://github.com/zetacomponents/SignalSlot)

# relative design patterns

* event driven design
* observer pattern
* signal programming
* delegate

# links

* https://en.wikipedia.org/wiki/Signals_and_slots
* https://de.wikipedia.org/wiki/Signal-Slot-Konzept
* http://www.osebboy.com/blog/signals-and-slots-for-php/
* https://flowframework.readthedocs.org/en/2.0/TheDefinitiveGuide/PartIII/SignalsAndSlots.html
* https://github.com/neos/flow

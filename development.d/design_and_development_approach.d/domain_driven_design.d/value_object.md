# value object

* small objects with small memory footprint
* new instance creation is favored over reference reuse
* equality are checked based on the value (e.g. money)
* are immutable (update is not allowed)
* favored over entities
* checklist, a problem could be modeld as value object if:
    * it measures, quantifies or describes a thing in the domain
    * it can be kept immutable
    * it models a conceptual whole, by composing related attributes as an integral unit
    * it is completely replaceable when the measurement or discription changes
    * it can compared with others through value equality
    * it supplies its collaborators with side effect free behaviour
    * the constructor is simple

## examples

* numbers
* strings
* dates
* time
* persons full name
* currencies
* phone numbers
* postal address

## code

```php
class Money
{
    /** @var int */
    private $amount;
    /** @var Currency */
    private $currency;

    /**
     * @param int $anAmount
     * @param Currency $aCurrency
     */
    public function __construct($anAmount, Curreny $aCurrency)
    {
        $this->setAmount($anAmount);
        $this->setCurrency($aCurrency);
    }

    /**
     * @param Money $aMoney
     * @return Money
     */
    public static function fromMoney(Money $aMoney)
    {
        return new self(
            $aMoney->amount(),
            $aMoney->currency()
        );
    }

    /**
     * @param Currency $aCurrency
     * @return Money
     */
    public static function ofCurrency(Currency $aCurrency)
    {
        return new self(0, $aCurrency);
    }

    /**
     * @param int $amount
     */
    private function setAmount($amount)
    {
        $this->amount = (int) $amount;
    }

    /**
     * @param Currency $currency
     */
    private function setCurrency(Currency $currency)
    {
        $this->currency = $currency;
    }

    /**
     * @param int $anAmount,
     * @return Money
     */
    public function increaseAmount($anAmount)
    {
        return new self(
            $this->amount() + (int) $anAmount,
            $this->currency()
        );
    }

    /**
     * @param Money $aMoney
     * @return Money
     */
    public function add(Money $aMoney)
    {
        if (!$this->currency()->equals($aMoney->currency())) {
            throw new InvalidArgumentException();
        }

        return new self(
            $this->amount() + $aMoney->amount(),
            $this->currency()
        );
    }

    /**
     * @return int
     */
    public function amount()
    {
        return $this->amount;
    }

    /**
     * @return Currency
     */
    public function currency()
    {
        return $this->currency;
    }

    /**
     * @param Money $aMoney
     * @return bool
     */
    public function equals(Money $aMoney)
    {
        return (($this->currency()->equals($aMoney->currency))
            && ($this->amount() === $aMoney->amount()));
    }
}
```

# entity

## identifier

* use a value object for this
* value object is immutable
* value object has a equality operation

## notes

* autoincrement has one big drawback, we couple the identity operation with the underlying storage
* validation must be inside the entity (or inside the used value objects), e.g.:
    * assertNotEmpty($string);
    * assertNotToLong($string);
    * assertNotToShort($string);
    * assertValidFormat($string);
* if validation gets to complex
    * create a validation handler for this
    * implement method validate(ValidationHandler $handler)
* if you want to validate a composition, create a service for that

## examples

* a person (unique by its id)
* an order (unique by its id)

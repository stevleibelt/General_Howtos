# manipulating event "bubbling"

## stopPropagation()

Stops event from bubbling up in the dom.
This will not prevent other handlers on the same element from running.

## preventDefault()

Doesn't execute default attached event handler (like submit on form).

## return false

if you "return false", it is like calling "preventDefault()", "stopPropagation()" and stopping callback execution but it's not the right way.

# links

* http://www.jensbits.com/2012/03/05/stoppropagation-and-preventdefault-jquery-methods/
* http://api.jquery.com/event.stopPropagation/
* http://api.jquery.com/event.preventDefault/
* http://www.w3.org/TR/DOM-Level-2-Events/events.html#Events-flow-cancelation
* http://fuelyourcoding.com/jquery-events-stop-misusing-return-false/

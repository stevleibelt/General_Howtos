#!/bin/javascript
/**
 * taken from: http://www.phpied.com/sleep-in-javascript/
 *
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2013-11-18
 */

function sleep(milliseconds) {
    var start = new Date().getTime();
    for (var i = 0; i < 1e7; i++) {
        if ((new Date().getTime() - start) > milliseconds){
            break;
        }
    }
}

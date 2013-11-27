/**
 * @author stev leibelt <artodeto@arcor.de>
 * @since 2013-11-27
 */

//call function by string on an object
//taken from: http://stackoverflow.com/questions/15278734/call-a-javascript-function-using-string-name
function callObjectFunction(element, functionName, functionArguments)
{
    element[functionName](functionArguments);
}

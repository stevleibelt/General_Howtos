# Iterate Over Selection Of Entries

//link: http://api.jquery.com/jQuery.each/
var listOfItems = jQuery("[data-selector='my-data-selector']");

jQuery.each(listOfItems, function(iterator, item) {
    console.log('iterator');
    console.log(iterator);
    console.log('item');
    console.log(item);
});

# Breat Out

var itemToBreakOut = 3;

jQuery.each(items, function(iterator, item) {
    if (item === itemToBreakOut) {
        return false;
    }
});

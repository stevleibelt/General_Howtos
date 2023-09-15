var page = require('webpage').create();
var url = 'http://www.google.com';
var filename = 'google.png';

page.open(url, function () {
        page.render(filename);
            phantom.exit();
});

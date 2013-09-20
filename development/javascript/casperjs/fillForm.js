var casper = require('casper').create({
    verbose: true,
    logLevel: 'debug',
    viewportSize: {
        width: 2014,
        height: 768
    },
    pageSettings: {
        loadImages: false,
        loadPlugins: false,
        userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4'
    }
    });
var url = 'http://www.google.de';
var filename = 'foo.png';

casper.on('remote.message', function printRemoteMessage(message) {
    this.echo('remote message caught: ' + message);
});

casper.on('page.error', function printErrorMessage(message, trace) {
    this.echo('Page error: ' + message, 'error');
});

casper.start(
    url,
    function loadPageAndFillUpForm() {
        console.log('page "' + this.getCurrentUrl() + '" loaded');

        this.test.assertExists('form#gbqf', 'form found');
        this.fill('form#gbqf', {
            q: 'stev leibelt'
        }, true);
    }
);

casper.thenEvaluate(function evaluateAfterFillUp(){
    console.log('Page title ' + document.title);
});

casper.then(function clickSubmit() {
    this.click('form#gbqf button#gbqfba');
    this.capture(filename);
});

casper.run();

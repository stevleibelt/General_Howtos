var links = [];
var casper = require('casper').create();

function getLinks() {
        var links = document.querySelectorAll('h3.r a');
            return Array.prototype.map.call(links, function getElementAttribute(e) {
                        return e.getAttribute('href')
                            });
}

casper.start('http://google.com/', function fillUpForm() {
        // search for 'casperjs' from google form
            this.fill('form[action="/search"]', { q: 'casperjs' }, true);
});

casper.then(function evaluateForm() {
        // aggregate results for the 'casperjs' search
            links = this.evaluate(getLinks);
                // now search for 'phantomjs' by filling the form again
                    this.fill('form[action="/search"]', { q: 'phantomjs' }, true);
});

casper.then(function concateLinks() {
        // aggregate results for the 'phantomjs' search
            links = links.concat(this.evaluate(getLinks));
});

casper.run(function printResult() {
        // echo results in some pretty fashion
            this.echo(links.length + ' links found:');
                this.echo(' - ' + links.join('\n - ')).exit();
});

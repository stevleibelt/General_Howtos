// taken from http://stackoverflow.com/questions/9246438/how-to-submit-a-form-using-phantomjs

var page = new WebPage();
var testIndex = 0;
var loadInProcess = false;
var url = 'http://www.google.de';

page.onConsoleMessage = function(message) {
    console.log(message);
};

page.onLoadFinished = function() {
    loadInProcess = false;
    console.log('loading finished');
};

var steps = [
    function() {
        //load page with form
        page.open(url);
    },
    function () {
        //fill up form
        page.evaluate(
            function() {
                var inputField = document.getElementById('gbqfq');

                inputField.value='artodeto';
            }
        );
    },
    function () {
        //send form
        page.evaluate(
            function {
                var submitButton = document.getElementById('gbqfba');

                submitButton.submit();
            }
        );
    },
    function () {
        //output
        page.evaluate(
            function() {
                console.log(document.querySelector('html')[0].outerHTML);
            }
        );
    }
];

interval = setInterval(
    function() {
        if (!loadInProgress && typeof steps[testindex] == "function") {
            console.log("step " + (testindex + 1));
            steps[testindex]();
            testindex++;
        }
        if (typeof steps[testindex] != "function") {
            console.log("test complete!");
            phantom.exit();
        }
    },
    50
);

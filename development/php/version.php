# get current version

    echo PHP_VERSION;
    echo PHP_VERSION_ID;
    echo PHP_MAJOR_VERSION;
    echo PHP_MINOR_VERSION;
    echo PHP_RELEASE_VERSION;
    echo PHP_EXTRA_VERSION;
    echo phpversion();

# version compare

    echo version_compare ($versionOne, $versionTwo, $compareOperator);
    echo (version_compare(PHP_VERSION, '5.0.0') >= 0) ? 'i am at least php version 5.0.0' : 'i am not at least a php version 5.0.0';
    echo (version_compare(PHP_VERSION, '5.3.0') >= 0) ? 'i am at least php version 5.3.0' : 'i am not at least a php version 5.3.0';
    echo (version_compare(PHP_VERSION, '5.0.0', '<')) ? 'i must be php 4 dude' : 'i am php version 5 or higher';

# links

* http://php.net/manual/en/function.phpversion.php
* http://www.php.net/manual/en/reserved.constants.php#reserved.constants.core
* http://www.php.net/manual/en/function.version-compare.php

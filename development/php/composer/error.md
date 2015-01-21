# requires ext-iconv * -> the requested PHP extension iconv is missing from your system.

* check if there is a "/usr/share/php-composer/php.ini" file
* if so, add "extension=iconv.so" into the "[PHP]" section

# open_basedir restriction in effect. File(/usr/bin/composer) is not within the allowed path(s)

* open /etc/php/php.ini
* search for "open_basedir"
* add ":/usr/bin/composer"

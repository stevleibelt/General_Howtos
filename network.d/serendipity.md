# Serendipity Blog System

## How To

### How To reset a Password

```bash
# ref: https://board.s9y.org/viewtopic.php?p=10453182#p10453182
# Create following file in your public directory close by your index.php
cat > reset_my_password.php <<DELIM
<?php
    $username = "your-username";
    $password = "your-new-password";

    include 'serendipity_config.inc.php';

    echo serendipity_db_query("UPDATE {$serendipity['dbPrefix']}authors SET password = '" . serendipity_hash($password) . "', hashtype=2 WHERE username = '" . serendipity_db_escape_string($username) . "'");
    echo "Password changed.";
?>
DELIM
# Call this file via curl or your webbrowser
# https://your.blog.tld/reset_my_password.php
# rm reset_my_password.php
```

## Links

* [Official forum: s9y.org](https://board.s9y.org/)
* [Official homepage and documentation: s9y.org](https://docs.s9y.org/)

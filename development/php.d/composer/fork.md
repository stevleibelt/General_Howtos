# using a fork

Following is in your composer.json.

    "require": {
        "original-user/project": "dev-master"
    }

You are forking this. Add following lines to your composer.json

    "repositories": [
        {
            "type": "vcs",
            "url": "https://github.com/your-name/project"
        }
    ]

Do not change the require part ("original-user/project")!

# links

* http://www.phpntips.com/composer-how-to-use-your-github-forks-2013-01/

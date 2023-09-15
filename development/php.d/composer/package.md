# add a git repository

    "repositories:" {
        "<name>": {
            "type": "package",
            "package": {
                "name": "<vendor>/<name">,
                "version": "dev",
                "source": {
                    "type": "git",
                    "url": "https://github.com/<vendor>/<name>",
                    "reference": "<commit hash>"
                }
            }
        }
    }

* http://eugenemorgan.com/adding-a-random-github-repository-to-your-project-using-composer/
* https://getcomposer.org/doc/05-repositories.md#loading-a-package-from-a-vcs-repository

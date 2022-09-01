# Selenium

## Setup

```bash
#create project working directory
mkdir -p ~/projects/headless-selenium

#create and activte virtual environment
#it is assumend, that python exists in version 3
cd ~/projects/headless-selenium
python -m venv venv
. venv/bin/activate

#install selenium
pip install selenium webdriver_manager
pip show selenium | grep -i version
#> Version: 4.4.3
pip show webdriver_manager | grep -i version
#> Version: 3.8.3

#install headless firefox (GeckoDriver)
#download it
#  https://github.com/mozilla/geckodriver/releases
sudo tar -xvf ~/Downloads/geckodriver-*.tar.gz -C /usr/local/bin/
geckodriver --version
#> geckodriver 0.31.0
```

## Basic selenium skript

```python
#!/usr/bin/python
####
# Usage
#   python run-headless-firefox.py
####
# run-headless-firefox.py
# by www.ShellHacks.com
####

from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options

firefox_options = Options()
firefox_options.add_argument("--headless")
driver = webdriver.Chrome(service=Service('/usr/local/bin/geckodriver'),
                          options=firefox_options)
driver.get('https://www.bazzline.net')
print(driver.page_source.encode("utf-8"))
driver.quit()
```

## Links

* [Run Selenium Headless – Chrome | Firefox (Python)](https://www.shellhacks.com/run-selenium-headless-chrome-firefox-python/) - 20220831

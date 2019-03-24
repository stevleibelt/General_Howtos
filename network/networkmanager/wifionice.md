# general

* connect to ESSID "WIFIonICE"
* open the url "http://www.wifionice.de/de?login"

# error handling

## could not resolve host

* remove all bridged interfaces from docker or anything similar operating in the 172.18.0.0/16 networkt

# useful script if you want to automate stuff

```
#!/bin/bash
####
# @since 2019-03-24
# @see https://keans.de/wifionice.html
# @author stev leibelt <artodeto@bazzline.net>
####

interface=$1
status=$2

#essid when script should be called
ESSID="WIFIonICE"

#interface for which script should be called
#adapt it to your interface
INTERFACE="wlp3s0"

#url login page
URL="http://www.wifionice.de/de"

if [ "${interface}" == "${INTERFACE}" ];
then
	essid=$(iwgetid -r)

	if [ "${essid}" == "${ESSID}" ];
	then
		case "${status}" in
			up)
				logger Login to WIFI on ICE
				curl --silent ${URL}?login > /dev/null
				;;
			down)
				logger Logout from WIFI on ICE
				curl --silent ${URL}?logout > /dev/null
				;;
		esac
	fi
fi
```

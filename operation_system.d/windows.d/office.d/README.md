# Microsoft Office

## Automate installation

### How to create your own office installation admin / configuration file

This was tested with Microsoft Office 2013.

* cd to the path where the office `setup.exe` is
* open a terminal/cmd/powershell
* enter `setup.exe /admin`
* us the upcoming dialog to configure your installation

### How to install office with your own office installation admin / configuration file

* cd to the path where the office `setup.exe` is
* open a terminal/cmd/powershell
* enter `setup.exe /adminfile <your_configuration_file_name>.msp`

* [Overview of the Office Deployment Tool - Reference page - microsoft](https://docs.microsoft.com/en-us/deployoffice/overview-of-the-office-2016-deployment-tool) - 2020-02-17
* [Office Deployment Tool](https://www.microsoft.com/en-us/download/details.aspx?id=49117) - 2020-02-17
* [Office Online Konfigurationswerkzeug](https://config.office.com/) - 2020-02-17

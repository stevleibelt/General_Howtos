# Creality Ender 3

This guide is using octoprint and klipper.
Each 3d printing model file needs to be calculated per printer into the gcode.

## Install Klipper

* ssh into the pi
* `git clone https://github.com/KevinOConnor/klipper`
* `./klipper/scripts/install-octopi.sh`
* `cd klipper`
* `make menuconfig`
* select `Enable extra low-level configuration options`
    * Micro-Controller Architecture: `Atmega AVR`
    * Processor model: `atmega1284p`
    * Processor speed: `16 MHz`
* Select `Yes` to store the configuration
* `make`
* `sudo service klipper stop`
* identify destination `ls /dev/serial/by-id/*`
* `make flash FLASH_DEVICE=<result of previous command to find the destination>`
* `sudo service klipper start`
* `cp config/printer-creality-ender3-2018.cfg ~/printer.cfg`
* open `~/printer.cfg` and replace `serial` with the result of `ls /dev/serial/by-id/*`
* Open Octoprint
    * Configuration -> Serial Connection -> Additional serial ports: `/tmp/printer`
    * Configuration -> Serial Connection -> Tab: Behaviour: `Cancel any ongoing prints but stay connected to the printer`
    * Connect to printer
    * Install plugin `OctoKlipper`

## Leveling

* Mount your bed
* Turn of the Motors
* Heat up the bed
* Rotate the leveling wheels counter-clockwise to lower the bed two to three turns
* Move the hot end to the left front
* Unscrew the stop button
* Put a piece of paper on top of the bed
* Level down the hot end until the nose almost touches the paper
* Tighten the stop button to this level
* Rotate the leveling wheel until the paper makes a little noise when you move it
* Continue with the three other corners
* Recheck the leveled wheels after you've finished it

# Links

* [Install Klipper on Ender 3 with BLTouch support](https://3dprintbeginner.com/install-klipper-on-ender-3/) - 20200212
* [Ender 3 Bed Leveling: All You Need to Know](https://www.creality3dofficial.com/blogs/news/ender-3-bed-leveling) - 20191021
* [Klipper homepage](https://www.klipper3d.org/Features.html) - 20200823
* [Ender 3 Level Test](https://www.thingiverse.com/thing:2987803) - 20180703
* [25 Best Creality Ender 3 Upgrades you can buy and print](https://makershop.co/creality-ender-3-upgrades/) - 20200730
* Slicer Software - used to calculate project files to gcode
    * [Ultimaker Cura](https://ultimaker.com/software/ultimaker-cura) - 20208323
    * [Slic3r - Open source 3D printing toolbox](https://slic3r.org/] - 20200823
    * [Prusa Slicer](https://www.prusa3d.com/prusaslicer/) - 20200823

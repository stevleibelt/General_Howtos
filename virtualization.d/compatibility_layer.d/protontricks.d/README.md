# Protontricks

## Examples

```bash
# Need GeneralsOnlineZH?
# Assumed you have protontricks installed
# Assumed you have steam installed
# Assumed you have command and conquer zero hour installed with english language
# Assumed you have started command and conquer zero hour at least once before
#   Installing generals online
# Assumed you want to install generals online
# Assumed you've downloaded the GeneralsOnline.exe from
#   ref: https://www.playgenerals.online/
protontricks-launch --appid 2732960 "/path/to/the/GeneralsOnline_setup_*.exe"
# Choose "/path/to/steam/steamapps/common/Command & Conquer Generals - Zero Hour/Generals.exe"
# Assumed you want to start your game with mangohud
mangohud protontricks-launch --appid 2732960 "/path/to/steam/steamapps/common/Command & Conquer Generals - Zero Hour/GeneralsOnlineZH.exe"
# Click on Multiplayer->Online and login via steam
# pofta buna

# Need generals evolution?
# Assumed you have protontricks installed
# Assumed you have steam installed
# Assumed you have command and conquer red alert 3 installed with english language
# Assumed you have started command and conquer red alert 3 at least once before
#   Installing generals evolution
# Assumed you want to install generals evolution
# Assumed you've downloaded the GenEvo
#   ref: https://www.moddb.com/mods/command-and-conquer-generals-evolution
protontricks-launch --appid 17480 "/path/to/the/CCO_TacticusInstaller*.exe"
cp -a GenEvo "/path/to/steam/steamapps/common/Command and Conquere Red Alert 3/"
# Assumed you want to start your game with mangohud
mangohud protontricks-launch --appid 17480 "/path/to/steam/steamapps/common/Command and Conquer Red Alert 3/GenEvo/GenEvoLauncher.exe"
```

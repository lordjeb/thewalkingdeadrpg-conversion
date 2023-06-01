The is a script that does a very minor conversion of the [alienrpg](https://github.com/pwatson100/alienrpg) FoundryVTT system to allow it to be used for The Walking Dead RPG (TWDRPG). This is a stop-gap measure that will be deprecated once the official Foundry support for TWDRPG is released. It doesn't attempt to make any kind of a full conversion, rather it just replaces a few of the strings from Alien with those that make sense for TWD.

## What it does

1. Makes a copy of the alienrpg system and names it thewalkingdeadrpg-fromalien
1. Changes archetype names
1. Changes skill names
1. Changes a some headers on character sheets
1. Changes the maximum health calculation to always equal 3

## How you use it

1. Make sure you have the alienrpg game system installed.
1. Make sure your Foundry data is located in `%LOCALAPPDATA%\FoundryVTT\Data` (the default location). If it is not, you can pass this as the -FoundryDataPath parameter to the script.
1. Make sure that you have Powershell 7 installed, which is NOT the one built into Windows as of this writing. The script uses some json parsing capabilities that are not available in Powershell 5 and earlier.
1. Execute the script from powershell command prompt.
1. Enjoy!

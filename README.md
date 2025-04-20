# discord_auto_update
This script can be used to install the newest version of Discord or update the already existing installation.
The script checks the currently newest version and compares it's number with the already installed one. If they don't match, or no version is present (no discord installed), the .deb package is downloaded. 
Unfortunately, since discord does not share hash sums or any other ways to validate the package, only simple inegrity check of the package was implemented, but it is what it is :/.

Note: This script is compatible only with Debian-based distributions, as it relies on a .deb package.

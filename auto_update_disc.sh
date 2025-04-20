#!/bin/bash

header="$(curl -sI "https://discord.com/api/download?platform=linux&format=deb")"
newest_version="$(echo "$header" | perl -nle 'print $& if /(?<=discord-)(\.|\d+)+(?=\.deb)/')"

if [ -n "$newest_version" ]; then

    echo "the newest version is:$newest_version"
    current_version="$(dpkg-query --show discord | cut -f2)"

    if [[ "$current_version" == "$newest_version" ]]; then
        echo "newest version already installed"
        else :
            curl -s -o new_discord_version.deb "$(echo "$header" | grep -o  -e 'https://.*.deb')"

            # since discord does not provide checksums, this mediocre integrity check is only thing i can do :(
            if [[ "$(dpkg-deb --contents new_discord_version.deb 2>&1 | head -n 1 | grep -o  error)" == "error" ]]; then
                echo "package failed integrity check, aborting."
                else :
                    echo "package passed integrity check, installing"
                    dpkg -i "new_discord_version.deb"
                    echo "new version was successfully installed"
                    rm "new_discord_version.deb"
            fi
    fi 
else :
    echo "error: unable to check the new version"
fi
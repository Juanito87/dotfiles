#!/bin/bash
# Calling config files
# shellcheck disable=1090
for f in "$HOME"/.shell_config/*;
do
    if [ -d "$f" ]
        then
            for g in "$f"/*; do source "$g"; done
        else
            source "$f";
    fi
done

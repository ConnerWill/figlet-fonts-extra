#!/usr/bin/env bash

inputtext="${*}"
[[ -z "${inputtext}" ]] && inputtext="${USERNAME}"
[[ -z "${inputtext}" ]] && inputtext="Sample !"

for file in src/*.flf
do
    echo "\n\n════════════════════════════"     "$file"   "════════════════════════════\n\n"
    figlet -f "$file" -w 2400 "${inputtext}"
done

#!/usr/bin/env bash

figlet_path=$(command -v figlet)
[[ -n "${figlet_path}" ]]                                    \
  || printf "\e[0;1;38;5;196mCannot find 'figlet' in PATH\n" \
  || exit 1

inputtext="${*}"
[[ -z "${inputtext}" ]] && inputtext="${USERNAME}"
[[ -z "${inputtext}" ]] && inputtext="Sample !"

printf "\n══════════ Preview(above) | Name(below) ══════════\n\n" && sleep 1

for file in src/*.flf
do
  fontname=$(basename --suffix=.flf "${file}")
  ${figlet_path} -f "$file" -w 2400 "${inputtext}" \
    && printf "%s\n\n\n" "${fontname}"
    # && printf "\n\n══════════ %s ══════════\n\n" "${fontname}"
done

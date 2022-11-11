#!/usr/bin/env bash

toilet_path=$(command -v toilet)
[[ -n "${toilet_path}" ]]                                    \
  || printf "\e[0;1;38;5;196mCannot find 'toilet' in PATH\n" \
  || exit 1

inputtext="${*}"
[[ -z "${inputtext}" ]] && inputtext="${USERNAME}"
[[ -z "${inputtext}" ]] && inputtext="Sample !"

printf "\n\e[0;1;38;5;87m══════════ \e[0;1;38;5;201mPreview\e[0;1;38;5;93m(above) \e[0;1;38;5;87m| \e[0;1;38;5;201mName\e[0;1;38;5;93m(below) \e[0;1;38;5;87m══════════\e[0m\n\n"  && sleep 1

for file in src/*.flf; do
  fontname=$(basename --suffix=.flf "${file}")
    ${toilet_path}    \
      --gay           \
      --filter border \
      --filter crop   \
      --font "$file"  \
      --width 2400    \
      "${inputtext}" 2>/dev/null \
    && printf "\e[0;1;38;5;201m%s\e[0m\n\n"  "${fontname}"
done

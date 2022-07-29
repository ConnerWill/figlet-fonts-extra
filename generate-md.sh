#!/usr/bin/env zsh

inputtext="${1}"
filename="${2}"
[[ -z "${filename}" ]] && filename="preview.md"
[[ -z "${inputtext}" ]] && inputtext="${USERNAME}"
[[ -z "${inputtext}" ]] && inputtext="Sample !"


printf '# Figlet Fonts Preview

*Click to expand font previews*

<details>

'

unset footerarray; typeset -a footerarray
for file in src/*.flf
do
    filebasename=$(basename "${file}")
    echo
    echo "### [$filebasename]($filebasename)"
    echo
    echo '<div align="center">'
    echo
    echo
    echo '```shell'
    if figlet -f "$file" -w 2400 "${inputtext}" >/dev/null 2>&1;then
        figlet -f "$file" -w 2400 "${inputtext}"
        footerarray+=( "${file}" )
    fi
    echo '```'
    echo
    echo '</div>'
    echo
done
printf '

</details>


*Expand links to fonts*
'
echo
echo '<!-- FOOT NOTES -->'
echo '<details>'
echo
for file in "${footerarray[@]}"
do
    filebasename=$(basename "${file}")
    echo "[$filebasename]($file)"
    echo
done
echo
echo '</details>' 
echo
echo
echo '```shell'
echo
cat ${0} 
echo '```'

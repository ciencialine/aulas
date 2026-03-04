#!/bin/bash

source build-contrib.sh

#source .issues-token.sh

curl -s -L \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${TOKEN_ISSUES}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/ciencialine/caderno-aberto/issues?state=open&assignee=ciencialine" | \
jq -c '.[] | {number, body}'  | while read -r item; do
  number=$(echo "$item" | jq -r '.number')
  body=$(echo "$item" | jq -r '.body')

  readarray -d '' valores < <(echo "$body" | awk '
  /^### / {
      if (val != "") {
          gsub(/^[ \t\n]+|[ \t\n]+$/, "", val)
          printf "%s\0", val
      }
      val = ""
      next
  }
  {
      val = val (val=="" ? "" : "\n") $0
  }
  END {
      if (val != "") {
          gsub(/^[ \t\n]+|[ \t\n]+$/, "", val)
          printf "%s\0", val
      }
  }')

  echo "Contribuição #${number}"
  aplicaTemplate \
    "${valores[0]//$'\n'/ }" \
    "${valores[1]//$'\n'/ }" \
    "${valores[2]//$'\n'/ }" \
    "${valores[3]//$'\n'/ }" \
    "${valores[4]//$'\n'/ }" \
    "${valores[5]//$'\n'/ }" \
    "${valores[6]//$'\n'/ }" \
    "${valores[7]//$'\n'/ }" \
    "${valores[8]//$'\n'/ }"

done

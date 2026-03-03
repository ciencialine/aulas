#!/bin/bash

source formataNome.sh

function mkdocsYML() {
  local ANO="$1"
  local MATERIA="$2"
  yq -i "(.nav[] | select(has(\"${ANO}\"))[\"${ANO}\"][].${MATERIA}) = []" mkdocs.yml
  DIR_ANO="${ANO//[^0-9]/}"
  DIR_MATERIA=$(formataNome "${MATERIA}")
  find "./docs/${DIR_ANO}/${DIR_MATERIA}" -mindepth 1 -maxdepth 1 -type f | sort | while read caminho_caderno; do
    ARQUIVO_CADERNO="${DIR_ANO}/${DIR_MATERIA}/$(basename "${caminho_caderno}")"
    echo "ARQUIVO_CADERNO: ${ARQUIVO_CADERNO}"
    yq -i "(.nav[] | select(has(\"${ANO}\"))[\"${ANO}\"][].${MATERIA}) += [\"${ARQUIVO_CADERNO}\"]" mkdocs.yml
  done
}

mkdocsYML "6o ano" "Ciências"
mkdocsYML "9o ano" "Ciências"

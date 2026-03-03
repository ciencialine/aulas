#!/bin/bash
source formataNome.sh

aplicaTemplate() {
  local ANO=$1
  local DISCIPLINA=$2
  local TITULO_RESUMIDO=$3
  local TITULO_NBLM=$4
  local LINK_NBLM=$5
  local UNIDADE_TEMATICA_BNCC=$6
  local OBJ_CONHECIMENTO_BNCC=$7
  local COD_BNCC=$8
  local HABILIDADE_BNCC=$9

  local DIR_ANO="${ANO//[^0-9]/}"
  local DIR_DISCIPLINA=$(formataNome "${DISCIPLINA}")
  local MD_TITULO_RESUMIDO=$(formataNome "${TITULO_RESUMIDO}")
  local TEMPLATE="template.md"

  sed \
    -e "s|%TITULO_RESUMIDO%|${TITULO_RESUMIDO}|g" \
    -e "s|%TITULO_NBLM%|${TITULO_NBLM}|g" \
    -e "s|%LINK_NBLM%|${LINK_NBLM}|g" \
    -e "s|%UNIDADE_TEMATICA_BNCC%|${UNIDADE_TEMATICA_BNCC}|g" \
    -e "s|%OBJ_CONHECIMENTO_BNCC%|${OBJ_CONHECIMENTO_BNCC}|g" \
    -e "s|%COD_BNCC%|${COD_BNCC}|g" \
    -e "s|%HABILIDADE_BNCC%|${HABILIDADE_BNCC}|g" \
    "${TEMPLATE}" > "docs/${DIR_ANO}/${DIR_DISCIPLINA}/${MD_TITULO_RESUMIDO}.md"
}

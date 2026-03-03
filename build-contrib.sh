#!/bin/bash
source formataNome.sh

ANO="6o ano"
DISCIPLINA="Ciências"
TITULO_RESUMIDO="Ciclo das rochas e Eras Geológicas"
TITULO_NBLM="Ciclo das Rochas e Eras Geológicas: transformações da Litosfera"
LINK_NBLM="https://notebooklm.google.com/notebook/5c0f324a-6311-458e-ac76-adc95e6b750a"
UNIDADE_TEMATICA_BNCC="Terra e Universo"
OBJ_CONHECIMENTO_BNCC="Forma, estrutura e movimentos da Terra"
COD_BNCC="EF06CI12"
HABILIDADE_BNCC="Identificar diferentes tipos de rocha, relacionando a formação de fósseis a rochas sedimentares em diferentes períodos geológicos."

aplicaTemplate() {

  local TITULO_RESUMIDO=$1
  local  TITULO_NBLM=$2
  local LINK_NBLM=$3
  local  UNIDADE_TEMATICA_BNCC=$4
  local OBJ_CONHECIMENTO_BNCC=$5
  local   COD_BNCC=$6
  local  HABILIDADE_BNCC=$7

  local  TEMPLATE="template.md"

  sed \
    -e "s|%TITULO_RESUMIDO%|${TITULO_RESUMIDO}|g" \
    -e "s|%TITULO_NBLM%|${TITULO_NBLM}|g" \
    -e "s|%LINK_NBLM%|${LINK_NBLM}|g" \
    -e "s|%UNIDADE_TEMATICA_BNCC%|${UNIDADE_TEMATICA_BNCC}|g" \
    -e "s|%OBJ_CONHECIMENTO_BNCC%|${OBJ_CONHECIMENTO_BNCC}|g" \
    -e "s|%COD_BNCC%|${COD_BNCC}|g" \
    -e "s|%HABILIDADE_BNCC%|${HABILIDADE_BNCC}|g" \
    "${TEMPLATE}"
}

DIR_ANO="${ANO//[^0-9]/}"
DIR_DISCIPLINA=$(formataNome "${DISCIPLINA}")
MD_TITULO_RESUMIDO=$(formataNome "${TITULO_RESUMIDO}")

aplicaTemplate \
  "${TITULO_RESUMIDO}" \
  "${TITULO_NBLM}" \
  "${LINK_NBLM}" \
  "${UNIDADE_TEMATICA_BNCC}" \
  "${OBJ_CONHECIMENTO_BNCC}" \
  "${COD_BNCC}" \
  "${HABILIDADE_BNCC}" > "docs/${DIR_ANO}/${DIR_DISCIPLINA}/${MD_TITULO_RESUMIDO}.md"

#!/bin/bash
formataNome() {
  echo "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | iconv -f utf8 -t ascii//TRANSLIT \
    | tr ' ' '-'
}
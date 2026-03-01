#!/bin/bash
export NO_MKDOCS_2_WARNING=1
python3 -m venv .mkdocs-venv
source .mkdocs-venv/bin/activate
pip install -r requirements.txt
mkdocs serve --livereload

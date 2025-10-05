#!/bin/bash

for file in "$INSTALL_PATH"/scripts/*.sh; do
  if [[ "$(basename "$file")" != "index.sh" ]]; then
    source "$file"
  fi
done

#!/bin/bash
# This script installs all extensions listed in ~/.vscode-extensions for
# VS Code. Requires the code command is available and the existence of
# ~/.vscode-extensions

set -euo pipefail

EXTENSIONS=$(cat ~/.vscode-extensions)

for ext in $EXTENSIONS; do
	code --install-extension $ext
done

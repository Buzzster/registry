#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

set -x

cd generated || exit 1

git config user.name "Buzzster ROA bot"
git config user.email "support@buzzster.co.uk"
git add .
git commit -m "Generated at $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
git push

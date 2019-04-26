#!/bin/bash

set -o errexit

if [[ $EUID -ne 0 ]]; then
   echo "This Script Must Be Executed As Root (Use sudo Or Type sudo su And Then Execute The Scrypt)" 1>&2
   exit 1
fi

cd "$(dirname "${BASH_SOURCE[0]}")/.."
repo_path="$PWD"

for service in systemd/*.service; do
  sed "s:/home/${USER}/Switch:${repo_path}:g" "$service" \
    > "/lib/systemd/system/$(basename "$service")"
done

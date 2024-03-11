#!/bin/sh
echo -ne '\033c\033]0;fuis-moi\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/fuis-moi.x86_64" "$@"

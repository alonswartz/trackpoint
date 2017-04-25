#!/bin/bash -e

fatal() { echo "FATAL [$(basename $0)]: $@" 1>&2; exit 1; }

usage() {
cat<<EOF
Syntax: $(basename $0) file.md
Parse markdown and output table-of-contents
EOF
exit 1
}

src=$1
[ -n "$src" ] || usage
[ -e "$src" ] || fatal "$src does not exist"

grep "^#" $src | while read heading; do
    indent=$(echo "$heading" | sed "s/^\#\#\(\#*\).*/\1/" | sed "s/\#/    /g")
    title=$(echo "$heading" | sed "s/^\#* //")
    link=$(echo "$title" | tr '[A-Z] ' '[a-z]-' | tr -d ':?,.()')
    echo "$indent- [$title](#$link)"
done

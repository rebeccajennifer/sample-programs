#!/bin/bash
#_______________________________________________________________________
# This program scans the current directory and prints all contents of
# each file into a single file.
#_______________________________________________________________________

OUTPUT="all-files.txt"
DIR="${1:-.}"

# Clear/create output file
> "$OUTPUT"

echo '//______________________________________________________________________' >> "$OUTPUT"
echo "// tree: "${PWD##*/}"" >> "$OUTPUT"
echo '//______________________________________________________________________' >> "$OUTPUT"

tree    >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Iterate through files in directory
find "$DIR" -type f | while read -r file; do
    echo '//______________________________________________________________________' >> "$OUTPUT"
    echo "// $file" >> "$OUTPUT"
    echo '//______________________________________________________________________' >> "$OUTPUT"

    cat "$file" >> "$OUTPUT"

    echo "" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
done

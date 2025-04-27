#!/bin/bash

# Check if at least two arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 [-n] [-v] <search-term> <filename>"
    exit 1
fi

# Initialize variables
search_term=""
file=""
include_vn_v=false
invert_match=false

# Process flags (supporting `-n`, `-v`, and combined `-nv` or `-vn`)
while [[ "$1" == -* ]]; do
    case "$1" in
        *n*) include_vn_v=true ;;  # Enables `-n`
        *v*) invert_match=true ;;  # Enables `-v`
        *) echo "Error: Unknown option '$1'"; exit 1 ;;
    esac
    shift
done

# Ensure the script does not proceed with empty search terms
if [ -z "$1" ]; then
    echo "Error: Missing search term!"
    exit 1
else
    search_term="$1"
fi

# Ensure the script does not proceed with missing file
if [ -z "$2" ]; then
    echo "Error: Missing filename!"
    exit 1
else
    file="$2"
fi

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found!"
    exit 1
fi

# Warn if `-v` is used but no search term is provided
if [ "$invert_match" == true ] && [ -z "$search_term" ]; then
    echo "Error: You used the -v flag but did not provide a search string!"
    exit 1
fi

# Build the grep command
grep_cmd="grep -i -n"  # Added "-i" for case insensitive searching
[ "$invert_match" == true ] && grep_cmd="$grep_cmd -v"
[ "$include_vn_v" == true ] && search_term="$search_term|vn|v"

# Execute the search
$grep_cmd -E "$search_term" "$file"

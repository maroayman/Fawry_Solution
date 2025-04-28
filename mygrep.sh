#!/bin/bash

# Function to display help message
print_usage() {
    echo "Usage: $0 [-n] [-v] <search-term> <filename>"
    echo "Options:"
    echo "  -n  Show line numbers in results"
    echo "  -v  Invert match (show lines that do NOT contain the search term)"
    echo "  --help  Show this help message and exit"
    exit 0
}

# Initialize variables
include_line_numbers=false
invert_match=false

# ------------------------------
# Process options using getopts
# ------------------------------
while getopts "nv" opt; do
    case $opt in
        n) include_line_numbers=true ;;
        v) invert_match=true ;;
        *) print_usage ;;  # Handle invalid options
    esac
done

# Shift processed options
shift $((OPTIND - 1))

# Check for help flag
if [[ "$1" == "--help" ]]; then
    print_usage
fi

# Ensure search term and filename are provided
if [ $# -lt 2 ]; then
    echo "Error: Missing search term or filename!"
    echo "Use --help for usage information."
    exit 1
fi

search_term="$1"
file="$2"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: File '$file' not found!"
    exit 1
fi

# Build the grep command
grep_cmd="grep -i"
[ "$invert_match" == true ] && grep_cmd="$grep_cmd -v"
[ "$include_line_numbers" == true ] && grep_cmd="$grep_cmd -n"

# Execute the search
$grep_cmd -E "$search_term" "$file"

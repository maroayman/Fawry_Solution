# Link to the Task
https://fawry-internship.notion.site/Internship-Task-1e273781f94380f4a4d0ffb4d5de9f23#1e273781f943808899c5cb31b6b67b47

# Search Script

This Bash script allows users to search for a term within a file, with options to display line numbers and invert matches.

## Usage

```sh
./search_script.sh [-n] [-v] <search-term> <filename>
```

## Options 
- -n : Show line numbers in the search results.
- -v : Invert match—display lines that do not contain the 
- --help: Display usage information and exit.

## Examples
### Basic Search :
```sh
./search_script.sh "error" logs.txt
```
### Search with line numbers:
```sh
./search_script.sh "error" logs.txt
```
### Search with line numbers:
```sh
./search_script.sh "error" logs.txt
```
### Invert Match:
```sh
./search_script.sh -v "success" report.txt
  ```

### Invert Match & Search with line numbers:
```sh
./search_script.sh -nv "success" report.txt
./search_script.sh -vn "success" report.txt
```
### Help Menu:
```sh
./search_script.sh --help
```


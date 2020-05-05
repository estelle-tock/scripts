#!/bin/sh
set -eo pipefail

#############################################
# Helper methods that are used in main body #
#############################################

cleanUpOnExit() {
  # clean up temp dir
  rm -rf temp
}

exitIfDirectory() {
  if [ -d "$1" ]
  then
    log r  "Unable to process $file. It is a directory."
    log r  "Please put all files to be merged in a single zip or folder."
    cleanUpOnExit && exit 1
  fi
}

checkInput() {
  read -p 'is this OpenTable ERB? y or n: ' open_table_erb
  if [ "$open_table_erb" == "n" ]; then
    read -p 'include headers in merge? y or n: ' include_headers
  fi
  
  if [[ "$include_headers" != "y" && "$include_headers" != "n" ]]; then
    log r  "invalid option. Please enter y or n."
    exit 1
  fi
}

checkHeaders() {
  # check if the headers all match
  log  "checking if headers of all files match... (checking first lines)"
  i=1;
  previous_headers=``

  for file in temp/*; do
    log  "file #$i: $file"

    exitIfDirectory "$file"

    if [ "$i" -eq 1 ]; then
        previous_headers=$(head -n 1 "$file")
    else
      current_headers=$(head -n 1 "$file")
      if [ "$previous_headers" != "$current_headers" ]; then
        if [ "$include_headers" == "n" ]; then
          log r  "headers in one of the files does not match others"
          log r  "check $file"
          cleanUpOnExit && exit 1
        else
          log r "File \"$file\" HEADERS DO NOT MATCH other files."
          read -p "DO YOU WANT TO CONTINUE? y or n " continue_with_mismatch_headers
          if [ "$continue_with_mismatch_headers" == "n" ]; then
            cleanUpOnExit && exit 1
          fi
        fi
      fi
      previous_headers="$current_headers"
    fi
    ((i++))
  done
  
  if [ -z "$continue_with_mismatch_headers" ]; then
    log g "SUCCESS all headers match!"
  fi
}

concat() {
  log  "merging files into one..."
  local i=1

  log  "removing output file $1 if already exist..."
  [ -e file ] && rm "$1"

  if [ "$include_first_line" == "y" ]; then
    cat temp/* > "$1"
  else
    for file in temp/*; do
      exitIfDirectory "$file"

      if [ "$i" -eq 1 ]; then
        log  "copying file $file with headers into $1..."
        cp "$file" "$1"
      else
        log  "copying file $file without headers into $1..."
        (tail -n +2 "$file"; echo '') >> "$1"
      fi
      ((i++))
    done
  fi

}

peekIntoFolder() {
  case "$1" in
  *.gz | *.tgz | *.zip)
    log  "unzipping zip file $1 into temp folder... "
    unzip $1 -d temp

    log  "removing auto-generated __MACOSX as a result of unzipping folder..."
    rm -rf temp/__MACOSX
        ;;
  *.csv | *.txt)
    log r  "input is a file. Please put file in folder..."
    exit 1
    ;;
  *)
    log  "saving files in $1 in temp folder..."
    cp -r $1 temp
    ;;
  esac
}

convertWindowsToUnix(){
  log  "converting file to unix..."
  cp "$1" "temp.csv" && rm "$1"
  tr -d '\15\32' < temp.csv  > "$1"
  rm temp.csv
}

log() {
  local code="\033["
  local flag=""
  case "$1" in
    red    |  r) color="${code}1;31m"; flag="[ERROR] ";;
    green  |  g) color="${code}1;32m"; flag="[SUCCESS] ";;
    *) local text="[LOG] $1"
  esac
  [ -z "$text" ] && local text="$color$flag$2${code}0m"
  printf "$text\n"
}

###################################
# Main body of script starts here #
###################################

main() {

  if [ $# -lt 2 ]; then
    log r  "enter valid input arguments."
    log r  "./concat.sh <path_to_zip_file> <name_of_destination_file>"
    exit 1
  fi

  checkInput "$1" "$2"

  log  "source zip file: $1"
  log  "destination: $2"

  log  "creating destination file $2..."
  touch "$2"

  log  "peeking into folder..."
  peekIntoFolder "$1"

  # go into folder
  log  "files in folder..."
  ls temp

  if [ "$open_table_erb" == "n" ]; then
    checkHeaders
  fi

  concat "$2"
  convertWindowsToUnix "$2"

  log g  "Successfully merged files into $2" && echo ""

  echo   "---------------- SUMMARY -----------------"
  echo  "New file saved to: $2"
  echo  "Total Number of files in folder: $(ls temp | wc -l)"
  echo  "Total number of lines from all files: \n $(find ./temp/* -name '*' -print0 | xargs -0 wc -l)"
  echo  "Number of lines in new file: $(wc -l "$2")"
  echo  "Hint: number of lines should match before and after."
  echo  ""
  echo   "----------------- DATA --------------------"
  echo  "$(head -n2 "$2")" && echo  "" && echo  "skipping to two last lines..." && echo  "" && tail -n2 "$2"
  echo   "-------------------------------------------"

  cleanUpOnExit && exit 1
}

# if bash is runnable as a library & calling main
[[ "$0" == "$BASH_SOURCE" ]] && main "$@"

#################
# End of script #
#################

#!/bin/bash
set -e

SCRIPT_NAME=$(basename "$0")
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Display usage instructions if the script is called with the incorrect arguments
function usage() {
  echo -e "${RED}Error: You need to provide a minimum of 1 argument - a commit message and/or ./filename(s)${NC}"
  echo -e "${YELLOW}Usage: ./$SCRIPT_NAME [-e] 'commit message'"
  echo -e "       ./$SCRIPT_NAME 'commit message' [filename1] [filename2] ..."
  echo -e "       ./$SCRIPT_NAME 'commit message' .${NC}"
  exit 1
}

# New function for running a command and handling its error
function run() {
  ERR_MSG=$("$@" 2>&1) || { echo -e "${RED}${ERR_MSG}${NC}"; exit 1; }
}

# Check if a file exists
function file_check() {
  if [ ! -f "$1" ]; then
    echo -e "${RED}Error: File $1 does not exist${NC}"
    exit 1
  fi
}

# Check if in a git directory
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo -e "${RED}Error: Not in a Git repository.${RED}"
  exit 1
fi

# Check if there are at least 1 argument
if [ $# -lt 1 ]; then
  usage
fi

# Check if the first argument is '-e' (for staging only modified files)
STAGE_MODIFIED=false
if [ "$1" = "-e" ]; then
  STAGE_MODIFIED=true
  shift
fi

# Get commit message and filenames
MESSAGE="$1"
shift
if [ $# -eq 0 ]; then
  ADD_ALL=true
elif [ "$1" = "." ]; then
  ADD_ALL=true
  shift
else
  ADD_ALL=false
  FILES=("$@")  # Enclose the array in double quotes to handle filenames with spaces correctly
fi

# Check if the -e option is used and no additional filenames are provided
if [ "$STAGE_MODIFIED" = true ] && [ "$ADD_ALL" = false ]; then
  echo -e "${RED}Error: When using the -e option, you can't specify additional filenames.${NC}"
  usage
fi

# Check if each file exists and perform Git operations
if [ "$ADD_ALL" = false ]; then
  for file in "${FILES[@]}"; do
    file_check "$file"
  done
fi

# Perform Git operations - add files, commit with message, and push
function git_ops() {  

  run git pull

  if [ "$ADD_ALL" = true ]; then
    if [ "$STAGE_MODIFIED" = true ]; then
      run git add -u  # Stage only modified files
    else
      run git add .   # Stage all changes
    fi
  else
    for file in "${FILES[@]}"; do
      run git add "$file"
    done
  fi
  run git commit -m "$MESSAGE"
  run git push
}

git_ops

echo -e "${GREEN}Successfully added, committed, and pushed files to Git with message:${NC} ${YELLOW}$MESSAGE${NC}"
exit 0

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
  echo -e "${YELLOW}Usage: ./$SCRIPT_NAME 'commit message'"
  echo -e "       ./$SCRIPT_NAME 'commit message' [filename1] [filename2] ..."
  echo -e "       ./$SCRIPT_NAME 'commit message' .${NC}"
  exit 1
}

# Check if a file exists
function file_check() {
  if [ ! -f "$1" ]; then
    echo -e "${RED}Error: File $1 does not exist${NC}"
    exit 1
  fi
}

# Check if there are at least 1 arguments
if [ $# -lt 1 ]; then
  usage
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

# Check if each file exists and perform Git operations
if [ "$ADD_ALL" = false ]; then
  for file in "${FILES[@]}"; do
    file_check "$file"
  done
fi


# Perform Git operations - add files, commit with message, and push
function git_ops() {
  if [ "$ADD_ALL" = true ]; then
    git add .
  else
    for file in "${FILES[@]}"; do
      git add "$file"
    done
  fi
  git commit -m "$MESSAGE"
  git push
}


git_ops

echo "${GREEN} Successfully added, committed, and pushed files to Git with message: ${NC} ${YELLOW} $MESSAGE ${NC}"
exit 0

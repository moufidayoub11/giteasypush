#!/bin/bash
set -e

SCRIPT_NAME=$(basename "$0")

# Display usage instructions if the script is called with the incorrect arguments
function usage() {
  echo "Error: You need to provide a minimum of 2 arguments - a commit message and one or more filenames"
  echo "Usage: ./$SCRIPT_NAME 'commit message' [filename1] [filename2] ..."
  echo "       ./$SCRIPT_NAME 'commit message' ."
  echo "       ./$SCRIPT_NAME 'commit message'"
  exit 1
}

# Check if a file exists
function file_check() {
  if [ ! -f "$1" ]; then
    echo "Error: File $1 does not exist"
    exit 1
  fi
}

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

git_ops

echo "Successfully added, committed, and pushed files to Git with message: $MESSAGE"
exit 0

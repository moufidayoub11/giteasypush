#!/bin/bash
set -e

SCRIPT_NAME=$(basename "$0")

function usage() {
  echo "Error: You need to provide a minimum of 2 arguments - a commit message and one or more filenames"
  echo "Usage: ./$SCRIPT_NAME 'commit message' filename1 [filename2] ..."
  exit 1
}

function file_check() {
  if [ ! -f "$1" ]; then
    echo "Error: File $1 does not exist"
    exit 1
  fi
}

function git_ops() {
  for file in "${FILES[@]}"; do
    git add "$file"
  done
  git commit -m "$MESSAGE"
  git push
}

# Check if there are at least 2 arguments
if [ $# -lt 2 ]; then
  usage
fi

# Get commit message and filenames
MESSAGE="$1"
shift
FILES=($@)

# Check if each file exists and perform git operations
for file in "${FILES[@]}"; do
  file_check "$file"
done

git_ops

echo "Successfully added, committed, and pushed files to git with message: $MESSAGE"
exit 0

#!/bin/bash
set -e

SCRIPT_NAME=$(basename "$0")

function usage() {
  echo "Error: You need to provide exactly 2 arguments - a filename and a commit message"
  echo "Usage: ./$SCRIPT_NAME filename 'commit message'"
  exit 1
}

function file_check() {
  if [ ! -f "$1" ]; then
    echo "Error: File $1 does not exist"
    exit 1
  fi
}

function git_ops() {
  git add "$1"
  git commit -m "$2"
  git push
}

# Check if there are exactly 2 arguments
if [ $# -ne 2 ]; then
  usage
fi

# Check if file exists and perform git operations
file_check "$1"
git_ops "$1" "$2"

echo "Successfully added, committed, and pushed $1 to git with message: $2"
exit 0

#!/bin/bash

# Check if a directory is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Assign the provided directory to a variable
PARENT_DIR="$1"

# Check if the provided argument is a directory
if [ ! -d "$PARENT_DIR" ]; then
  echo "Error: $PARENT_DIR is not a directory."
  exit 1
fi

# Change to the parent directory
cd "$PARENT_DIR" || exit

# Loop through all child directories
for dir in */; do
  # Check if it is a directory
  if [ -d "$dir" ]; then
    # Remove the trailing slash from the directory name
    dir_name="${dir%/}"
    # Create a zip file with the same name as the directory
    tar cvzf "${dir_name}.tar.gz" "$dir_name"
    echo "Zipped $dir_name to ${dir_name}.tar.gz"
  fi
done

echo "All child directories zipped successfully."
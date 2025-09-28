#!/bin/bash
# list_logs.sh


SOURCE="./sample"
DEST="./logs_archive"


# Exit immediately if a command fails
set -e

# Create destination directory if it doesn't exist
if [ ! -d "$DEST" ]; then
    mkdir -p "$DEST"
fi

# Copy only .log files
find "$SOURCE" -type f -name "*.log" -exec cp {} "$DEST" \;

# Count copied logs
Count=$(find "$DEST" -type f -name "*.log" | wc -l)
echo "Archived $COUNT log file(s) from '$SOURCE' to '$DEST'"
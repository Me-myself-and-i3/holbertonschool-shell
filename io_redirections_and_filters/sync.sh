#!/bin/bash

# Source and destination directories
SOURCE="/path/to/holbertonschool-shell/io_redirections_and_filters"
DESTINATION="/tmp"

# Initial synchronization
rsync -av --delete "$SOURCE/" "$DESTINATION/"

# Monitor the source directory for changes and synchronize
while inotifywait -r -e modify,create,delete,move "$SOURCE"; do
    rsync -av --delete "$SOURCE/" "$DESTINATION/"
done

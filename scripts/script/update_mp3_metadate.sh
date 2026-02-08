#!/bin/bash

# Usage:
# ./update_mp3_metadata.sh "input.mp3" "Artist Name" "Song Title" "Album Name"

# Check for correct number of arguments
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <input_file> <artist> <title> <album>"
    exit 1
fi

INPUT_FILE="$1"
ARTIST="$2"
TITLE="$3"
ALBUM="$4"

# Generate a temporary filename
TEMP_FILE="${INPUT_FILE%.*}_temp.${INPUT_FILE##*.}"

# Update metadata using ffmpeg
ffmpeg -i "$INPUT_FILE" \
    -metadata artist="$ARTIST" \
    -metadata title="$TITLE" \
    -metadata album="$ALBUM" \
    -codec copy "$TEMP_FILE"

# Check if ffmpeg succeeded
if [ $? -eq 0 ]; then
    # Replace original file with updated file
    mv -f "$TEMP_FILE" "$INPUT_FILE"
    echo "Metadata updated successfully for '$INPUT_FILE'."
else
    echo "FFmpeg failed. Temporary file saved as '$TEMP_FILE'."
fi

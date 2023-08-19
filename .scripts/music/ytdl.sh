#!/bin/sh

# Ensure a URL is provided
if [ -z "$1" ]; then
    echo "Error: No URL provided."
    exit 1
fi

rm /home/synchronous/.music-not-tagged/tmp.mp3

url="$1"

# Download and extract audio
if ! yt-dlp --extract-audio --audio-format mp3 --output '/home/synchronous/.music-not-tagged/tmp.mp3' "$url"; then
    echo "Error downloading or extracting audio."
    exit 1
fi

# Import into beets
if ! /usr/bin/beet import -s /home/synchronous/.music-not-tagged/tmp.mp3 <<< "A"; then
    echo "Error importing into beets."
    exit 1
fi

# Remove all entries from beets
if ! /usr/bin/beet ls | /usr/bin/beet remove -f; then
    echo "Error removing entries from beets."
    exit 1
fi

# Extract title and artist
title=$(ffprobe -show_format -v error /home/synchronous/.music-not-tagged/tmp.mp3 | grep -m 1 'TAG:title' | cut -d= -f2)
artist=$(ffprobe -show_format -v error /home/synchronous/.music-not-tagged/tmp.mp3 | grep -m 1 'TAG:artist' | cut -d= -f2)

# Ensure title and artist were extracted successfully
if [ -z "$title" ] || [ -z "$artist" ]; then
    echo "Error extracting title or artist."
    exit 1
fi

echo "\n"

# Echo title and artist
echo "$artist"
echo "$title"


# ...

# Construct new filename
t="$artist - $title"
destination="/home/synchronous/music/$t.mp3"

# Check if file already exists
if [ -f "$destination" ]; then
    echo "Error: A file with the same name already exists."
    exit 1
fi

# Ask user for confirmation
echo "Would you like to continue and move the file into the music directory? (y/n)"
read -r confirmation

# Exit if user doesn't confirm
if [ "$confirmation" != "y" ]; then
    echo "Operation aborted by the user."
    exit 1
fi

# Move the file
if ! mv /home/synchronous/.music-not-tagged/tmp.mp3 "$destination"; then
    echo "Error moving the file."
    exit 1
fi

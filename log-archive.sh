#!/bin/bash

# ============================
# Log Archive & Unarchive Tool
# ============================

ARCHIVE_DIR="$HOME/log_archives"
mkdir -p "$ARCHIVE_DIR"

show_usage() {
    echo "Usage:"
    echo "  $0 archive <log-directory>      # Archive logs"
    echo "  $0 unarchive <archive-file> <destination-dir>  # Extract logs"
    exit 1
}

# Check if user gave at least one argument
if [ $# -lt 1 ]; then
    show_usage
fi

MODE="$1"

# ===== ARCHIVE MODE =====
if [ "$MODE" == "archive" ]; then
    if [ -z "$2" ]; then
        echo "Error: Please provide a log directory."
        show_usage
    fi

    LOG_DIR="$2"

    if [ ! -d "$LOG_DIR" ]; then
        echo "Error: Directory '$LOG_DIR' does not exist."
        exit 1
    fi

    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
    ARCHIVE_PATH="$ARCHIVE_DIR/$ARCHIVE_NAME"

    tar -czf "$ARCHIVE_PATH" -C "$LOG_DIR" .

    if [ $? -eq 0 ]; then
        echo "Logs archived to: $ARCHIVE_PATH"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Created archive: $ARCHIVE_NAME" >> "$ARCHIVE_DIR/archive_log.txt"
        echo "Archive logged in: $ARCHIVE_DIR/archive_log.txt"
    else
        echo "Error: Failed to create archive."
        exit 1
    fi

# ===== UNARCHIVE MODE =====
elif [ "$MODE" == "unarchive" ]; then
    if [ -z "$2" ] || [ -z "$3" ]; then
        echo "Error: Please provide the archive file and destination directory."
        show_usage
    fi

    ARCHIVE_FILE="$2"
    DEST_DIR="$3"

    if [ ! -f "$ARCHIVE_FILE" ]; then
        echo "Error: File '$ARCHIVE_FILE' does not exist."
        exit 1
    fi

    mkdir -p "$DEST_DIR"
    tar -xzf "$ARCHIVE_FILE" -C "$DEST_DIR"

    if [ $? -eq 0 ]; then
        echo "Archive extracted to: $DEST_DIR"
    else
        echo "Error: Failed to extract archive."
        exit 1
    fi

# ===== INVALID MODE =====
else
    echo "Error: Unknown mode '$MODE'"
    show_usage
fi

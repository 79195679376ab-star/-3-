#!/bin/bash

# Параметры
SOURCE_DIR="$HOME/"
BACKUP_DIR="/tmp/backup"
LOG_FILE="/var/log/backup.log"


# Дата для лога
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Выполняем rsync
rsync -avh --checksum --exclude=".*" "$SOURCE_DIR" "$BACKUP_DIR" >> "$LOG_FILE" 2>&1

# Проверяем результат
if [ $? -eq 0 ]; then
    echo "[$TIMESTAMP] Backup SUCCESSFUL" >> "$LOG_FILE"
else
    echo "[$TIMESTAMP] Backup FAILED" >> "$LOG_FILE"
fi

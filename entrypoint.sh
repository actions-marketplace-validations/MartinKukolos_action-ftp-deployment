#!/bin/bash

echo "==== INPUTS ===="
echo "TARGET SERVER: $INPUT_FTP_SERVER"
echo "USER: $INPUT_FTP_USER"
echo "SOURCE_DIRECTORY: $INPUT_SOURCE_FOLDER"

echo "==== SOURCE DATA ===="
ls -la "$INPUT_SOURCE_FOLDER"

echo "==== UPLOADING TO SERVER ===="
lftp -c "open -u $INPUT_FTP_USER,$INPUT_FTP_PASSWORD $INPUT_FTP_SERVER; set ssl:verify-certificate no; set ftp:ssl-allow no; mirror -R $INPUT_SOURCE_FOLDER ."

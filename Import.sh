#!/bin/sh

### Assign variables
HOST=""
USERNAME=""
RWD=""
LCD=""
MCD=""

### Collect and download files from the remote host
echo "Connecting to $USERNAME@$HOST and downloading files from $RWD to $LCD recursively"
sftp "$USERNAME@$HOST" <<EOF
lcd $LCD
mget -r $RWD/*
bye
EOF
echo "Done downloading!"

## Unpack the collected files on disk..
echo "Checking if there are files to be extracted/processed.."
if test "$(ls -A "$LCD")"; then
    echo "There are files in $LCD, going to recursively extract 'em.."
    find $LCD/ -name -type f '*.rar' -execdir unrar r {} \;

    echo "Removing any sample .mkv files.."
    find $LCD/ -name -type f '*sample*.mkv' -execdir rm -f {} \;

    echo "Done extracting video files, now move extracted .mkv files.."
    find $LCD/ -name -type f '*.mkv' -execdir mv {} $MCD \;

    echo "DONE!"
else
    echo "No files where found in $LCD, quitting this job"
fi

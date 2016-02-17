#!/bin/sh

#Load config file
source params.conf

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
if test "$(ls -A $LCD)"; then
    ## Find parted .rar files and extract them using unrar
    echo "There are files in $LCD, going to recursively extract 'em.."
    find $LCD/ -name '*.rar' -execdir unrar e {} \;

    ## Remove any extracted sample mkv files
    echo "Removing any sample .mkv files.."
    find $LCD/ -name '*sample*.mkv' -execdir rm -f {} \;

    ## Move the files into your media directory (manual postprocessing folder for example)
    echo "Done extracting video files, now move extracted .mkv files.."
    find $LCD/ -name '*.mkv' -execdir mv {} $MCD \;

    ## Remove the incomming directory
    echo "Lets clear the $LCD directory.. "
    rm -rf $LCD/*

    ## Clear the remote directory
    echo "Clearing $USERNAME@$HOST/$RWD.."
    ssh "$USERNAME@$HOST" "rm -rf $RWD/*"
    echo "done"
else
    echo "No files where found in $LCD, quitting this job"
fi

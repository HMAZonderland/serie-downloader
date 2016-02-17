###What?
Downloads files (rared media files) using sftp from a remote host to a local directory. Extracts them using unrar (please install!) and moves them to you're media directory. After that the local download and the remote source directory is cleared. 

#####Requirements
- sftp
- ssh
- ssh-key
- unrar

#####Variables
Please set these variables by creating a file named `params.conf`. You can view `params.sample.conf` as sample. 

- `HOST` - hostname of the remote host
- `USERNAME` - username to login with
- `RWD` - remote directory, to fetch files from
- `LWD` - local directory, where to put the files
- `MWD` - media directory, where your media files are downloaded to

If you wish to use user directory, please use `$HOME` i.e:
```bash
LWD="$HOME/Downloads/MyRemoteHost"
```

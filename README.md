###What?
Downloads files (rared media files) using sftp from a remote host to a local directory. Extracts them using unrar (please install!) and moves them to you're media directory.

#####Requirements
- sftp
- ssh-key
- unrar

#####Variables
- `HOST` - hostname of the remote host
- `USERNAME` - username to login with
- `RWD` - remote directory, to fetch files from
- `LWD` - local directory, where to put the files
- `MWD` - media directory, where your media files are downloaded to

If you wish to use user directory, please use `$HOME` i.e:
```bash
LWD="$HOME/Downloads/MyRemoteHost"
```

# drone-rsync-download
This is a pure Bash [Drone](https://github.com/drone/drone) >= 0.5 to download file from remote host with rsync.

This is based on [drone-rsync](https://github.com/Drillster/drone-rsync) plugin, then modified to download from remote host, rather then put to remote hosts.

For more infomation on how to use the, please look drone-rsync's [document](https://github.com/Drillster/drone-rsync/blob/master/DOCS.md). Only parameters metioned in [Usage](#usage) section are different from [drone-rsync](https://github.com/Drillster/drone-rsync).

# Docker
Build the docker image by running:

```bash
docker build --rm=true -t gamerslouis/drone-rsync-download .
```

# Usage 
The following parameters are used to configure the plugin:
+ **host** - hostname or ip-address of the remote machine
- **port** - port to connect to on the remote machine, defaults to `22`
- **source** - source folder on remote machine to synchronize from
- **target** - target to synchronize to, defaults to `./`

### Execute from the working directory (assuming you have an SSH server running on 127.0.0.1:22):

```bash
docker run --rm \
  -e PLUGIN_KEY=$(cat some-private-key) \
  -e PLUGIN_HOST="127.0.0.1" \
  -e PLUGIN_PORTS="22" \
  -e PLUGIN_SOURCE="./" \
  -e PLUGIN_PRESCRIPT="echo \"Prescript Done!\"" \
  -e PLUGIN_SCRIPT="echo \"Postscript Done!\"" \
  -e PLUGIN_ARGS="--blocking-io" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  gamerslouis/drone-rsync-download
```

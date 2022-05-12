# oci-omg [WiP]
This repo is for creating an OCI compliant container image of the _o-must-gather app_ found here: https://github.com/kxr/o-must-gather

This container image provides an environment run the `omg` command within this container.
Additionally this tool also allows to use the `oc` command within the container. Just for convenience reasons.

_If you run **docker** instead of **podman** just replace `podman` with `docker` in all the commands._

## Build
`podman build -t omg:latest .` 

## Run via Podman
`podman run -it --rm -v /path/to/must-gather.local.6450500953211053680:/home/omg/must-gather:Z omg:latest` 

## Create BASH alias function
`mkdir ${HOME}/.bashrc.d` 

```
cat << EOF > ${HOME}/.bashrc.d/omg.sh
#!/bin/bash

function omg() {
    filename=$(readlink -f $1)
    podman run -ti --rm -v "${filename}":/home/omg/must-gather:Z omg:latest
}

EOF
```

`chmod +x ${HOME}/.bashrc.d/omg.sh`

`source ${HOME}/.bashrc.d/omg.sh`

## Run via BASH CLI using alias function
`omg /PATH/TO/must-gather-directory` 

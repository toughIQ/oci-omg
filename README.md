# oci-omg [WiP]
This repo is for creating an OCI compliant container image of the _o-must-gather app_ found here: https://github.com/kxr/o-must-gather

**Note:** Currently using **V1** of o-must-gather, since _V2_ is still _work in progress_.

This container image provides an environment to run the `omg` command within this container.
Additionally this tool also allows to use the `oc` command within the container. Just for convenience reasons.

_If you run **docker** instead of **podman** just replace `podman` with `docker` in all the commands._

## Build
`podman build -t quay.io/toughiq/omg:latest .` 

If you build locally, you can set the image name to your likings.



## Run via Podman
`podman run -it --rm -v /path/to/must-gather.local.6450507246821680:/home/omg/must-gather:Z quay.io/toughiq/omg:latest` 

This inits the container with your desired must-gather directory and places you afterwards in the container and you can start doing your _omg/oc_ work.

## Create BASH alias function
`mkdir ${HOME}/.bashrc.d` 

```
cat << EOF > ${HOME}/.bashrc.d/omg.sh
#!/bin/bash

function omg() {
    filename=$(readlink -f $1)
    podman run -ti --rm -v "${filename}":/home/omg/must-gather:Z quay.io/toughiq/omg:latest
}

EOF
```

`source ${HOME}/.bashrc.d/omg.sh`

## Run via BASH CLI using alias function
`omg /PATH/TO/must-gather-directory` 

This inits the container with your desired must-gather directory and places you afterwards in the container and you can start doing your _omg/oc_ work.

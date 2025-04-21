#!/bin/bash

echo "entrypoint.sh start"

if [ -n $FORCE_REINSTALL ]; then
  echo "Forcing reinstall"
  find "${HOME}/stable-diffusion-webui/" -o -prune -exec rm -rvf -- {} +
  cp -rv /stable-diffusion-webui-base/* /stable-diffusion-webui-base/.* "${HOME}/stable-diffusion-webui/"
elif [ ! -d "${HOME}/stable-diffusion-webui" ]; then
  echo "Copying stable-diffusion-webui repo to persistent directory"
  cp -rv /stable-diffusion-webui-base/* /stable-diffusion-webui-base/.* "${HOME}/stable-diffusion-webui/"
else
  echo "Found existing stable-diffusion-webui directory, using that"
fi

exec "${HOME}/stable-diffusion-webui/webui.sh" "$@"

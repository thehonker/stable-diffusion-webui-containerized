#!/bin/bash

echo "entrypoint.sh start"

if [ -n $FORCE_REINSTALL ]; then
  echo "Forcing reinstall"
  find "${HOME}/stable-diffusion-webui/" -exec rm -rvf -- {} +
  cp -av /stable-diffusion-webui-base/. "${HOME}/stable-diffusion-webui/"
elif [ ! -d "${HOME}/stable-diffusion-webui/.git" ]; then
  echo "Copying stable-diffusion-webui repo to persistent directory"
  cp -av /stable-diffusion-webui-base/. "${HOME}/stable-diffusion-webui/"
else
  echo "Found existing stable-diffusion-webui directory, using that"
fi

exec "${HOME}/stable-diffusion-webui/webui.sh" "$@"

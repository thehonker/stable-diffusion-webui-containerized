#!/bin/bash

echo "entrypoint.sh start"

if [ -n $FORCE_REINSTALL ]; then
  echo "Forcing reinstall"
  find "${HOME}/stable-diffusion-webui/" -o -prune -exec rm -rvf -- {} +
  find /stable-diffusion-webui-base/ -o -prune -exec cp -t "${HOME}/stable-diffusion-webui/" {} +
elif [ ! -d "${HOME}/stable-diffusion-webui/.git" ]; then
  echo "Copying stable-diffusion-webui repo to persistent directory"
  find /stable-diffusion-webui-base/ -o -prune -exec cp -t "${HOME}/stable-diffusion-webui/" {} + 
else
  echo "Found existing stable-diffusion-webui directory, using that"
fi

exec "${HOME}/stable-diffusion-webui/webui.sh" "$@"

#!/bin/bash


set -e

if [ "$1" = 'tworavens' ]; then

  if [ -z "$DATAVERSE_URL" ]; then
	echo You must specify DATAVERSE_URL
	exit 1
  fi

  echo "Starting TwoRavens with DATAVERSE_URL=$DATAVERSE_URL"
  /start-tworavens
  httpd -DFOREGROUND
else
    exec "$@"
fi

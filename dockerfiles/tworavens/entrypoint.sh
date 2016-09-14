#!/bin/bash


set -e

if [ "$1" = 'tworavens' ]; then

  TIMEOUT=30


  if [ -n "$DATAVERSE_NODE_PORT" ]; then 
    EXTERNAL_IP=$(curl http://api.ipify.org)
  	DATAVERSE_PORT=$DATAVERSE_NODE_PORT
  	DATAVERSE_URL="http://$EXTERNAL_IP:$DATAVERSE_PORT"
    TWORAVENS_PORT=$TWORAVENS_NODE_PORT
    TWORAVENS_URL="http://$EXTERNAL_IP:$TWORAVENS_PORT"
  elif [ -n "$DATAVERSE_PORT_8080_TCP_PORT" ]; then 
  	DATAVERSE_URL="https://$NDSLABS_STACK-dataverse.$NDSLABS_DOMAIN"
  	TWORAVENS_URL="https://$NDSLABS_STACK-tworavens.$NDSLABS_DOMAIN"
  fi

  export DATAVERSE_URL;
  export TWORAVENS_URL;

  echo $DATAVERSE_URL
  echo $TWORAVENS_URL

  echo "Starting TwoRavens"
  /start-tworavens
  httpd -DFOREGROUND
else
    exec "$@"
fi

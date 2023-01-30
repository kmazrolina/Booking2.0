#!/bin/sh

# config
port=1433
password=zaq1@WSX
container_name=sql1

# pull latest image
docker pull mcr.microsoft.com/mssql/server:2022-latest

# start container
sudo docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=$password" \
  -p $port:1433 --name $container_name --hostname $container_name \
  -d \
  mcr.microsoft.com/mssql/server:2022-latest

# vscode connection:
# - host.docker.internal,1433
# - <database name>
# - ...

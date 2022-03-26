# steamcmd-satisfactory-game-server
A Satisfactory Dedicated Game Server based on SteamCMD

## Ports 
- `7777 UDP`
  - Satisfactory Game Server
- `15000 UDP`
  - Beacon Port
- `15777 UDP`
  - Query Port

## Volumes
- /home/steam/satisfactoryserver
  - Mount this volume to persist the server game files storage

## Updates
Restarting the docker container will update the game server automatically through Steam.

## Server Configuration
Here are some environment variables you may pass into the container that will allow you to change the game server's settings. Please open an issue if you'd like more added.


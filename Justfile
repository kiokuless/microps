container_id := `docker ps | grep 'microps-microps-builder' | awk '{print $1}'`

alias a := attach

stop:
    docker compose stop

attach:
    docker exec -it {{container_id}} /bin/bash

up:
    docker compose up

reset: 
    @just stop
    @just up

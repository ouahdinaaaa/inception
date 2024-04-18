#!/bin/bash

# Supprimer tous les conteneurs Docker en cours d'exécution
echo "Suppression de tous les conteneurs Docker en cours d'exécution..."
docker rm -f $(docker ps -a -q)

# Supprimer toutes les images Docker
echo "Suppression de toutes les images Docker..."
docker rmi -f $(docker images -q)

# Supprimer le cache Docker
echo "Suppression du cache Docker..."
docker system prune -a --volumes

# Supprimer tous les volumes Docker
echo "Suppression de tous les volumes Docker..."
docker volume rm $(docker volume ls -q)
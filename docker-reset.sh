#!/bin/bash

# Supprimer tous les conteneurs Docker en cours d'exécution
echo "Suppression de tous les conteneurs Docker en cours d'exécution..."
sudo docker rm -f $(sudo docker ps -a -q)

# Supprimer toutes les images Docker
echo "Suppression de toutes les images Docker..."
sudo docker rmi -f $(sudo docker images -q)

# Supprimer le cache Docker
echo "Suppression du cache Docker..."
sudo docker system prune -a --volumes

# Supprimer tous les volumes Docker
echo "Suppression de tous les volumes Docker..."
sudo docker volume rm $(sudo docker volume ls -q)
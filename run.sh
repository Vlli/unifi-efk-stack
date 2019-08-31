#!/bin/bash
cd "$(dirname "$0")"
echo "Creating data directories if not existing"
mkdir -p ./data/elasticsearch
echo "Starting up compose stack"
docker-compose up --force-recreate -d 

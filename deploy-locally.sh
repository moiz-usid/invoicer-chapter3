#!/bin/bash

echo "Stopping any running invoicer containers..."
docker stop invoicer-container || true
docker rm invoicer-container || true

echo "Building Docker image..."
docker build -t invoicer-local .

echo "Running Docker container..."
docker run -d --name invoicer-container -p 8080:8080 invoicer-local

echo "Deployment successful! The application is now running on http://localhost:8080"
